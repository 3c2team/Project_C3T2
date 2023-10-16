package com.itwillbs.c3t2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	//연매출 페이지 이동(관리자)
    @GetMapping("adminSalesYear")
    public String adminSalesYear() {
       return "admin/admin_sales_years";
    }
    
    //달매출 페이지 이동(관리자)
    @GetMapping("adminSalesMonth")
    public String adminSalesMonth() {
       return "admin/admin_sales_month";
    }
    
    //일매출 페이지 이동(관리자)
    @GetMapping("adminSalesDay")
    public String adminSalesDay() {
       return "admin/admin_sales_day";
    }
    
    //상품별 매출 페이지 이동(관리자)
    @GetMapping("adminSalesProduct")
    public String adminSalesProduct() {
       return "admin/admin_sales_product";
    }
    
    //상품리스트 페이지 이동(관리자)
    @GetMapping("adminProductList")
    public String adminProductList() {
       return "admin/admin_product_list";
    }
    
    //상품 등록 페이지 이동(관리자)
    @GetMapping("adminProductRegist")
    public String adminProductRegist() {
       return "admin/admin_product_regist";
    }
    
    //예약 리스트 페이지 이동(관리자)
    @GetMapping("adminReservationList")
    public String adminReservationList() {
       return "admin/admin_reservation_list";
    }
    
    //리뷰 답변등록 페이지 이동(관리자)
    @GetMapping("adminReviewAnswer")
    public String adminReviewAnswer() {
       return "admin/admin_review_answer";
    }
    
    //리뷰 삭제 페이지 이동(관리자)
    @GetMapping("adminReviewDelete")
    public String adminReviewDelete() {
       return "admin/admin_review_delete";
    }
    
    //회원 정보 페이지 이동(관리자)
    @GetMapping("adminMember")
    public String adminMember() {
       return "admin/admin_member";
    }
    
    //공지사항 페이지 이동(관리자)
    @GetMapping("adminNoticeBoard")
    public String adminNoticeBoard() {
       return "admin/admin_notice_board";
    }
    
    //공지사항 등록 페이지 이동(관리자)
    @GetMapping("adminNoticeRegist")
    public String adminNoticeRegist() {
       return "admin/admin_notice_regist";
    }
    
    //문의 리스트 페이지 이동(관리자)
    @GetMapping("adminQnaBoard")
    public String adminQnaBoard() {
       return "admin/admin_qna_board";
    }
    //문의 답변 페이지 이동(관리자)
    @GetMapping("adminQnaAnswer")
    public String adminQnaAnswer() {
       return "admin/admin_qna_answer";
    }
    //문의내역 자세히보기 페이지 이동(관리자)
    @GetMapping("adminQnaDetail")
    public String adminQnaDetail() {
       return "admin/admin_qna_detail";
    }
    

}
