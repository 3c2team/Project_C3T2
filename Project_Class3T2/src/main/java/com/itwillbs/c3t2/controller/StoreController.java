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
	// StroerMain 페이지
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
	// Best 페이지
	@GetMapping("StoreBest")
	public String best(Model model) {
		List<ProductVO> bestList = service.getProductbestList();
		model.addAttribute("bestList", bestList);
		return "store/store_best";
	}
	// Hot 페이지
	@GetMapping("StoreHot")
	public String storeHot(Model model) {
		List<ProductVO> hotList = service.getProductHotList();
		model.addAttribute("hotList", hotList);
		return "store/store_hot";
	}
	// New 페이지
	@GetMapping("StoreNew")
	public String storeNew(Model model) {
		List<ProductVO> newList = service.getProductNewList();
		model.addAttribute("newList", newList);
		return "store/store_new";
	}
	// Category 페이지
	@GetMapping("StoreKit")
	public String storeKit(Model model, String category) {
		List<ProductVO> proList = null;
		if(category == null || category.equals("")) {
			proList = service.getProductNewList();
			model.addAttribute("proList", proList);
			return "store/store_kit";
		}
		// String으로 받은 카테고리 파라미터 값을 DB의 int 값에 맞춰 변환
		int category_num = 0;
		switch (category) {
			case "Steak": category_num = 1; break;
			case "Pasta": category_num = 2; break;
			case "Soup": category_num = 3; break;
			case "ets": category_num = 4; break;
		}
		
		if(category_num > 0) {
			proList = service.getProductCategoryList(category_num);
		}
		model.addAttribute("proList", proList);
		return "store/store_kit";
		
	}
	
	// 상세페이지
	@GetMapping("ProductDetail")
	public String productDetail(HttpSession session, int proNum, Model model, @RequestParam Map<String, Object> param) {
		param.put("sId", session.getAttribute("sId"));
		// 상품 정보 조회
		Map<String, Object> productDetail = service.getProductDetail(param);
		// 이미지 조회
		List<ProductImgVO> productImgList = service.getProductImg(proNum);
		
		// productImgList에서 가지고 온 객체를 판별하여 info 이미지는 productInfoImg에,
		// 미니 이미지는 productImgList 저장 후 전송
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
		// 리뷰조회
		List<ReviewVO> reviewList = service.getReviewList(proNum);
		double reviewCount = reviewList.size();	// 총 리뷰 갯수
		double sumReviewStar = 0;	// 별점 합
		// 별점 평균 값 계산
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
		// 문의하기 조회
		List<QnAVO> QnAList = service.getQnAList(proNum);
		model.addAttribute("QnAList", QnAList);
		
		return "store/product_detail";
	}
	
	// 리뷰작성폼
	@GetMapping("ReviewFrom")
	public String reviewFrom(@RequestParam Map<String, Object> param, HttpSession session,  Model model) {
		param.put("sId", session.getAttribute("sId"));
		Map<String, Object> product = service.getProductDetail(param);
		String id = session.getAttribute("sId").toString();
		
		// 로그인X 경우 close 처리
		if(id == null || id.equals("")) {
			model.addAttribute("msg", "리뷰를 작성하시려면 로그인해주세요.");
			return "store/popup/close";
		}
		
		model.addAttribute("product", product);
		return "store/popup/review_from";
	}
	
	// 리뷰작성폼 Pro
	@PostMapping("ReviewPro")
	public String reviewPro( @RequestParam Map<String, Object> map
							,@RequestParam(value = "file", required=false) MultipartFile file
							, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		String uploadDir = "/review_img/"; //가상 경로
		String saveDir = session.getServletContext().getRealPath(uploadDir).replace("Project_Class3T2/", ""); //실제 경로
		
		// 로그인X 처리
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "store/popup/close";
		}
		
//		//===================== < 이미지 처리 > ===================== 
//		//--------------------- < 이미지 경로 > ---------------------
//		// 서브디렉토리명 저장 yyyy/MM/dd 형식
		String subDir = "";
		try {
			LocalDate now = LocalDate.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
			subDir = now.format(dtf);
			saveDir += subDir;
			
			Path path = Paths.get(saveDir);
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		//-------------------- < 이미지명 처리 > --------------------
		String uuid = UUID.randomUUID().toString();
		String fileName =  UUID.randomUUID().toString().substring(0, 3) + "_" + file.getOriginalFilename();
		
		if(file == null || file.getOriginalFilename().equals("")) {
			map.put("file_name", "");
		} else {
			map.put("file_name", uploadDir + subDir + "/" + fileName);
		}
		map.put("member_id", sId);
//		//------------------ < 게시물 등록 처리 > -------------------
		
		int insertCount = service.registReview(map);
//		
		try {
			if(insertCount > 0) { //성공
				if(file != null && !(file.getOriginalFilename().equals(""))) {
					file.transferTo(new File(saveDir, fileName));
				}
				model.addAttribute("msg", "리뷰를 등록했습니다.");

				return "store/popup/popup_pro";
			} 
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//-----------------------------------------------------------
		model.addAttribute("msg", "리뷰등록을 실패했습니다.");
		return "store/popup/close";
		//============================================================
	}
	
	// 문의하기 작성폼
	@GetMapping("QuestionFrom")
	public String questionFrom(int proNum, HttpSession session, Model model) {
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "문의하시려면 로그인해주세요.");
			return "store/popup/close";
		}
		return "store/popup/question_from";
	}
	
	// 문의하기 작성폼 Pro
	@PostMapping("QuestionPro")
	public String questionPro(QnAVO question, HttpSession session, Model model) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "store/popup/close";
		}
		
		System.out.println("question.getProduct_num()" + question.getProduct_num());
		int insertCount = service.registQuestion(question);
		
		if(insertCount > 0) {
			return "store/popup/popup_pro";
		} else {
			model.addAttribute("msg", "문의글 등록을 실패했습니다.");
			return "stoer/popup/close";
		}
	}
	
	// 관심상품 등록
	@ResponseBody
	@PostMapping("AddFavorite")
	public String addFavorite(@RequestParam Map<String, Object> param, HttpSession session) {
		int insertCount = service.registFavorite(param);
		return "on";
	}
	
	// 관심상품 삭제
	@ResponseBody
	@PostMapping("RemoveFavorite")
	public String removeFavorite(@RequestParam Map<String, Object> param, HttpSession session) {
		int deleteCount = service.deleteFavorite(param);
		return "off";
	}
}
