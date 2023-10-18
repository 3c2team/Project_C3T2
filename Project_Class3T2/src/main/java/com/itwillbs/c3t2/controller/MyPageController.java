package com.itwillbs.c3t2.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class MyPageController {
	
	//mypageMapping
	@GetMapping("mypageDashboard")				//마이페이지 홈
	public String mypageDashboard() {
		return "mypage/mypage_dashboard";
	}
	
	@GetMapping("mypageBasket")				// 나의 관심정보 - 장바구니
	public String mypageBasket() {
		return "mypage/mypage_basket";
	}
	
	@GetMapping("mypageZzim")					//나의 관심정보 - 찜
	public String mypageZzim() {
		return "mypage/mypage_zzim";
	}
	
	@GetMapping("mypageCheckCancel")			//나의 주문정보 - 취소/반품 내역
	public String mypageCheckCancel() {
		return "mypage/mypage_check_cancel";
	}
	
	@GetMapping("mypageCheckOrder")			//나의 주문정보 - 주문 조회
	public String mypageCheckOrder() {
		return "mypage/mypage_check_order";
	}
	
	@GetMapping("mypageCheckPay")				//나의 주문정보 - 결제 내역
	public String mypageCheckPay() {
		return "mypage/mypage_check_pay";
	}
	
	@GetMapping("mypageGoodsAsk")				//나의 활동정보 - 상품 문의 내역
	public String mypageGoodsAsk() {
		return "mypage/mypage_goods_ask";
	}
	@GetMapping("mypageGoodsReview")			//나의 활동정보 - 상품 리뷰
	public String mypageGoodsReview() {
		return "mypage/mypage_goods_review";
	}
	@GetMapping("mypageMemberModify")			//나의 정보관리 - 개인정보 수정 전 비번입력
	public String mypageMemberModify() {
		return "mypage/mypage_member_modify";
	}
	@GetMapping("mypageMemberModify2")			//나의 정보관리 - 개인정보 수정
	public String mypageMemberModify2() {
		return "mypage/mypage_member_modify2";	
	}
	@GetMapping("mypageMemberOut")			//나의 정보관리 - 회원 탈퇴 전 비번입력
	public String mypageMemberOut() {
		return "mypage/mypage_member_out";
	}
	@GetMapping("mypageMemberOut2")			//나의 정보관리 - 회원 탈퇴
	public String mypageMemberOut2() {
		return "mypage/mypage_member_out2";
	}
	@GetMapping("mypagePasswdChange")			//나의 정보관리 - 비밀번호 변경 전 비번입력
	public String mypagePasswdChange() {
		return "mypage/mypage_passwd_change";
	}
	@GetMapping("mypagePasswdChange2")		//나의 정보관리 - 비밀번호 변경
	public String mypagePasswdChange2() {
		return "mypage/mypage_passwd_change2";
	}
	@GetMapping("mypageReservationAsk")		//나의 정보관리 - 회원 탈퇴
	public String mypageReservationAsk() {
		return "mypage/mypage_reservation_ask";
	}
	@GetMapping("mypagePoint")					//나의 포인트정보 - 포인트 내역
	public String mypagePoint() {
		return "mypage/mypage_point";
	}
	@GetMapping("mypageReservationChange")	//나의 예약정보 - 예약 변경 전 비번입력
	public String mypageReservationChange() {
		return "mypage/mypage_reservation_change";
	}
	@GetMapping("mypageReservationChange2")	//나의 예약정보 - 예약 변경
	public String mypageReservationChange2() {
		return "mypage/mypage_reservation_change2";
	}
	@GetMapping("mypageReservationCheck")		//나의 예약정보 - 예약 확인
	public String mypageReservationCheck() {
		return "mypage/mypage_reservation_check";
	}
}
