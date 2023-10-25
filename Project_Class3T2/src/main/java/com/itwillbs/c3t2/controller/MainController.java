package com.itwillbs.c3t2.controller;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.service.SendMailService;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.MemberVO;

import lombok.AllArgsConstructor;

@Controller
public class MainController {
		
		@Autowired
		private MemberService service;
		
		@Autowired
		private SendMailService mailService;
		
		@GetMapping("Main")
		public String main() {
			return "other/main";
		}
	
		@GetMapping("About")
		public String about() {
			return "other/about";
		}
		
		@GetMapping("Menu")
		public String menu() {
			return "other/menu";
		}
		
		@GetMapping("News")
		public String news(
//			@RequestParam(defaultValue = "") String searchType,
//			@RequestParam(defaultValue = "") String searchKeyword,
//			@RequestParam(defaultValue = "1") int pageNum,
//			Model model
				) {
//	//		System.out.println("검색타입 : " + searchType);
//	//		System.out.println("검색어 : " + searchKeyword);
//	//		System.out.println("페이지번호 : " + pageNum);
//			// --------------------------------------------------------------------
//			// 페이징 처리를 위해 조회 목록 갯수 조절 시 사용될 변수 선언
//			int listLimit = 10; // 한 페이지에서 표시할 글 목록 갯수
//			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
//			// --------------------------------------------------------------------
//			// BoardService - getBoardList() 메서드를 호출하여 게시물 목록 조회 요청
//			// => 파라미터 : 검색타입, 검색어, 시작행번호, 목록갯수
//			// => 리턴타입 : List<BoardVO>(boardList)
//			List<NewsVO> newsList = service.getNewsList(searchType, searchKeyword, startRow, listLimit);
//			System.out.println(newsList);
			return "other/news";
		}
		
		@GetMapping("Event")
		public String event() {
			return "other/event";
		}
		
		@GetMapping("Location")
		public String location() {
			return "other/location";
		}
		
		// 예약 클릭 시 예약 폼으로 이동
		@GetMapping("ReservationForm")
		public String reservationForm() {
			return "reservation/reservation_form";
		}
		
		@GetMapping("OnlineStore")
		public String onlineStore() {
			return "store/store_main";
		}
		
		@GetMapping("Login")
		public String login() {
			return "other/login";
		}
		
		@ResponseBody
		@GetMapping("/auth/kakao/callback")
		public void kakaoCallback(@RequestParam("code") String code) {
		    System.out.println("code : " + code);
		}
		
		@PostMapping("LoginPro")
		public String loginPro(
				String member_id, MemberVO member, @RequestParam(required = false) boolean rememberId, HttpSession session, Model model) {
//			String securePasswd = service.getPasswd(member);
//			System.out.println("입력받은 아이디 : " + member.getMember_id());
//			System.out.println("DB 에 저장된 패스워드 : " + securePasswd);
//			System.out.println("입력받은 패스워드 : " + member.getMember_passwd());
			
			// BCryptPasswordEncoder 객체를 활용한 패스워드 비교
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//			if(securePasswd == null || !passwordEncoder.matches(member.getPasswd(), securePasswd)) {
//				model.addAttribute("msg", "인증 실패!");
//				return "fail_back";
//			} else { // 로그인 성공
//				// 이메일 인증 여부 확인
//			}
			// ------------------------------------------------------------
			MemberVO dbMember = service.getMemberLogin(member_id);
			System.out.println(dbMember.getMember_passwd());
			if(dbMember == null || !passwordEncoder.matches(member.getMember_passwd(), dbMember.getMember_passwd())) {
				model.addAttribute("msg", "로그인 실패!");
				return "fail_back";
			} else { // 로그인 성공
				if(dbMember.getMail_auth_status().equals("N")) { // 이메일 미인증 회원
					model.addAttribute("msg", "이메일 인증 후 로그인이 가능합니다!");
					return "fail_back";
				} else { // 이메일 인증 회원
					session.setAttribute("sId", member.getMember_id());
					session.setAttribute("sName", dbMember.getMember_name());
					return "redirect:/Main";
				}
			}
		}
		
		@GetMapping("IdForgot")
		public String idForgot() {
			return "other/id_forgot";
		}
		
		@PostMapping("IdForgotPro")
		public String idForgotPro(String member_name, String member_phone_num, MemberVO member, Model model, HttpSession session) {
			String member_id = service.getMemberId(member_name);
			String member_id_2 = service.getMemberId(member_phone_num);
			System.out.println("입력받은 이름 : " + member.getMember_name());
			System.out.println("입력받은 번호 : " + member.getMember_phone_num());
			System.out.println("아이디 : " + member_id);
			System.out.println("아이디2 : " + member_id_2);
			
			if(member_id.equals(member_id_2)) { // 성공
				session.setAttribute("sName", member.getMember_name());
				session.setAttribute("sId", member_id);
				System.out.println("세션 아이디 : " + member_id);
				return "other/id_found";
			} else { // 실패
				model.addAttribute("msg", "정보에 해당하는 회원이 없습니다.");
				return "fail_back";
			}
		}
		
		@GetMapping("PassForgot")
		public String passForgot() {
			return "other/pass_forgot";
		}
		
		@PostMapping("PassForgotPro")
		public String passForgotPro(String member_id, String member_phone_num, MemberVO member, Model model) {
			String member_id_2 = service.getMemberId(member_phone_num);
			System.out.println("1 : " + member_id);
			System.out.println("2 : " + member_id_2);
			if(member_id.equals(member_id_2)) {
				String email = service.getMemberEmail(member_id);
				String authCode = mailService.sendAuthMail_passwd(member_id, email);
				System.out.println(email);
				System.out.println(authCode);
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				String securePasswd = passwordEncoder.encode(authCode);
				
				int updatePasswdCount = service.updateMemberPasswd(member_id, securePasswd);
				System.out.println("updatepasswd : " + updatePasswdCount);
				if(updatePasswdCount > 0) {
					model.addAttribute("msg", "입력한 메일로 변경 비밀번호 전송했습니다. 로그인 페이지로 이동합니다."); // 출력할 메세지
					model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
					return "forward";
				} else {
					model.addAttribute("msg", "비밀번호 변경에 오류가 생겼습니다. 다시 시도해주세요.");
					return "fail_back";
				}
			} else { // 실패
				model.addAttribute("msg", "정보에 해당하는 회원이 없습니다.");
				return "fail_back";
			}
		}
		
		@GetMapping("Logout")
		public String logout(HttpSession session) {
			session.invalidate();
			
			// 메인페이지로 리다이렉트
			return "redirect:/Main";
		}
		
		@GetMapping("JoinAgree")
		public String joinSuccess() {
			return "other/join_pro";
		}
		
		@PostMapping("Join")
		public String joinAgree(MemberVO member, Model model) {
			System.out.println(member);
//			int insertCount = service.registAgreeMember(memberAgree);
			
			model.addAttribute("member", member);
//			model.addAttribute("c1", member.getC1());
//			model.addAttribute("c2", member.getC2());
//			model.addAttribute("c3", member.getC3());
//			model.addAttribute("c4", member.getC4());
			
			return "other/join";
		}
		
		@PostMapping("/JoinPro")
		public String joinPro(MemberVO member, Model model) {
			System.out.println(member);
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String securePasswd = passwordEncoder.encode(member.getMember_passwd());
			member.setMember_passwd(securePasswd);
			// ---------------------------------------------------------------------
			int insertCount = service.registMember(member);
			
			if(insertCount > 0) { // 성공
				// ------------------------------------------------
				String email = member.getMember_email1() + "@" + member.getMember_email2();
				String authCode = mailService.sendAuthMail(member.getMember_id(), email);
				
				service.registAuthInfo(member.getMember_id(), authCode);
				
				// ------------------------------------------------
				model.addAttribute("msg", "인증 메일을 전송했습니다. 인증 확인 후 회원가입이 완료됩니다."); // 출력할 메세지
				model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
				return "forward";
			} else { // 실패
				model.addAttribute("msg", "회원 가입 실패!");
				return "fail_back";
			}
		}
		
		@ResponseBody
		@PostMapping("CheckId")
		public String checkId(String member_id) {
	        String result="N";
	        int flag = service.checkId(member_id);
	        System.out.println(flag);
	        if(flag == 1) result ="Y"; 
	        return result;
	    }
		
		@GetMapping("/MemberEmailAuth")
		public String emailAuth(AuthInfoVO authInfo, Model model) {
//			System.out.println("이메일에 포함된 인증정보 : " + authInfo);
			
			// MemberService - emailAuth() 메서드를 호출하여 인증 요청
			// => 파라미터 : AuthInfoVO 객체   리턴타입 : boolean(isAuthSuccess)
			boolean isAuthSuccess = service.emailAuth(authInfo);
			
			// 인증 수행 결과 판별
			// 성공 시 인증 성공 메세지, 로그인폼 URL 을 포함하여 "forward.jsp" 페이지로 포워딩
			// 실패 시 인증 실패 메세지를 포함하여 "fail_back.jsp" 페이지로 포워딩
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
