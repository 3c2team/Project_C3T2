package com.itwillbs.c3t2.controller;


import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.c3t2.service.AdminService;
import com.itwillbs.c3t2.vo.AdminVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.ReservationVO;


@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	//연매출 페이지 이동(관리자)
    @GetMapping("AdminSalesYear")
    public String adminSalesYear() {
    	return "admin/admin_sales_years";
    }
    
    //달매출 페이지 이동(관리자)
    @GetMapping("AdminSalesMonth")
    public String adminSalesMonth() {
    	return "admin/admin_sales_month";
    }
    
    //일매출 페이지 이동(관리자)
    @GetMapping("AdminSalesDay")
    public String adminSalesDay() {
    	return "admin/admin_sales_day";
    }
    
    //상품별 매출 페이지 이동(관리자)
    @GetMapping("AdminSalesProduct")
    public String adminSalesProduct() {
    	return "admin/admin_sales_product";
    }
    
    //상품리스트 페이지 이동(관리자)
    @GetMapping("AdminProductList")
    public String adminProductList(Model model) {
    	
    	List<ProductVO> productList = service.getproductList();
    	System.out.println(productList);
    	model.addAttribute("productList",productList);
    	return "admin/admin_product_list";
    }
    
    //상품 등록 페이지 이동(관리자)
    @GetMapping("AdminProductRegist")
    public String adminProductRegist() {
    	return "admin/admin_product_regist";
    }
    
    //예약 리스트 페이지 이동(관리자)
    @GetMapping("AdminReservationList")
    public String adminReservationList(Model model) {
    	List<ReservationVO> ReservationList = service.getReservationList();
    	System.out.println(ReservationList);
    	model.addAttribute("ReservationList",ReservationList);
    	return "admin/admin_reservation_list";
    }
    
    //리뷰 답변등록 페이지 이동(관리자)
    @GetMapping("AdminReviewAnswer")
    public String adminReviewAnswer() {
    	return "admin/admin_review_answer";
    }
    
    //리뷰 삭제 페이지 이동(관리자)
    @GetMapping("AdminReviewDelete")
    public String adminReviewDelete() {
    	return "admin/admin_review_delete";
    }
    
    //회원 정보 페이지 이동(관리자)
    @GetMapping("AdminMember")
    public String adminMember(Model model) {
    	List<MemberVO> MemberList = service.selectMemberList();
    	System.out.println(MemberList);
    	model.addAttribute("memberList",MemberList);
    	return "admin/admin_member";
    }
    
    //공지사항 페이지 이동(관리자)
    @GetMapping("AdminNoticeBoard")
    public String adminNoticeBoard() {
    	return "admin/admin_notice_board";
    }
    
    //공지사항 등록 페이지 이동(관리자)
    @GetMapping("AdminNoticeRegist")
    public String adminNoticeRegist() {
    	return "admin/admin_notice_regist";
    }
    
    //문의 리스트 페이지 이동(관리자)
    @GetMapping("AdminQnaBoard")
    public String adminQnaBoard() {
    	return "admin/admin_qna_board";
    }
    
    //문의 답변 페이지 이동(관리자)
    @GetMapping("AdminQnaAnswer")
    public String adminQnaAnswer() {
    	return "admin/admin_qna_answer";
    }

    //상품 수정 페이지 이동(관리자)
    @GetMapping("AdminProductUpdate")
    public String adminProductUpdate(Model model,int product_num) {
//    	System.out.println("번호:" + product.getProduct_num());
    	ProductVO dbProduct = service.getProduct(product_num);
    	System.out.println("번호 : " + dbProduct.getProduct_num());
    	System.out.println("이름 : " + dbProduct.getProduct_name());
    	model.addAttribute("dbProduct",dbProduct);
    	return "admin/admin_product_update";
    }
    //로그인 페이지 이동(관리자)
    @GetMapping("AdminLogin")
    public String adminLogin() {
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
    		return "admin/admin_sales_years";
    	}
    }
    //로그아웃 처리(관리자)
    @GetMapping("AdminLogout")
    public String adminLogout(HttpSession session) {
    	session.invalidate();
    	return "admin/admin_login";
    }
    

}
