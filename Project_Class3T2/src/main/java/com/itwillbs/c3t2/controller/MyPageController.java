package com.itwillbs.c3t2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReservationVO;
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
	
//	@GetMapping("MypageReservationList")				// 예약 내역
//	public String mypageReservationList() {
//		return "mypage/mypage_reservation_list";
//	}
	
	
	//============================================================================
	@GetMapping("MypageMemberDetail")				//회원 상새내역
	public String mypageMemberDetail(MemberVO member, Model model, HttpSession session) {
		String member_id = (String)session.getAttribute("sId");
		MemberVO dbMember = service.getMemberDetails(member_id);
		model.addAttribute("Member", dbMember);
		System.out.println(dbMember);
		
		return "mypage/mypage_member_detail";
	}
	
	@GetMapping("/MypageBuyList")	//상품 구매 내역
	public String mypagebuylist(HttpSession session, Model model) {
		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		Integer member_num = (Integer) session.getAttribute("sNum");
		System.out.println(member_num);
		
		//상품 구매 내역을 가져옴
		List<UserOrderVO> OrderList = service.getOrderList(member_num);
		System.out.println(OrderList);
		
		// 가져온 구매 목록을 모델에 추가
		model.addAttribute("OrderList", OrderList);
		
		return "mypage/mypage_buy_check";
	}
	
	@GetMapping("MypageGoodsReview")			//나의 활동정보 - 상품 리뷰
	public String mypageGoodsReview(HttpSession session ,Model model) {
		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		Integer member_num = (Integer) session.getAttribute("sNum");
		System.out.println(member_num);
		
		// 현재 로그인한 회원의 모든 리뷰 가져오기
		List<ReviewVO> reviews = service.getReviewDetail(member_num);
		System.out.println(reviews);
		
		// 가져온 리뷰 목록을 모델에 추가
		model.addAttribute("reviews", reviews);
		
		// 리뷰 조회 페이지 반환
		return "mypage/mypage_goods_review";
	}
	
	@GetMapping("MypagePasswdChange")		   //나의 정보관리 - 비밀번호 변경 전 비번입력
	public String mypagePasswdChange(Model model) {
		
		// 뷰를 반환하여 해당 JSP 페이지로 이동
		return "mypage/mypage_passwd_change";
	}
	
	
	@GetMapping("MypageZzim")					//나의 관심정보 - 찜
	public String mypageZzim(HttpSession session, Model model) {
		
		// 세션에서 현재 로그인한 회원의 아이디 가져오기
		String member_id = (String) session.getAttribute("sId");
		System.out.println(member_id);
		
		// 현재 로그인한 회원의 찜 목록 가져오기
		List<FavoriteVO> favorites = service.getFavorite(member_id);
		System.out.println(favorites);
		
		// 가져온 찜 목록을 모델에 추가
		model.addAttribute("favorites", favorites);
		
		return "mypage/mypage_zzim";
	}
	@GetMapping("/deleteFavorite")				//나의 관심정보 - 찜 내역 삭제
	public String deleteFavorite(@RequestParam("favoriteNum") Integer favoriteNum) {
	    
		// Service를 호출하여 favoriteNum에 해당하는 찜 목록 데이터 삭제
	    service.deleteFavorite(favoriteNum);
	    
	    // 삭제 후 찜 목록 페이지로 리턴
	    return "redirect:/MypageZzim";
	}
	
	
	@PostMapping("deleteFavorite")				//나의 관심정보 - 찜 내역 삭제
	public String deleteFavorite(@RequestParam Integer favoriteNum, RedirectAttributes redirectAttributes) {
		
		// Service를 호출하여 favoriteNum에 해당하는 찜 목록 데이터 삭제
		boolean isDeleted = service.deleteFavorite(favoriteNum);
		
		// 삭제 성공 시 사용자에게 알림 메시지 전달
		if (isDeleted) {
			redirectAttributes.addFlashAttribute("errorMessage", "찜 항목 삭제 성공!");
	    }
		return "redirect:/MypageZzim";
	}
	
	@GetMapping("MypageReservationList")				// 예약 내역
	public String mypageReservationList(HttpSession session, Model model) {
		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		Integer member_num = (Integer) session.getAttribute("sNum");
		System.out.println(member_num);
		
		// 현재 로그인한 회원의 모든 리뷰 가져오기
		List<ReservationVO> reviews = service.getReservationDetail(member_num);
		System.out.println(reviews);
		
		model.addAttribute("reviews", reviews);
		
		return "mypage/mypage_reservation_list";
	}
}
