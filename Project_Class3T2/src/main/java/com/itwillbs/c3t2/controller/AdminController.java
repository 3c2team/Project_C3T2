package com.itwillbs.c3t2.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c3t2.service.AdminService;
import com.itwillbs.c3t2.service.CartService;
import com.itwillbs.c3t2.vo.AdminVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductVO;


@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private CartService cartService;
	
//	로그인관리(관리자)
	@GetMapping("AdminFailLogin")
	public String failLogin(Model model) {
		
		model.addAttribute("msg","로그인이 필요합니다");

		return "admin_not_login";
	}
	//연매출 페이지 이동(관리자)
    @GetMapping("AdminSalesYear")
    public String adminSalesYear(HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	
    	return "admin/admin_sales_years";
    }
                                                                                         
    //달매출 페이지 이동(관리자)
    @GetMapping("AdminSalesMonth")
    public String adminSalesMonth(HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	
    	return "admin/admin_sales_month";
    }
    
    //일매출 페이지 이동(관리자)
    @GetMapping("AdminSalesDay")
    public String adminSalesDay(HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	
    	return "admin/admin_sales_day";
    }
    
    //상품별 매출 페이지 이동(관리자)
    @GetMapping("AdminSalesProduct")
    public String adminSalesProduct(Model model,HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	
    	List<Map<String, Object>> productList = service.getproductList();
    	
    	model.addAttribute("productList",productList);
    	
    	return "admin/admin_sales_product";
    }
    
    //상품리스트 페이지 이동(관리자)
    @GetMapping("AdminProductList")
    public String adminProductList(Model model,HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	
    	List<Map<String, Object>> productList = service.getproductList();
    	model.addAttribute("productList",productList);
    	return "admin/admin_product_list";
    }
    
    //상품 등록 페이지 이동(관리자)
    @GetMapping("AdminProductRegist")
    public String adminProductRegist(@RequestParam(required = false) List<Integer> product_nums) {
    	
    	return "admin/admin_product_regist";
    }

    
    @PostMapping("AdminProductRagistPro")
    public String adminProductRagistPro(
    		  @RequestParam Map<String, Object> map
    		, @RequestParam(value = "product_main_image", required = false) MultipartFile mainFile
    		, @RequestParam(value = "product_info_image", required = false) MultipartFile infoFile
    		, @RequestParam(value = "product_image", required = false) List<MultipartFile> subFiles
    		, Model model, HttpSession session
    		, HttpServletRequest request) {
    	
    	String id = (String)session.getAttribute("sId");
    	if(id == null || id.equals("")) return "redirect:/AdminFailLogin";
    	
	    	int deleteProductImgCount = 0;
			int deleteCartCount = 0;
			int deleteProductCount = 0;
		
    	if(mainFile.getOriginalFilename().equals("")||infoFile.getOriginalFilename().equals("")) {
    		model.addAttribute("msg","파일을 등록하시오");
    		
    		return "fail_back";
    	}
    	
    	if(map.get("product_num")!=null) { // 상품 수정
    		Path path = null;
    		String item = (String)map.get("product_num");
    		String uploadDir = "/store_img/";//가상 업로드 경로
        	String saveDir = session.getServletContext().getRealPath(uploadDir).replace("Project_Class3T2/", ""); //실제 업로드 경로
    		int product_num = Integer.parseInt(item); 
    		
    		List<Map<String, Object>> selecteProductImg = service.getproductImg(product_num);
    		
    		ProductVO product = service.getproduct(product_num);
    		
			try {
				for(Map<String, Object> imgMap : selecteProductImg) { // 서브 이미지 삭제
			
	    		path = Paths.get(saveDir + "/" +imgMap.get("product_image"));
	    		Files.deleteIfExists(path);
	    		
				}
				//메인 이미지 삭제
				path = Paths.get(saveDir + "/" +product.getProduct_main_img());
				Files.deleteIfExists(path);
				
				deleteProductImgCount = service.deleteProductImg(product_num);
				deleteCartCount = cartService.deleteCartProduct(product_num);
				deleteProductCount = service.deleteProduct(product_num);

			} catch (Exception e) {
	    		// TODO Auto-generated catch block
	    		e.printStackTrace();
	    	}
			
    	}
    	
    	String uploadDir = "/store_img/";//가상 업로드 경로
    	String saveDir = session.getServletContext().getRealPath(uploadDir).replace("Project_Class3T2/", "");//실제 업로드 경로
    	
		try {
			
			String uuid = UUID.randomUUID().toString(); //겹치지 않게 랜덤 선언
			String mainFileName = uuid.substring(0, 3) + "_" + mainFile.getOriginalFilename();
			// 맵에 이름과 경로 전달
			//실제 파일 이름과 uuid랜덤합쳐서 겹치는걸 방지
			map.put("main_file_name", mainFileName);
			map.put("upload_dir", uploadDir +mainFileName);
			
			int insertProductCount = service.registProduct(map);
			if(insertProductCount == 0) {// 상품 등록 실패시
				model.addAttribute("msg","상품등록 실패");
				return "fail_back";
			}
			
			Path path = Paths.get(saveDir);//경로 저장
			Files.createDirectories(path);//중간 경로 생성
			
			mainFile.transferTo(new File(saveDir, mainFileName));
			//업로드 진행 (메인 이미지 끝)
			
			//인포 이미지 업로드 시작
			String infoFileName = uuid.substring(0, 3) + "_info" + infoFile.getOriginalFilename();
			//겹치지않게 이름 생성
			
			map.put("info_file_name", infoFileName);
			map.put("upload_dir", uploadDir +infoFileName);
			//상품 내용 이미지 저장
			int insertProductImgCount = service.registProductImg(map);
			//맵에 경로 및 이름 추가

			

			infoFile.transferTo(new File(saveDir, infoFileName));
			//업로드 진행 (인포 이미지 끝)
			
			
			
			for(MultipartFile subFile : subFiles) {
				String subFileName = uuid.substring(0, 3) + "_" + subFile.getOriginalFilename();
				
				map.put("info_file_name", subFileName);
				map.put("upload_dir", uploadDir +subFileName);
				insertProductImgCount = service.registProductImg(map);
				
				subFile.transferTo(new File(saveDir, subFileName));
				if(insertProductImgCount == 0) {
					model.addAttribute("msg","상품등록은 성공했지만 이미지에서 실패함");	
					return "fail_back";	//상풍등록만 성공시
				}	
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("msg","등록 완료되었습니다!");
		return "success_close";//전체 성공시
			
    }
//    상품 삭제 메서드(관리자)
    @PostMapping("DeleteProductPro")
    	public String deleteProduct(@RequestParam(value = "checkbox")  List<Integer> product_nums
    										, HttpSession session) {
    	System.out.println(product_nums);
    	String uploadDir = "/store_img/";//가상 업로드 경로
    	String saveDir = session.getServletContext().getRealPath(uploadDir).replace("Project_Class3T2/", "");
    	System.out.println("fdsfdsfdsf : " + saveDir);
    	Path path = null;
    	try {
    		for(int product_num : product_nums) {
        		List<Map<String, Object>> selecteProductImg = service.getproductImg(product_num);
        		ProductVO product = service.getproduct(product_num);
			
				for(Map<String, Object> imgMap : selecteProductImg) {
					System.out.println("등록된 파일명 : " + imgMap.get("product_image"));
				
		    		path = Paths.get(saveDir + "/" +imgMap.get("product_image"));//실제 업로드 경로
		    		Files.deleteIfExists(path);
    	    		
				}
				path = Paths.get(saveDir + "/" +product.getProduct_main_img());//실제 업로드 경로
				Files.deleteIfExists(path);
				int deleteProductImgCount = service.deleteProductImg(product_num);
				System.out.println("성공1");
				int deleteCartCount = cartService.deleteCartProduct(product_num);
				System.out.println("성공2");
				int deleteFavorite = service.deleteFavorite(product_num);
				System.out.println("성공3");
				int deleteProductCount = service.deleteProduct(product_num);
				System.out.println("성공4");
			}
    	} catch (IllegalStateException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (IOException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}

		return "redirect:/AdminProductList";
    }
//    예약 리스트 페이지 이동(관리자)
    @GetMapping("AdminReservationList")
    public String adminReservationList(Model model,HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	List<Map<String, Object>> ReservationList = service.getReservationList();
    	model.addAttribute("ReservationList",ReservationList);
    	return "admin/admin_reservation_list";
    }
    

  
//  예약 삭제 처리(관리자)
  @PostMapping("AdminReservationDeletePro")
  public String adminReservationDeletePro(Model model,@RequestParam int[] checkbox) {
	  for(int check : checkbox) {
		  System.out.println("dfdfdf" + check);
	  }
	  
	  for(int check : checkbox) {
		int updateReservationCount = service.updateReservation(check);
		if(updateReservationCount == 0) {
			model.addAttribute("msg","삭제 실패하였습니다.");
			return "fail_back";
					
		}
	}
	return "redirect:/AdminReservationList";
  }
  
    
    //리뷰 삭제 페이지 이동(관리자)
    @GetMapping("AdminReviewDelete")
    public String adminReviewDelete(Model model,HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	List<Map<String, Object>> selectReviewList = service.selectReviewList();
    	System.out.println("리뷰 리스트 : " + selectReviewList);
    	model.addAttribute("selectReviewList", selectReviewList);
    	return "admin/admin_review_delete";
    }
    //리뷰 삭제 처리(관리자)
    @PostMapping("AdminReviewDeletePro")
    public String AdminReviewDeletePro(@RequestParam(value = "checkbox",required = false) List<Integer> list
    									, Model model
    									, HttpSession session) {
    	int deleteReviewCount = 0;
    	System.out.println(list);
    	for(int review_num : list) {
    		Map<String, Object> selectReview = service.selectReview(review_num);
    		deleteReviewCount = service.deleteReview(review_num);
    		
    		if(deleteReviewCount == 0) {
    			model.addAttribute("msg","삭제에 실패했습니다.");
    			return "fail_back";
    		}
    		try {
				String uploadDir = "/review_img"; // 가상의 경로
				String saveDir = session.getServletContext().getRealPath(uploadDir).replace("Project_Class3T2/", ""); // 실제 경로
				
				Path path = Paths.get(saveDir + "/" + selectReview.get("review_image"));
				Files.deleteIfExists(path);
				//이미지 이름 uuid상관없음 db에 파일 이름으로 차피 저장되어 있으니 그걸로 가져오면됨
			
    		} catch (IOException e) {
    			e.printStackTrace();
    			
    		}
		}
    	
    	return "redirect:/AdminReviewDelete";
    }
    
    //회원 정보 페이지 이동(관리자)
    @GetMapping("AdminMember")
    public String adminMember(Model model,HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	List<MemberVO> MemberList = service.selectMemberList();
    	Map<String, Integer> selectMemberOut= service.selectMemberOut();
    	model.addAttribute("selectMemberOut",selectMemberOut);
    	model.addAttribute("memberList",MemberList);
    	return "admin/admin_member";
    }
    
    //공지사항 페이지 이동(관리자)
    @GetMapping("AdminNoticeBoard")
    public String adminNoticeBoard(Model model,HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	List<Map<String, Object>> selectNoticeList = service.selectNoticeList();
    	model.addAttribute("selectNoticeList", selectNoticeList);
    	return "admin/admin_notice_board";
    }
    
    //공지사항 등록 페이지 이동(관리자)
    @GetMapping("AdminNoticeRegist")
    public String adminNoticeRegist() {
    	return "admin/admin_notice_regist";
    }
    //공지사항 등록 처리(관리자)
    @PostMapping("AdminNoticeRegistPro")
    public String adminNoticeRegist(@RequestParam Map<String, String> map
    											,Model model) {
    	System.out.println(map);
    	int insertNoticeCount = service.insertNotice(map);
    	if(insertNoticeCount == 0) return "fail_back";
    	model.addAttribute("msg","등록 완료되었습니다.");
    	return "success_close";
    }
    //공지사항 삭제 처리(관리자)
    @PostMapping("AdminNoticeDelete")
    public String adminNoticeDelete(@RequestParam(required = false, value = "checkbox") List<Integer> list) {
    	int deleteNoticeCount = 0;
    	for(int notice_num : list) {
    		deleteNoticeCount = service.deleteNotice(notice_num);
    		if(deleteNoticeCount == 0) return "fail_back()";
    	}
    		
    	
    	return "redirect:/AdminNoticeBoard";
    }
    
    //문의 리스트 페이지 이동(관리자)
    @GetMapping("AdminQnaBoard")
    public String adminQnaBoard(Model model,
    							HttpSession session) {
    	String sId = (String)session.getAttribute("sId");
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	List<Map<String, Object>> QnaBoardList = service.selectQnaBoardList();
    	System.out.println("확인 작업" + QnaBoardList);
    	model.addAttribute("QnaBoardList",QnaBoardList);
    	return "admin/admin_qna_board";
    }
    
    //문의 답변 페이지 이동(관리자)
    @GetMapping("AdminQnaAnswer")
    public String adminQnaAnswer(Model model,String question_num) {
    	Integer.parseInt(question_num);
    	System.out.println(question_num);
    	
    	Map<String, Object> QnaBoardDetail = service.selectQnaBoard(Integer.parseInt(question_num));
    	model.addAttribute("QnaBoardDetail",QnaBoardDetail);
    	return "admin/admin_qna_answer";
    }
    //문의 답변 처리(관리자)
    @PostMapping("AdminQnaAnswerPro")
    public String adminQnaAnswerPro(Model model
    							,@RequestParam Map<String, Object> map){
    	System.out.println(map);
    	int updqteQnaCount = service.updateQnaBoard(map);
    	if(updqteQnaCount == 0) {
    		model.addAttribute("msg","등록에 실패하였습니다");
    		return "fail_back";
    	}
    	model.addAttribute("msg","등록 완료되었습니다");
    	return "success_close";
    }

    //상품 수정 페이지 이동(관리자)
    @GetMapping("AdminProductUpdate")
    public String adminProductUpdate(Model model,int product_num) {
//    	System.out.println("번호:" + product.getProduct_num());
    	ProductVO dbProduct = service.getproduct(product_num);//하나 들고옴
    	
    	List<Map<String,Object>> dbProductImg = service.getproductImg(product_num);//이미지다들고옴
    	
    	model.addAttribute("dbProduct",dbProduct);//저장후 들고가기
    	model.addAttribute("dbProductImg",dbProductImg);//저장후 들고가기
//    	System.out.println(dbProduct);
//    	System.out.println(dbProductImg);
    	return "admin/admin_product_update";
    }
    //상품 자세히보기 페이지 이동(관리자)
    @GetMapping("AdminProductDetail")
    public String adminProductDetail(Model model,int product_num) {
//    	System.out.println("번호:" + product.getProduct_num());
    	ProductVO dbProduct = service.getproduct(product_num);//하나 들고옴
    	
    	List<Map<String,Object>> dbProductImg = service.getproductImg(product_num);//이미지다들고옴
    	
    	model.addAttribute("dbProduct",dbProduct);//저장후 들고가기
    	model.addAttribute("dbProductImg",dbProductImg);//저장후 들고가기
//    	System.out.println(dbProduct);
//    	System.out.println(dbProductImg);
    	return "admin/admin_product_detail";
    }
    
    //로그인 페이지 이동(관리자)
    @GetMapping("AdminLogin")
    public String adminLogin(HttpSession session) {
    	session.invalidate();
    	return "admin/admin_login";
    }
    
    //로그인 판별 작업(관리자)
    @GetMapping("AdminLoginPro")
    public String AdminLoginPro(AdminVO admin,Model model,HttpSession session) {
    	
    	AdminVO dbAdmin = service.getAdmin(admin);
    	
    	if(dbAdmin == null||!admin.getAdmin_passwd().equals(dbAdmin.getAdmin_passwd())) {
    		
    		model.addAttribute("msg","아이디 혹은 비밀번호가 틀렸습니다.");
    		return "fail_back";
    	}else {
    		session.setAttribute("sId", dbAdmin.getAdmin_id());
    		session.setAttribute("sName", dbAdmin.getAdmin_name());
    		return "redirect:/AdminMain";
    	}
    }
    //로그아웃 처리(관리자)
    @GetMapping("AdminLogout")
    public String adminLogout(HttpSession session) {
    	session.invalidate();
    	return "admin/admin_login";
    }
    
    //메인 페이지 이동(관리자)
    @GetMapping("AdminMain")
    public String adminEventList(HttpSession session, Model model) {
    	
    	
    	String sId = (String)session.getAttribute("sId");
    	String sName = (String)session.getAttribute("sName");
    	
    	if(sId == null || sId.equals("")) return "redirect:/AdminFailLogin";
    	
    	Map<String, Object> selectRestaurant = service.selectRestaurant(sId);
    	if(selectRestaurant.get("restaurant_num") == null) {
    		model.addAttribute("msg","잘못된 요청입니다.");
    		return "fail_back";
    	}
    	String phons = (String)selectRestaurant.get("restaurant_call");
    	
    	System.out.println(phons.toString());
    	for(int i = 0; i < phons.split("-").length;i++) {
    		selectRestaurant.put("phon" + i, phons.split("-")[i]);
    	}
    	System.out.println("fdafa : "+selectRestaurant.get("phon"));
    	System.out.println("결과값 : " + selectRestaurant);
    	selectRestaurant.put("sName", sName);
    	model.addAttribute("selectRestaurant",selectRestaurant);
    	
    	
    	return "admin/admin_main";
    }
    //가계정보 수정 및 등록 처리(관리자)
    @PostMapping("AdminRestaurantUpdatePro")
    public String adminRestaurantUpdatePro(Model model,HttpSession session
							    			,@RequestParam Map<String, Object> map) {
    	
    	String sId = (String)session.getAttribute("sId");
    	System.out.println("fdfdf : " + map);
    	if(map.get("admin_id") == null) {
	    	if(sId==null||sId.equals("")) {
	    		model.addAttribute("msg","로그인이 필요합니다");
	    		return "fail_back";
	    	}
	    	
	    	int restaurantUpdate = service.restaurantUpdate(map);
	    	
	    	if(restaurantUpdate == 0) {
	    		model.addAttribute("msg","수정에 실패하였습니다.");
	    		return "fail_back";
	    	}
	    	return "redirect:/AdminMain";
    	}
    	int insertRestaurant = service.insertRestaurant(map);
    	if(insertRestaurant == 0) {
    		model.addAttribute("msg","가게 등록에 실패하였습니다.");
    		return "fail_back";
    	}
    	int insertAdmin = service.insertAdmin(map);
    	if(insertAdmin == 0) {
    		model.addAttribute("msg","관리자 정보 등록에 실패하였습니다.");
    		return "fail_back";
    	}
    	return "redirect:/AdminMain";
    }
    //이벤트 등록 페이지 이동(관리자)
//    @GetMapping("AdminEventRegist")
//    public String adminEventRegist() {
//    	return "admin/admin_event_regist";
//    }
    //이벤트 삭제 처리(관리자)
//    @PostMapping("AdminDeleteEventPro")
//    public String adminEventDeletePro(Model model
//    		,@RequestParam(value = "checkbox") List<Integer> list
//    		,HttpSession session) {
//    	
//    	System.out.println("넘버 넘버"+list);
//    	String uploadDir = "/event_img/";//가상 업로드 경로
//    	String saveDir = session.getServletContext().getRealPath(uploadDir).replace("Project_Class3T2/", "");
//    	Path path = null;
//    	try {
//    		for(int event_num : list) {
//        		Map<String, Object> selectEvent = service.selectEvent(event_num);
//        		int deleteEvent = service.deleteEvent(event_num);
//        		if(deleteEvent == 0) {
//        			model.addAttribute("msg","삭제 실패");
//        			return "fail_back";
//        		}
//				System.out.println("등록된 파일명 : " + selectEvent.get("event_image"));
//			
//	    		path = Paths.get(saveDir + "/" + selectEvent.get("event_image"));//실제 업로드 경로
//	    		Files.deleteIfExists(path);
//    	    		
//			}
//    	} catch (IllegalStateException e) {
//    		// TODO Auto-generated catch block
//    		e.printStackTrace();
//    	} catch (IOException e) {
//    		// TODO Auto-generated catch block
//    		e.printStackTrace();
//    	}
//
//    	return "redirect:/AdminEventList";
//    }
    //js 파일에 들고가는 탈퇴사유 셀렉(관리자)
    @ResponseBody
	@PostMapping("/AdminSelectReson")
    public Map<String, Integer> selectReson() {
    	Map<String, Integer> selectMemberOut= service.selectMemberOut();
    	System.out.println("dfdfd" + selectMemberOut);
    return selectMemberOut;
    }
    @ResponseBody
    @PostMapping("/AdminSelectOutDate")
    public List<Map<String, Integer>> adminSelectOutDate() {
    	List<Map<String, Integer>> AdminSelectOutDate= service.selectOutDate();
    	System.out.println("결과값 : " + AdminSelectOutDate);
    	return AdminSelectOutDate;
    }
    @ResponseBody
    @PostMapping("/AdminSelectYearDate")
    public List<Map<String, Integer>> adminSelectYearDate() {
    	List<Map<String, Integer>> adminSelectYearDate= service.selectYearDate();
    	System.out.println("결과값 : " + adminSelectYearDate);
    	return adminSelectYearDate;	
    }
    @ResponseBody
    @PostMapping("/AdminSelectMonthDate")
    public List<Map<String, Integer>> adminSelectMonthDate(int year) {
    	System.out.println("dfsf" + year);
    	
    	List<Map<String, Integer>> adminSelectMonthDate= service.selectMonthDate(year);
    	System.out.println("결과값 : " + adminSelectMonthDate);
    	return adminSelectMonthDate;	
    }
    @ResponseBody
    @PostMapping("/AdminSelectHourDate")
    public List<Map<String, Integer>> adminSelectHourDate(int day) {
    	System.out.println("dfsf" + day);
    	
    	List<Map<String, Integer>> adminSelectHourDate= service.selectHourDate(day);
    	System.out.println("결과값 : " + adminSelectHourDate);
    	return adminSelectHourDate;	
    }
    @ResponseBody
    @PostMapping("/AdminSelectProductSales")
    public List<Map<String, Integer>> adminSelectProductSales() {
    	
    	List<Map<String, Integer>> adminSelectProductSales= service.selectProductSales();
    	System.out.println("결과값 : " + adminSelectProductSales);
//    	List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
//    	System.out.println("fdfdfdfdfdfdfdfdfd");
    	return adminSelectProductSales;	
    }
}
