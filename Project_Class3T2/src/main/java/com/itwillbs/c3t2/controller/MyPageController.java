package com.itwillbs.c3t2.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.UserOrderVO;
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	//mypageMapping
	@GetMapping("MypageDashboard")				//마이페이지 홈
	public String mypageDashboard() {
		return "mypage/mypage_dashboard";
	}
	
	@GetMapping("MypageBasket")				// 나의 관심정보 - 장바구니
	public String mypageBasket() {
		return "mypage/mypage_basket";
	}
	
	@GetMapping("MypageZzim")					//나의 관심정보 - 찜
	public String mypageZzim() {
		return "mypage/mypage_zzim";
	}
	
	@GetMapping("MypageCheckCancel")			//나의 주문정보 - 취소/반품 내역
	public String mypageCheckCancel() {
		return "mypage/mypage_check_cancel";
	}
	
	@GetMapping("MypageCheckOrder")			//나의 주문정보 - 주문 조회
	public String mypageCheckOrder() {
		return "mypage/mypage_check_order";
	}
	
	@GetMapping("MypageCheckPay")				//나의 주문정보 - 결제 내역
	public String mypageCheckPay() {
		return "mypage/mypage_check_pay";
	}
	
	@GetMapping("MypageGoodsReview")			//나의 활동정보 - 상품 리뷰
	public String mypageGoodsReview() {
		return "mypage/mypage_goods_review";
	}
	@GetMapping("MypageMemberModify")			//나의 정보관리 - 개인정보 수정 전 비번입력
	public String mypageMemberModify() {
		return "mypage/mypage_member_modify";
	}
	@GetMapping("MypageMemberModify2")			//나의 정보관리 - 개인정보 수정
	public String mypageMemberModify2() {
		return "mypage/mypage_member_modify2";	
	}
	@GetMapping("MypageMemberOut")			//나의 정보관리 - 회원 탈퇴 전 비번입력
	public String mypageMemberOut() {
		return "mypage/mypage_member_out";
	}
	@GetMapping("MypageMemberOut2")			//나의 정보관리 - 회원 탈퇴
	public String mypageMemberOut2() {
		return "mypage/mypage_member_out2";
	}
	@GetMapping("MypagePasswdChange")			//나의 정보관리 - 비밀번호 변경 전 비번입력
	public String mypagePasswdChange() {
		return "mypage/mypage_passwd_change";
	}
	@GetMapping("MypagePasswdChange2")		//나의 정보관리 - 비밀번호 변경
	public String mypagePasswdChange2() {
		return "mypage/mypage_passwd_change2";
	}
	@GetMapping("MypageReservationAsk")		//나의 정보관리 - 회원 탈퇴
	public String mypageReservationAsk() {
		return "mypage/mypage_reservation_ask";
	}
	@GetMapping("MypageReservationChange")	//나의 예약정보 - 예약 변경 전 비번입력
	public String mypageReservationChange() {
		return "mypage/mypage_reservation_change";
	}
	
	@GetMapping("/MypageReservationCheck")	//상품 구매 내역
	public String mypageReservationCheck(Model model) {
		
		//상품 구매 내역을 가져옴
		List<UserOrderVO> OrderList = service.getOrderList();
		System.out.println(OrderList);
		model.addAttribute("OrderList", OrderList);
		
		return "mypage/mypage_reservation_check";
	}
	
	@GetMapping("MypagePoint")				//회원 상새내역
	public String mypagePoint(MemberVO member, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("sId");
		MemberVO dbMember = service.getMemberDetails(member_id);
		model.addAttribute("Member", dbMember);
		System.out.println(dbMember);
		
		return "mypage/mypage_point";
	}
	
	
	
}
