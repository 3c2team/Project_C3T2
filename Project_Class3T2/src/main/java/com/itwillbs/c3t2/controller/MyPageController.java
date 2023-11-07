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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.utils.PageMaker;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.PageInfoVO;
import com.itwillbs.c3t2.vo.PointVO;
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
		
		// 로그인한 사용자가 세션에 존재하지 않으면 로그아웃 처리를 위해 로그아웃 경로로 리다이렉트.
	    // 이는 로그인하지 않은 사용자가 로그인이 필요한 페이지에 접근하는 것을 방지하는 목적.
		if(loginUser==null) return "redirect:/Logout";
		
		// 로그인한 사용자의 ID를 매개변수 맵에 추가.
		parMap.put("member_id", loginUser.getMember_id());	
		
		// 페이지당 표시할 아이템 수를 설정.
		pageMaker.setPerPageNum(6);
		
		// 장바구니의 전체 아이템 수를 설정.
		pageMaker.setTotalCount(service.getCartTotalCount(parMap));
		
		// 페이지네이션 HTML을 생성.
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
	
	@GetMapping("deleteBasket")					// 장바구니 내역 삭제
	public String deleteBasket(@RequestParam("cartNum") int cartNum) {
		
		service.deleteCartItem(cartNum);
		return "redirect:/MypageBasket";
	}
	
	@PostMapping("deleteBasket")
	public String deleteBasket(@RequestParam int cartNum, RedirectAttributes redirectAttributes) {
		
		boolean isDeleted = service.deleteCartItem(cartNum);
		
		if (isDeleted) {
	        redirectAttributes.addFlashAttribute("successMessage", "장바구니 항목 삭제 성공!");
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "장바구니 항목 삭제 실패!");
	    }
	    return "redirect:/MypageBasket";
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
		
		// 현재 세션에서 사용자 ID를 가져옵니다.
		String member_id=(String)session.getAttribute("sId");
		
		// 비밀번호 암호화를 위한 BCryptPasswordEncoder 객체를 생성합니다.
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		// DB에서 해당 사용자의 정보를 가져옵니다.
		MemberVO dbMember = memberService.getMemberLogin(member_id);
		
		// 사용자 정보가 없거나 입력한 비밀번호와 DB의 비밀번호가 일치하지 않으면 false를 반환합니다.
		if(dbMember == null || !passwordEncoder.matches(passwd, dbMember.getMember_passwd())) {			
			return false;			
		}else {	
			// 비밀번호 확인이 성공하면 세션에 확인 플래그를 설정하고 true를 반환합니다.
			session.setAttribute("mypageChckConfirm", "ok");
			return true;	
		}		
	}
	
	/**◆3.공통-비밀번호 확인 : 메서드 **/
	// 개인정보 수정 전 비밀번호 확인을 위한 유틸리티 메서드입니다.
	private boolean  mpCheck(HttpSession session,RedirectAttributes rttr, String redirectURL) {
		// 세션에서 비밀번호 확인 플래그를 가져옵니다.
		String mypageChckConfirm=(String)session.getAttribute("mypageChckConfirm");
		
		// 플래그가 설정되어 있지 않으면 세션 값을 삭제하고 false를 반환합니다.
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
	// 응답 본문에 직접 문자열을 반환하기 위한 어노테이션
	@ResponseBody
	public String mypageMemberModify(MemberVO memberVO, HttpSession session) {		
		try {
			// 현재 세션에서 사용자 ID를 가져옵니다.
			String member_id=(String)session.getAttribute("sId");
			// 가져온 사용자 ID를 MemberVO 객체에 설정합니다.
			memberVO.setMember_id(member_id);
			
			// 회원 정보를 업데이트하고, 성공적으로 업데이트된 경우 'success'를 반환합니다.
			if( service.updateMember(memberVO)==1)return "success";
			return "failed";
			
		} catch (Exception e) {
			
			// 예외 발생 시 오류 메시지를 가져옵니다.
			String erroMessge=e.getMessage();
			System.out.println("***** Duplicate  오류 :" +erroMessge);
			
			// 오류 메시지가 특정 키워드를 포함하면 해당 오류에 대한 메시지를 출력합니다.
			if(erroMessge.contains("for key 'MEMBER.member_phone_num'")) {
				System.out.println("***** Duplicate  오류  : 사용중인 전화번호 ");
				return "error_member_phone_num";
			}
			if(erroMessge.contains("member_e_mail")) {
				System.out.println("***** Duplicate  오류  :  사용중인 이메일 ");
				return "error_member_e_mail";
			}
			// 오류 스택 트레이스를 출력합니다.
			e.printStackTrace();
			
			// 일반적인 오류 발생 시 'error'를 반환합니다.
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
	public String mypagebuylist(HttpSession session, Model model, Map<String, Object> parMap, PageMaker pageMaker) {
		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser==null) return "redirect:/Logout";
		
		parMap.put("member_id", loginUser.getMember_id());
		pageMaker.setPerPageNum(5);
		pageMaker.setTotalCount(service.getBuyTotalCount(parMap));
		String pagination=pageMaker.paginationHTML("MypageBuyList");
		parMap.put("pageMaker", pageMaker);
		
		//상품 구매 내역을 가져옴
		List<UserOrderVO> OrderList = service.getOrderList(parMap);
		
		System.out.println(loginUser);
		
		// 가져온 구매 목록을 모델에 추가
		model.addAttribute("OrderList", OrderList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pagination", pagination);
		
		return "mypage/mypage_buy_check";
	}
	
	@GetMapping("MypageGoodsReview")			//나의 활동정보 - 상품 리뷰
	public String mypageGoodsReview(HttpSession session ,Model model, Map<String, Object> parMap , PageMaker pageMaker) {
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser==null) return "redirect:/Logout";
		
		// 로그인한 사용자의 ID를 매개변수 맵에 추가.
		parMap.put("member_id", loginUser.getMember_id());
		
		// 페이지당 표시할 아이템 수를 설정.
		pageMaker.setPerPageNum(5);
		
		// 장바구니의 전체 아이템 수를 설정.
		pageMaker.setTotalCount(service.getReviewTotalCount(parMap));
		
		// 페이지네이션 HTML을 생성.
		String pagination=pageMaker.paginationHTML("MypageGoodsReview");
		parMap.put("pageMaker", pageMaker);
		
		// 현재 로그인한 회원의 모든 리뷰 가져오기
		List<ReviewVO> reviews = service.getReviewList(parMap);
		System.out.println(reviews);
		
		// 가져온 리뷰 목록을 모델에 추가
		model.addAttribute("reviews", reviews);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pagination", pagination);
		
		// 리뷰 조회 페이지 반환
		return "mypage/mypage_goods_review";
	}
	
	@GetMapping("/productDetail")	//상품 리뷰 페이지 넘어가게하기
    public String reviewDetail(@RequestParam("review_num") int reviewNum, Model model) {
        ReviewVO review = service.getReviewByNum(reviewNum);
        System.out.println(review);
        model.addAttribute("review", review);
        return "productDetail";  	// 리뷰 상세 페이지의 뷰 이름
    }
	
	@GetMapping("MypagePoint")
	public String myPagePoint(HttpSession session ,Model model, 
			@RequestParam(defaultValue = "1000-01-01") String startDate, 
			@RequestParam(defaultValue = "5000-12-31") String endDate,
			@RequestParam(defaultValue = "1") int pageNum) {
		String memberId = (String)session.getAttribute("sId");
		
		if(memberId == null) {
			model.addAttribute("msg", "로그인 후 이용 가능합니다.");
			return "fail_back";
		}
		
		// 페이징 처리
		int listLimit = 5; // 한 페이지에서 표시할 글 목록 갯수
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
		List<PointVO> points = service.getPoints(startDate, endDate, memberId, startRow, listLimit);
		int listCount = service.getPointsCount(startDate, endDate, memberId);
		int pageListLimit = 5;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage, pageNum);
		model.addAttribute("points", points);
		
		model.addAttribute("pageInfo", pageInfo);
		return "mypage/mypage_point";
	}
	

	@GetMapping("MypageZzim")					//나의 관심정보 - 찜
	public String mypageZzim(HttpSession session, Model model, PageMaker pageMaker, Map<String, Object> parMap) {
		
//		// 세션에서 현재 로그인한 회원의 번호 가져오기
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//		
//		
//		// 로그인한 사용자의 ID를 매개변수 맵에 추가.
		parMap.put("member_id", loginUser.getMember_id());	
		System.out.println(loginUser);
//		// 세션에서 현재 로그인한 회원의 아이디 가져오기
//		String member_id = (String) session.getAttribute("sId");
//		System.out.println(member_id);
//		
//		// 로그인한 사용자의 ID를 매개변수 맵에 추가.
//		parMap.put("member_id", member_id);
		
		// 페이지당 표시할 아이템 수를 설정.
		pageMaker.setPerPageNum(6);
		
		// 찜의 전체 아이템 수를 설정.
		pageMaker.setTotalCount(service.getFavoriteTotalCount(parMap));
		
		// 페이지네이션 HTML을 생성.
		String pagination=pageMaker.paginationHTML("MypageZzim");
		
		// 현재 로그인한 회원의 찜 목록 가져오기
		List<FavoriteVO> favorites = service.getFavoriteList(parMap);
		System.out.println(favorites);
		
		// 가져온 찜 목록과 페이지네이션 관련 정보를 모델에 추가
		model.addAttribute("favorites", favorites);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("pagination", pagination);
		
		return "mypage/mypage_zzim";
	}
	
	@GetMapping("deleteFavorite")				//나의 관심정보 - 찜 내역 삭제
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
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "장바구니 항목 삭제 실패!");
	    }
		return "redirect:/MypageZzim";
	}
	
	
	
	@GetMapping("MypageReservationList")				// 예약 내역
	public String mypageReservationList(HttpSession session, Model model) {
		
		// 세션에서 현재 로그인한 회원의 번호 가져오기
		String member_id = (String) session.getAttribute("sId");
		System.out.println("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ" + member_id);
		
		// 현재 로그인한 회원의 모든 리뷰 가져오기
		List<ReservationVO> reviews = service.getReservationDetail(member_id);
		System.out.println(reviews);
		
		model.addAttribute("reviews", reviews);
		
		return "mypage/mypage_reservation_ask";
	}
	
	@PostMapping("cancelReservation")		// 예약취소
	public String cancelReservation(@RequestParam("reservation_num") int reservationNum) {
        service.cancelReservation(reservationNum);
        System.out.println(reservationNum);
        return "redirect:/MypageReservationList";
	}
	
	
	@GetMapping("MypageDetail")							// 나의 상세 정보
	public String mypagePoint(Model model, HttpSession session) {
		String member_id=(String)session.getAttribute("sId");
		MemberVO memberVO = memberService.getMemberLogin(member_id);
		model.addAttribute("Member", memberVO);
		return "mypage/mypage_detail";
	}
}
