package com.itwillbs.c3t2.controller;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.service.SendMailService;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.NoticeVO;
import com.itwillbs.c3t2.vo.PageInfoVO;
import com.itwillbs.c3t2.vo.RestaurantVO;


@Controller
public class MainController {
		
	@Autowired
	private MemberService service;
	
	@Autowired 
	private SendMailService mailService;
	
	// ???
	@GetMapping("PayPay")
	public String payPay() {
		return "store/pay1";
	}
	
	// bottom 데이터 불러오기
	@GetMapping("Bottom")
	@ResponseBody
	public JsonObject bottom(Model model) {
		RestaurantVO restaurant = service.getRestaurant();
		JsonObject json = new JsonObject();
		json.addProperty("restaurant_name", restaurant.getRestaurant_name());
		json.addProperty("restaurant_address", restaurant.getRestaurant_address());
		json.addProperty("restaurant_call", restaurant.getRestaurant_call());
		json.addProperty("ceo_name", restaurant.getCeo_name());
		
		return json;
	}
	
	// 메인 화면(최근 공지 팝업)
	@GetMapping("Main")
	public String main(Model model, HttpSession session) {
		NoticeVO notice_recent = service.getNoticeRecent();
		model.addAttribute("noticeRecent", notice_recent);
		return "other/main";
	}
	
	// About 클릭 시 About 폼으로 이동
	@GetMapping("About")
	public String about() {
		return "other/about";
	}
	
	// Menu 클릭 시 Menu 폼으로 이동
	@GetMapping("Menu")
	public String menu() {
		return "other/menu";
	}
	
	// 공지사항 페이지(페이징 처리)
	@GetMapping("News")
	public String news(
		@RequestParam(defaultValue = "") String searchType,
		@RequestParam(defaultValue = "") String searchKeyword,
		@RequestParam(defaultValue = "1") int pageNum,
		Model model, NoticeVO notice
			) {
		int listLimit = 5; // 한 페이지에서 표시할 글 목록 갯수
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
		List<NoticeVO> noticeList = service.getNoticeList(searchType, searchKeyword, startRow, listLimit);
		int listCount = service.getNoticeListCount(searchType, searchKeyword);
		int pageListLimit = 5;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfoVO pageInfo = new PageInfoVO(listCount, pageListLimit, maxPage, startPage, endPage, pageNum);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "other/news";
	}
	
	// 공지사항 자세히 보기(이전 글, 다음 글 불러오기)
	@GetMapping("/NoticeDetail")
	public String noticeDetail(@RequestParam int notice_num, Model model, NoticeVO notice) {
		notice = service.getNotice(notice_num);
		if(notice.getNotice_num_pre() != 0) {
			NoticeVO notice_pre = service.getNotice(notice.getNotice_num_pre());
			model.addAttribute("noticePre", notice_pre);
		}
		if(notice.getNotice_num_next() != 0) {
			NoticeVO notice_next = service.getNotice(notice.getNotice_num_next());
			model.addAttribute("noticeNext", notice_next);
		}
		model.addAttribute("notice", notice);
		return "other/notice_view";
	}
	
	// 위치 클릭 시 위치 폼으로 이동
	@GetMapping("Location")
	public String location() {
		return "other/location";
	}
	
	// 예약 클릭 시 예약 폼으로 이동
	@GetMapping("ReservationInfo")
	public String reservationInfo() {
		return "reservation/reservation_info";
	}
	
	// OnlineStore 클릭 시 OnlineStore 폼으로 이동
//	@GetMapping("OnlineStore")
//	public String onlineStore() {
//		return "store/store_main";
//	}
	
	// Login 클릭 시 Login 폼으로 이동
	@GetMapping("Login")
	public String login() {
		return "other/login";
	}
	
	// 카카오 로그인
	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String kakaoLogin(
			@RequestParam(value = "code", required = false) String code, 
			MemberVO member, HttpSession session, Model model) throws Throwable {
		String access_Token = service.getKaKaoAccessToken(code);
        HashMap<String, Object> userInfo = service.createKakaoUser(access_Token);
        
        if (userInfo.get("id") == null) {
        	model.addAttribute("msg", "다시 시도해주세요."); // 출력할 메세지
			return "fail_back";
        }
        
        String kakao_id = (String)userInfo.get("id");
    	MemberVO dbMember = service.getMemberKakaoLogin(kakao_id);
    	
    	if(dbMember != null) { // 연동 이력이 있는 경우
    		session.setAttribute("kakao_id", kakao_id);
            session.setAttribute("access_Token", access_Token);
            session.setAttribute("sId", dbMember.getMember_id());
            session.setAttribute("sName", dbMember.getMember_name());
            session.setAttribute("sPhone", dbMember.getMember_phone_num());
            session.setAttribute("sEmail", dbMember.getMember_e_mail());
            session.setAttribute("loginUser", dbMember);
            model.addAttribute("msg", "로그인에 성공했습니다. 메인페이지로 이동합니다."); // 출력할 메세지
			model.addAttribute("targetURL", "Main"); // 이동시킬 페이지
			return "forward";
    	}
    	
		session.setAttribute("kakao_id", (String)userInfo.get("id"));
        session.setAttribute("access_Token", access_Token);
        model.addAttribute("msg", "입력된 정보가 없습니다. 회원가입 페이지로 이동합니다."); // 출력할 메세지
		model.addAttribute("targetURL", "JoinAgree"); // 이동시킬 페이지
		return "forward";
	}
	
	// 카카오 로그인 연동
	@GetMapping("KakaoConnect")
	public String kakaoConnect(Model model, HttpSession session) {
		String kakao_id = (String)session.getAttribute("kakao_id");
		if(kakao_id == null) {
			model.addAttribute("msg", "카카오 로그인부터 진행합니다."); // 출력할 메세지
			model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
			return "forward";
		}
		model.addAttribute("msg", "카카오 연동을 위해 로그인이 필요합니다."); // 출력할 메세지
		model.addAttribute("targetURL", "KakaoConnectLogin"); // 이동시킬 페이지
		return "forward";
	}
	
	// 카카오아이디랑 로그인 아이디 연동
	@GetMapping("KakaoConnectLogin")
	public String kakaoConnectLogin() {
		return "other/loginKakao";
	}
	
	// 카카오 로그인 완료
	@PostMapping("KakaoLoginPro")
	public String kakaoLoginPro(MemberVO member, HttpSession session, String member_id, Model model) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		MemberVO dbMember = service.getMemberLogin(member_id);
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) {
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		}
		
		// 로그인 성공
		if(dbMember.getMail_auth_status().equals("N")) { // 이메일 미인증 회원
			model.addAttribute("msg", "이메일 인증 후 로그인이 가능합니다!");
			return "fail_back";
		}
		
		session.setAttribute("sId", member.getMember_id());
		session.setAttribute("sName", dbMember.getMember_name());
		session.setAttribute("sPhone", dbMember.getMember_phone_num());
		session.setAttribute("loginUser", dbMember);
		session.setAttribute("sEmail", dbMember.getMember_e_mail());
		String kakao_id = (String)session.getAttribute("kakao_id");
		int updateCount = service.addKakaoId(member_id, kakao_id);
		
		if(updateCount <= 0) {
			model.addAttribute("msg", "로그인 정보를 다시 확인해주세요.");
			return "fail_back";
		}
		return "redirect:/Main";
		
	}
	
	// Naver 클릭 시 Naver 폼으로 이동
	@GetMapping("Naver")
	public String naverLogin() {
		return "other/callback";
	}
	
	// 포스트 연결을 위해 만든 것 끝까지 안 쓸 경우 지우기!!!!!!!!!!!!!
	@GetMapping("Post")
	public String goPost(Model model, @RequestParam(defaultValue = "") String targetURL) {
		model.addAttribute("targetURL", targetURL);
		return "post";
	}
	
	// 로그인 완료
	@PostMapping("LoginPro")
	public String loginPro(
			String member_id, MemberVO member, @RequestParam(required = false) boolean rememberId, 
			HttpSession session, HttpServletResponse response, Model model) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		MemberVO dbMember = service.getMemberLogin(member_id);
		if(member_id.equals("admin")) {
            return "admin/admin_login";
         }
		
		if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) {
			model.addAttribute("msg", "로그인 실패!");
			return "fail_back";
		}
		
		// 로그인 성공
		if(dbMember.getMail_auth_status().equals("N")) { // 이메일 미인증 회원
			model.addAttribute("msg", "이메일 인증 후 로그인이 가능합니다!");
			return "fail_back";
		}
		
		// 이메일 인증 회원
		session.setAttribute("loginUser", dbMember);
		session.setAttribute("sId", member.getMember_id());
		session.setAttribute("sName", dbMember.getMember_name());
		session.setAttribute("sPhone", dbMember.getMember_phone_num());
		session.setAttribute("sEmail", dbMember.getMember_e_mail());
		Cookie cookie = new Cookie("cookieId", member.getMember_id());
		
		if(rememberId) { // 아이디 저장 체크됨
			cookie.setMaxAge(60 * 60 * 24 * 30);
		} else { // 아이디 저장 미체크
			cookie.setMaxAge(0); // 쿠키 즉시 삭제한다는 의미
		}
		response.addCookie(cookie);
		return "redirect:/Main";
	}
	
	// IdForgot 클릭 시 IdForgot 폼으로 이동
	@GetMapping("IdForgot")
	public String idForgot() {
		return "other/id_forgot";
	}
	
	// 아이디 찾기 완료
	@PostMapping("IdForgotPro")
	public String idForgotPro(String member_name, String member_phone_num, MemberVO member, Model model, HttpSession session) {
		String member_id = service.getMember(member_name);
		String member_id_2 = service.getMemberId(member_phone_num);
		
		if(member_id.equals(member_id_2)) { // 성공
			session.setAttribute("sName", member.getMember_name());
			session.setAttribute("sId", member_id);
			session.setAttribute("sPhone", member_phone_num);
			return "other/id_found";
		}
		
		// 실패
		model.addAttribute("msg", "정보에 해당하는 회원이 없습니다.");
		return "fail_back";
	}
	
	// PassForgot 클릭 시 PassForgot 폼으로 이동
	@GetMapping("PassForgot")
	public String passForgot() {
		return "other/pass_forgot";
	}
	
	// 비밀번호 업데이트 후 메일 전송
	@PostMapping("PassForgotPro")
	public String passForgotPro(String member_id, String member_phone_num, MemberVO member, Model model) {
		String member_id_2 = service.getMemberId(member_phone_num);
		if (!member_id.equals(member_id_2)) {
			model.addAttribute("msg", "정보에 해당하는 회원이 없습니다.");
			return "fail_back";
		}
		
		String email = service.getMemberEmail(member_id);
		String authCode = mailService.sendAuthMail_passwd(member_id, email);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(authCode);
		int updatePasswdCount = service.updateMemberPasswd(member_id, securePasswd);
		
		if (updatePasswdCount <= 0) {
			model.addAttribute("msg", "비밀번호 변경에 오류가 생겼습니다. 다시 시도해주세요.");
			return "fail_back";
		}
		
		model.addAttribute("msg", "입력한 메일로 변경 비밀번호 전송했습니다. 로그인 페이지로 이동합니다."); // 출력할 메세지
		model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
		return "forward";
	}
	
	// Logout 클릭 시 Logout 폼으로 이동
	@GetMapping("Logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/Main";
	}
	
	// Join 클릭 시 회원가입 동의 폼으로 이동
	@GetMapping("JoinAgree")
	public String joinSuccess() {
		return "other/join_pro";
	}
	
	// Join 동의 후 회원가입 폼
	@PostMapping("Join")
	public String joinAgree(MemberVO member, Model model) {
		model.addAttribute("member", member);
		return "other/join";
	}
	
	// 아이디 중복 판별 처리
	@ResponseBody
	@GetMapping("MemberCheckDupId")
	public String checkDupId(String id) {
		MemberVO returnMember = service.getMemberDup(id);
		
		if(returnMember != null) { // 아이디 중복
			return "true"; // 리턴타입 String일 때 응답 데이터로 String 타입 "true" 문자열 리턴
		} else {
			return "false";
		}
	}
	
	// 휴대폰 중복 판별 처리
	@ResponseBody
	@GetMapping("MemberCheckDupPhone")
	public String checkDupPhone(String phone_num) {
		MemberVO returnMember = service.getMemberDupPhone(phone_num);
		
		if(returnMember != null) { // 아이디 중복
			return "true"; // 리턴타입 String일 때 응답 데이터로 String 타입 "true" 문자열 리턴
		} else {
			return "false";
		}
	}
	
	// 회원가입 완료 폼
	@PostMapping("JoinPro")
	public String joinPro(MemberVO member, Model model) {
		System.out.println(member);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String securePasswd = passwordEncoder.encode(member.getMember_passwd());
		member.setMember_passwd(securePasswd);
		int insertCount = service.registMember(member);
		
		if(insertCount <= 0) {
			model.addAttribute("msg", "회원 가입 실패!");
			return "fail_back";
		}
		
		String email = member.getMember_email1() + "@" + member.getMember_email2();
		String authCode = mailService.sendAuthMail(member.getMember_id(), email);
		
		service.registAuthInfo(member.getMember_id(), authCode);
		int pointUpdateCount = service.registPoint(member.getMember_id());
		
		if (pointUpdateCount <= 0) {
			model.addAttribute("msg", "오류가 생겼습니다. 다시 시도해주세요.");
			return "fail_back";
		}
		
		model.addAttribute("msg", "인증 메일을 전송했습니다. 인증 확인 후 회원가입이 완료됩니다."); // 출력할 메세지
		model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
		return "forward";
	}
	
	// 메일 인증
	@GetMapping("/MemberEmailAuth")
	public String emailAuth(AuthInfoVO authInfo, Model model) {
		boolean isAuthSuccess = service.emailAuth(authInfo);
		
		if(isAuthSuccess) { // 성공
			model.addAttribute("msg", "인증 성공! 로그인 페이지로 이동합니다!"); // 출력할 메세지
			model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
			return "forward";
		} else { // 실패
			model.addAttribute("msg", "인증 실패!");
			return "fail_back";
		}
	}
}
