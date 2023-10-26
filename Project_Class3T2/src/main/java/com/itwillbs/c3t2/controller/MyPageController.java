package com.itwillbs.c3t2.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReviewVO;
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
	
	
	
	//============================================================================
	@GetMapping("/MypageBuyList")	//상품 구매 내역
	public String mypagebuylist(Model model) {
		
		//상품 구매 내역을 가져옴
		List<UserOrderVO> OrderList = service.getOrderList();
		System.out.println(OrderList);
		// 이 USER_ORDER DB에 있는지 확인
		model.addAttribute("OrderList", OrderList);
		
		return "mypage/mypage_buy_check";
	}
	
	@GetMapping("MypageMemberDetail")				//회원 상새내역
	public String mypageMemberDetail(MemberVO member, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("sId");
		MemberVO dbMember = service.getMemberDetails(member_id);
		model.addAttribute("Member", dbMember);
		System.out.println(dbMember);
		
		return "mypage/mypage_member_detail";
	}
	
//	@GetMapping("MypageReservationList")				// 예약 내역
//	public String mypageReservationList() {
//		return "mypage/mypage_reservation_list";
//	}
	
	//* @param memberNum 조회하고자 하는 회원의 번호
    //* @param model 뷰에 전달할 데이터를 담는 객체
    //* @return 리뷰 목록을 보여줄 뷰 페이지의 이름
	@GetMapping("MypageGoodsReview")			//나의 활동정보 - 상품 리뷰
	public String mypageGoodsReview(@RequestParam("memberNum") int member_num, Model model) {
		
		List<ReviewVO> review = service.getReviewDetail(member_num);
		model.addAttribute("review", review);
		return "mypage/mypage_goods_review";
	}
	
	@PostMapping("MypagePasswdChange")			//나의 정보관리 - 비밀번호 변경 전 비번입력
	public ResponseEntity<?> MypagePasswdChange(@RequestParam String member_id, @RequestParam String member_passwd) {
		
		// 비밀번호가 일치하면 "Success" 반환, 그렇지 않으면 "Fail" 반환
		if(service.MypagePasswdChange(member_id,member_passwd)) {
		
			return  new ResponseEntity<>("Success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("Fail", HttpStatus.BAD_REQUEST);
		}
	}
	
	
}
