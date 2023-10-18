package com.itwillbs.c3t2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MyPageController {
	
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
	
	@GetMapping("MypageGoodsAsk")				//나의 활동정보 - 상품 문의 내역
	public String mypageGoodsAsk() {
		return "mypage/mypage_goods_ask";
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
	@GetMapping("MypagePoint")					//나의 포인트정보 - 포인트 내역
	public String mypagePoint() {
		return "mypage/mypage_point";
	}
	@GetMapping("MypageReservationChange")	//나의 예약정보 - 예약 변경 전 비번입력
	public String mypageReservationChange() {
		return "mypage/mypage_reservation_change";
	}
	@GetMapping("MypageReservationChange2")	//나의 예약정보 - 예약 변경
	public String mypageReservationChange2() {
		return "mypage/mypage_reservation_change2";
	}
	@GetMapping("MypageReservationCheck")		//나의 예약정보 - 예약 확인
	public String mypageReservationCheck() {
		return "mypage/mypage_reservation_check";
	}
}
