package com.itwillbs.c3t2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.utils.PageMaker;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReservationVO;
import com.itwillbs.c3t2.vo.ReviewVO;
import com.itwillbs.c3t2.vo.UserOrderVO;
@Controller
//@RequestMapping("/mypage/")
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	private MemberService memberService;
	
	
	//mypageMapping
	@GetMapping("MypageDashboard")				//마이페이지 홈
	public String mypageDashboard() {
		return "mypage/mypage_dashboard";
	}
	
	@GetMapping("MypageBasket")				// 나의 관심정보 - 장바구니
	public String mypageBasket(Model model,HttpSession session, Map<String, Object> parMap , PageMaker pageMaker) {		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser==null) return "redirect:/Logout";
		
		parMap.put("member_id", loginUser.getMember_id());				
		pageMaker.setPerPageNum(6);
		pageMaker.setTotalCount(service.getCartTotalCount(parMap));
		String pagination=pageMaker.paginationHTML("MypageBasket");
		parMap.put("pageMaker", pageMaker);
		
		//상품 구매 내역을 가져옴
		List<CartVO> cartList = service.getCartList(parMap);


		// 가져온 구매 목록을 모델에 추가
		model.addAttribute("cartList", cartList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pagination", pagination);

		return "mypage/mypage_basket";
	}
	
	
	@GetMapping("MypageCheckOrder")			//나의 주문정보 - 주문 조회
	public String mypageCheckOrder() {
		return "mypage/mypage_check_order";
	}
	
	
	/**◆1.공통-비밀번호 확인 - GET 
	 * 나의 정보관리 - 개인정보 수정 전 비번입력
	 * */
	@GetMapping("CheckMypageConfirm")			
	public String checkMypageConfirm() {
		return "mypage/mypage_check_confirm";
	}

	/**◆2.공통-비밀번호 확인 - POST 
	 * 나의 정보관리 - 개인정보 수정 전 비번입력
	 * */
	@PostMapping("CheckMypageConfirm")
	@ResponseBody
	public boolean checkMypageConfirm(String passwd, HttpSession session) {	
		String member_id=(String)session.getAttribute("sId");
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		MemberVO dbMember = memberService.getMemberLogin(member_id);
		
		if(dbMember == null || !passwordEncoder.matches(passwd, dbMember.getMember_passwd())) {			
			return false;			
		}else {			
			session.setAttribute("mypageChckConfirm", "ok");
			return true;	
		}		
	}
	
	/**◆3.공통-비밀번호 확인 : 메서드 **/
	private boolean  mpCheck(HttpSession session,RedirectAttributes rttr, String redirectURL) {
		String mypageChckConfirm=(String)session.getAttribute("mypageChckConfirm");
		if(!StringUtils.hasText(mypageChckConfirm)) {
			// 세션값 삭제
			session.removeAttribute("mypageChckConfirm");
			//개인정보 수정 전 비번입력 체크가 안될 경우 체크페이지로 이동
			rttr.addFlashAttribute("redirectURL", redirectURL);
			return false;
		}		
		// 세션값 삭제
		session.removeAttribute("mypageChckConfirm");
	    return true;		
	}
	
   /**
    * 나의 정보관리
    * @param param
    * @param session
    * @param rttr
    * @return
    */
	@GetMapping("MypageMemberModify")			
	public String mypageMemberModify(Model model, Map<String, Object> param, HttpSession session, RedirectAttributes rttr) {		
		if(!this.mpCheck(session, rttr, "MypageMemberModify")) return "redirect:CheckMypageConfirm";
		String member_id=(String)session.getAttribute("sId");
		MemberVO memberVO = memberService.getMemberLogin(member_id);
		model.addAttribute("Member", memberVO);
		return "mypage/mypage_member_modify";
	}
	
	
	@PostMapping("MypageMemberModify")			
	@ResponseBody
	public String mypageMemberModify(MemberVO memberVO, HttpSession session) {		
		try {
			String member_id=(String)session.getAttribute("sId");
			memberVO.setMember_id(member_id);
			
			if( service.updateMember(memberVO)==1)return "success";
			return "failed";
			
		} catch (Exception e) {
			String erroMessge=e.getMessage();
			System.out.println("***** Duplicate  오류 :" +erroMessge);
			if(erroMessge.contains("for key 'MEMBER.member_phone_num'")) {
				System.out.println("***** Duplicate  오류  : 사용중인 전화번호 ");
				return "error_member_phone_num";
			}
			if(erroMessge.contains("member_e_mail")) {
				System.out.println("***** Duplicate  오류  :  사용중인 이메일 ");
				return "error_member_e_mail";
			}
			
			e.printStackTrace();
			return "error";
		}
	}
	
	
	
	/**
	 * 비밀번호 변경
	 * @param model
	 * @param session
	 * @param rttr
	 * @return
	 */
	@GetMapping("MypagePasswdChange")		   
	public String mypagePasswdChange(Model model, HttpSession session, RedirectAttributes rttr) {
		if(!this.mpCheck(session, rttr, "MypagePasswdChange")) return "redirect:CheckMypageConfirm";
		return "mypage/mypage_passwd_change";
	}
	
	@PostMapping("MypagePasswdChange")		
	@ResponseBody
	public boolean mypagePasswdChange(String passwd, HttpSession session ) {
		try {
			String member_id=(String)session.getAttribute("sId");
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String encodePassword=passwordEncoder.encode(passwd);
			
			Map<String, Object> param=new HashMap<>();
			param.put("memberId", member_id);
			param.put("password", encodePassword);
		
			if(service.updatePassword(param)==1)return true;
			else return false;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}			
	}
	
	/**
	 * 회원 탈퇴
	 * @param session
	 * @param rttr
	 * @return
	 */
	@GetMapping("MypageMemberOut")			
	public String mypageMemberOut(HttpSession session, RedirectAttributes rttr) {
		if(!this.mpCheck(session, rttr, "MypageMemberOut")) return "redirect:CheckMypageConfirm";
		return "mypage/mypage_member_out";
	}

	
	@PostMapping("MypageMemberOut")			
	@ResponseBody
	public boolean mypageMemberOut(@RequestParam Map<String, Object> paraMap, HttpSession session) {
		try {

			String member_id=(String)session.getAttribute("sId");
			paraMap.put("member_id", member_id);			
			System.out.println("**** 파라미터 : "+paraMap.toString());
			service.mypageMemberOut(paraMap);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}
	
	@GetMapping("MypageReservationAsk")		//나의 정보관리 - 회원 탈퇴
	public String mypageReservationAsk() {
		return "mypage/mypage_reservation_ask";
	}
	
	
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
	public String mypagebuylist(HttpServletRequest request,	HttpSession session, Model model) {
		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser==null) return "redirect:/Logout";
		
		//상품 구매 내역을 가져옴
		List<UserOrderVO> OrderList = service.getOrderList(loginUser.getMember_id());


		// 가져온 구매 목록을 모델에 추가
		model.addAttribute("OrderList", OrderList);
		
		return "mypage/mypage_buy_check";
	}
	
	@GetMapping("MypageGoodsReview")			//나의 활동정보 - 상품 리뷰
	public String mypageGoodsReview(HttpSession session ,Model model) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser==null) return "redirect:/Logout";
		
		
		// 현재 로그인한 회원의 모든 리뷰 가져오기
		List<ReviewVO> reviews = service.getReviewDetail(loginUser.getMember_id());
		System.out.println(reviews);
		
		// 가져온 리뷰 목록을 모델에 추가
		model.addAttribute("reviews", reviews);
		
		// 리뷰 조회 페이지 반환
		return "mypage/mypage_goods_review";
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
		String member_name = (String) session.getAttribute("sName");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + member_name);
		
		// 현재 로그인한 회원의 모든 리뷰 가져오기
		List<ReservationVO> reviews = service.getReservationDetail(member_name);
		System.out.println(reviews);
		
		model.addAttribute("reviews", reviews);
		
		return "mypage/mypage_reservation_ask";
	}
	
	@GetMapping("MypageDetail")							// 나의 상세 정보
	public String mypagePoint(Model model, HttpSession session) {
		String member_id=(String)session.getAttribute("sId");
		MemberVO memberVO = memberService.getMemberLogin(member_id);
		model.addAttribute("Member", memberVO);
		return "mypage/mypage_detail";
	}
}
