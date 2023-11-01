package com.itwillbs.c3t2.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.protobuf.Timestamp;
import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.service.SendMailService;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.EventVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.NoticeVO;
import com.itwillbs.c3t2.vo.PageInfoVO;


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
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum,
			Model model, NoticeVO notice
				) {
			int listLimit = 5; // 한 페이지에서 표시할 글 목록 갯수
			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
			List<NoticeVO> noticeList = service.getNewsList(searchType, searchKeyword, startRow, listLimit);
			System.out.println(noticeList);
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
			System.out.println("notice_date : " + notice.getNotice_date());
			
//			int recentNotice = service.getRecentNoticeNum();
			
			return "other/notice_view";
		}
		
		@GetMapping("Event")
		public String event(@RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) {
			String uploadDir = "/event_img/"; //가상 업로드 경로
	    	String saveDir = session.getServletContext().getRealPath(uploadDir);
//	    	System.out.println("saveDir" + saveDir);
	    	int i = saveDir.indexOf("wtpwebapps");
//	    	System.out.println(i);
	    	String realSaveDir = saveDir.substring(0, i) + "wtpwebapps\\event_img\\";
//	    	System.out.println(realSaveDir);
			List<EventVO> eventList = service.getEventList();
			model.addAttribute("eventList", eventList);
			model.addAttribute("saveDir", realSaveDir);
			return "other/event";
		}
		
//		@ResponseBody
//		@GetMapping("/EventListJson")
//		public String listJson( @RequestParam(defaultValue = "1") int pageNum, Model model, HttpSession session) {
//			String uploadDir = "/event_img/"; //가상 업로드 경로
//	    	String saveDir = session.getServletContext().getRealPath(uploadDir);
//	    	int i = saveDir.indexOf("wtpwebapps");
//	    	String realSaveDir = saveDir.substring(0, i) + "wtpwebapps\\event_img\\";
//			model.addAttribute("saveDir", realSaveDir);
//			
//			int listLimit = 5; // 한 페이지에서 표시할 글 목록 갯수
//			int startRow = (pageNum - 1) * listLimit; // 조회 시작 행(레코드) 번호
//			List<EventVO> eventList = service.getEventListJson(startRow, listLimit);
//			int listCount = service.getEventListCount();
//			
//			int pageListLimit = 5;
//			int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
//			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
//			int endPage = startPage + pageListLimit - 1;
//			if(endPage > maxPage) {
//				endPage = maxPage;
//			}
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("endPage", endPage);
//			map.put("eventList", eventList);
			
//			JsonObject jsonObject = new JsonObject();
//			jsonObject.addProperty("endPage", endPage + "");
//			jsonObject.addProperty("eventList", eventList + "");
//			jsonObject.addProperty("saveDir", realSaveDir);
//			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!" + jsonObject.toString());
//			return jsonObject.toString();
//		}
		
		@GetMapping("Location")
		public String location() {
			return "other/location";
		}
		
		// 예약 클릭 시 예약 폼으로 이동
		@GetMapping("ReservationInfo")
		public String reservationInfo() {
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
		
		@RequestMapping(value = "/kakao", method = RequestMethod.GET)
		public String kakaoLogin(@RequestParam(value = "code", required = false) String code, MemberVO member, HttpSession session, Model model) throws Throwable {
//			System.out.println("code : " + code);
			String access_Token = service.getKaKaoAccessToken(code);
//	        System.out.println("controller access_token : " + access_Token);
	        HashMap<String, Object> userInfo = service.createKakaoUser(access_Token);
//	        System.out.println("login Controller : " + userInfo);
//	        System.out.println(userInfo.get("id"));
	        
	        if (userInfo.get("id") != null) {
	        	String kakao_id = (String)userInfo.get("id");
	        	MemberVO dbMember = service.getMemberKakaoLogin(kakao_id);
	        	if(dbMember != null) {
	        		session.setAttribute("kakao_id", kakao_id);
		            session.setAttribute("access_Token", access_Token);
		            session.setAttribute("sId", dbMember.getMember_id());
		            session.setAttribute("sName", dbMember.getMember_name());
		            session.setAttribute("sPhone", dbMember.getMember_phone_num());
		            session.setAttribute("sEmail1", dbMember.getMember_email1());
		            session.setAttribute("sEmail2", dbMember.getMember_email2());
		            session.setAttribute("loginUser", dbMember);
		            model.addAttribute("msg", "로그인에 성공했습니다. 메인페이지로 이동합니다."); // 출력할 메세지
					model.addAttribute("targetURL", "Main"); // 이동시킬 페이지
					return "forward";
	        	} else {
	        		session.setAttribute("kakao_id", (String)userInfo.get("id"));
		            session.setAttribute("access_Token", access_Token);
		            model.addAttribute("msg", "입력된 정보가 없습니다. 회원가입 페이지로 이동합니다."); // 출력할 메세지
					model.addAttribute("targetURL", "JoinAgree"); // 이동시킬 페이지
					return "forward";
	        	}
			} else {
				model.addAttribute("msg", "다시 시도해주세요"); // 출력할 메세지
				return "fail_back";
			}
		}
		
		@GetMapping("KakaoConnect")
		public String kakaoConnect(Model model, HttpSession session) {
			String kakao_id = (String)session.getAttribute("kakao_id");
			if(kakao_id == null) {
				model.addAttribute("msg", "카카오 로그인부터 진행합니다."); // 출력할 메세지
				model.addAttribute("targetURL", "Login"); // 이동시킬 페이지
				return "forward";
			} else {
				model.addAttribute("msg", "카카오 연동을 위해 로그인이 필요합니다."); // 출력할 메세지
				model.addAttribute("targetURL", "KakaoConnectLogin"); // 이동시킬 페이지
				return "forward";
			}
		}
		
		@GetMapping("KakaoConnectLogin")
		public String kakaoConnectLogin() {
			return "other/loginKakao";
		}
		
		@PostMapping("KakaoLoginPro")
		public String kakaoLoginPro(MemberVO member, HttpSession session, String member_id, Model model) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			
			MemberVO dbMember = service.getMemberLogin(member_id);
//			System.out.println(dbMember.getMember_passwd());
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
					session.setAttribute("sPhone", dbMember.getMember_phone_num());
					session.setAttribute("loginUser", dbMember);
					session.setAttribute("sEmail1", dbMember.getMember_email1());
		            session.setAttribute("sEmail2", dbMember.getMember_email2());
					String kakao_id = (String)session.getAttribute("kakao_id");
					int updateCount = service.addKakaoId(member_id, kakao_id);
					if(updateCount > 0) {
						return "redirect:/Main";
					} else {
						model.addAttribute("msg", "로그인 정보를 다시 확인해주세요.");
						return "fail_back";
					}
				}
			}
		}
		
		@GetMapping("Post")
		public String goPost(Model model, @RequestParam(defaultValue = "") String targetURL) {
//			System.out.println(targetURL);
			model.addAttribute("targetURL", targetURL);
			return "post";
		}
		
		@PostMapping("LoginPro")
		public String loginPro(
				String member_id, MemberVO member, @RequestParam(required = false) boolean rememberId, HttpSession session, HttpServletResponse response, Model model) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
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
					session.setAttribute("loginUser", dbMember);
					session.setAttribute("sId", member.getMember_id());
					session.setAttribute("sName", dbMember.getMember_name());
					session.setAttribute("sPhone", dbMember.getMember_phone_num());
					session.setAttribute("sEmail1", dbMember.getMember_email1());
		            session.setAttribute("sEmail2", dbMember.getMember_email2());
					Cookie cookie = new Cookie("cookieId", member.getMember_id());
					System.out.println(rememberId);
					if(rememberId) { // 아이디 저장 체크됨
						cookie.setMaxAge(60 * 60 * 24 * 30);
					} else { // 아이디 저장 미체크
						cookie.setMaxAge(0); // 쿠키 즉시 삭제한다는 의미
					}
					response.addCookie(cookie);
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
			String member_id = service.getMember(member_name);
			String member_id_2 = service.getMemberId(member_phone_num);
			System.out.println("입력받은 이름 : " + member.getMember_name());
			System.out.println("입력받은 번호 : " + member.getMember_phone_num());
			System.out.println("아이디 : " + member_id);
			System.out.println("아이디2 : " + member_id_2);
			
			if(member_id.equals(member_id_2)) { // 성공
				session.setAttribute("sName", member.getMember_name());
				session.setAttribute("sId", member_id);
				session.setAttribute("sPhone", member_phone_num);
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
