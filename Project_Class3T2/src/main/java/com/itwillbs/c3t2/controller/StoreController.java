package com.itwillbs.c3t2.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c3t2.service.StoreService;
import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.QnAVO;
import com.itwillbs.c3t2.vo.ReviewVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@GetMapping("OnlineStore")
	public String main(Model model) {
		List<ProductVO> bestList = service.getProductbestList();
//		List<ProductVO> hotList = service.getProductHotList();
//		List<ProductVO> newList = service.getProductNewList();
		
		model.addAttribute("bestList", bestList);
//		model.addAttribute("hotList", hotList);
//		model.addAttribute("newList", newList);
		
		
		return "store/store_main";
	}
	
	@GetMapping("StoreBest")
	public String best(Model model) {
		List<ProductVO> bestList = service.getProductbestList();
//		System.out.println(bestList);
		
		model.addAttribute("bestList", bestList);
		return "store/store_best";
	}
	
	@GetMapping("StoreHot")
	public String storeHot(Model model) {
		List<ProductVO> hotList = service.getProductHotList();
//		System.out.println(hotList);
		
		model.addAttribute("hotList", hotList);
		
		return "store/store_hot";
	}
	
	@GetMapping("StoreNew")
	public String storeNew(Model model) {
		List<ProductVO> newList = service.getProductNewList();
//		System.out.println(newList);
		
		model.addAttribute("newList", newList);
		
		return "store/store_new";
	}
	
	@GetMapping("StoreKit")
	public String storeKit(Model model, String category) {
		List<ProductVO> proList = null;
		if(category == null || category.equals("")) {
			proList = service.getProductNewList();
			model.addAttribute("proList", proList);
			
			return "store/store_kit";
		}
		
		int category_num = 0;
		switch (category) {
			case "Steak": category_num = 1; break;
			case "Pasta": category_num = 2; break;
			case "Soup": category_num = 3; break;
			case "ets": category_num = 4; break;
		}
		
		System.out.println("int cate_num: " + category_num);
		System.out.println("Sting cate: " + category);
	
		if(category_num > 0) {
			proList = service.getProductCategoryList(category_num);
		}
		model.addAttribute("proList", proList);
		return "store/store_kit";
		
	}	// 아래 코드 수정 전 까지 임시 사용
	
//	@RequestMapping("/Products")
//	public String category(@RequestParam("category") String category, Model model) {
//	    System.out.println("컨트롤러 왔다");
//		List<ProductVO> categoryList = service.getCategoryList(category);
//		System.out.println("list: " + categoryList);
//	    model.addAttribute("categoryList", categoryList);
//	    return "store/store_kit";
//	}	// 오류 수정중
	
	// 상세페이지~
	@GetMapping("ProductDetail")
	public String productDetail(int proNum, Model model) {
		ProductVO productDetail = service.getProductDetail(proNum);
		List<ProductImgVO> productImgList = service.getProductImg(proNum);
		
		List<ProductImgVO> productMiniImgList = new ArrayList<ProductImgVO>();
		ProductImgVO productInfoImg = new ProductImgVO();
		
		for(ProductImgVO proImg : productImgList ) {
			if(proImg.getProduct_image().contains("info")) {
				productInfoImg = proImg;
			} else {
				productMiniImgList.add(proImg);
			}
		}
		
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productMiniImgList", productMiniImgList);
		model.addAttribute("productInfoImg", productInfoImg);
		
		//=========================================================================
		// 리뷰
		List<ReviewVO> reviewList = service.getReviewList(proNum);
		double reviewCount = reviewList.size();
		double sumReviewStar = 0;
		
		for(ReviewVO review : reviewList) {
			sumReviewStar += review.getReview_star();
		}
		
		double AveReviewStar = sumReviewStar/reviewCount;
		
		if(Double.isNaN(AveReviewStar)) {
			AveReviewStar = 0;
		}
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("AveReviewStar", AveReviewStar);
		model.addAttribute("reviewCount", (int)reviewCount);

		//=========================================================================
		// 문의
		List<QnAVO> QnAList = service.getQnAList(proNum);
		System.out.println(QnAList);
		model.addAttribute("QnAList", QnAList);
		
		return "store/product_detail";
	}
	
//	@ResponseBody
//	@PostMapping("ProductDetailFavorite")
//	public void favorite(FavoriteVO favorite, HttpSession session, HttpServletResponse response) {
//		int insertCount = service.registFavorite(favorite);
//		
//		if(insertCount > 0) {
//			//찜하기 실패
//		}
//	}
	
	// 리뷰작성폼으로 이동~
	@GetMapping("ReviewFrom")
	public String reviewFrom(int proNum, HttpSession session, Model model) {
		ProductVO product = service.getProductDetail(proNum);
		String id = (String)session.getAttribute("sId");
		
		if(id == null || id.equals("")) {
			model.addAttribute("msg", "리뷰를 작성하시려면 로그인해주세요.");
			return "store/popup/close";
		}
		
		model.addAttribute("product", product);
		return "store/popup/review_from";
	}
	
	@PostMapping("ReviewPro")
//	public String reviewPro(ReviewVO review, HttpSession session, Model model, @RequestParam(value = "review_image", required = false) MultipartFile mainFile) {
	public String reviewPro( @RequestParam Map<String, Object> map
							,@RequestParam(value = "file", required=false) MultipartFile file
							, HttpSession session, Model model) {
		
		String sId = (String)session.getAttribute("sId");
		String uploadDir = "/review_img/"; //가상 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir); //실제 경로
		
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "sotre/popup/close";
		}
		
//		//===================== < 이미지 처리 > ===================== 
//		//--------------------- < 이미지 경로 > ---------------------
		
//		if(file.getName().equals("") || file == null) {
//			map.put(uploadDir, saveDir)
//		}
		
//		// 서브디렉토리명 저장 yyyy/MM/dd 형식
		String subDir = "";
		try {
			LocalDate now = LocalDate.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			subDir = now.format(dtf);
			saveDir += subDir;
			
			Path path = Paths.get(saveDir);
			System.out.println(saveDir);
			Files.createDirectories(path);
//			file.transferTo(new File(saveDir, file.getOriginalFilename()));// 경로 생성!
		} catch (IOException e) {
			e.printStackTrace();
		}
//		//-------------------- < 이미지명 처리 > --------------------
		String uuid = UUID.randomUUID().toString();
		System.out.println("uuid" + uuid);
		
		String fileName =  UUID.randomUUID().toString().substring(0, 3) + "_" + file.getOriginalFilename();
		
		if(file.getOriginalFilename() != null || !(file.getOriginalFilename().equals(""))) {
		}
		map.put("file_name", subDir + "/" + fileName);
		map.put("member_id", sId);
		
//		//------------------ < 게시물 등록 처리 > -------------------
		
		System.out.println("**************************************************** map : " + map);
		
//		System.out.println(review);
		int insertCount = service.registReview(map);
//		
		try {
			if(insertCount > 0) { //성공
				System.out.println("리뷰등록 완료");
				file.transferTo(new File(saveDir, fileName));
				model.addAttribute("msg", "리뷰를 등록했습니다.");
				
				return "store/popup/close";
			} 
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//-----------------------------------------------------------
		System.out.println("*****************************************saveDir" + saveDir);
		model.addAttribute("msg", "리뷰등록을 실패했습니다.");
		return "store/popup/close";
		//============================================================
	}
	
	// QnA작성폼으로 이동~
	@GetMapping("QuestionFrom")
	public String questionFrom(int proNum, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "문의하시려면 로그인해주세요.");
			return "store/popup/close";
		}
		
		return "store/popup/question_from";
	}
	
	@PostMapping("QuestionPro")
	public String questionPro(QnAVO question, HttpSession session, Model model) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "store/popup/close";
		}
		
		System.out.println("question.getProduct_num()" + question.getProduct_num());
		int insertCount = service.registQuestion(question);
		
		if(insertCount > 0) {
			return "store/popup/question_pro";
		} else {
			model.addAttribute("msg", "문의글 등록을 실패했습니다.");
			return "stoer/popup/close";
		}
		
	}
}
