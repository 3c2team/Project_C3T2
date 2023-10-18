package com.itwillbs.c3t2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.service.SendMailService;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.Member_AgreeVO;

@Controller
public class MainController {
		
		@Autowired
		private MemberService service;
	// 硫붿씤�럹�씠吏� �젒�냽 而⑦듃濡ㅻ윭
		
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
		
		@GetMapping("NewsEvent")
		public String newsEvent() {
			return "other/news";
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
		
		@GetMapping("Join")
		public String join() {
			return "other/join";
		}
		
		@PostMapping("/MemberJoinPro")
		public String joinPro(MemberVO member, Model model) {
			System.out.println(member);
			
			// ----- BCryptPasswordEncoder 객체 활용한 패스워드 암호화(= 해싱) -----
			// 입력받은 패스워드는 암호화 필요 => 복호화가 불가능하도록 단방향 암호화(해싱) 수행
			// => 평문을 해싱 후 MemberVO 객체의 passwd 에 덮어쓰기
			// => org.springframework.security.crypto.bcrypt 패키지의 BCryptPasswordEncoder 클래스 활용
			//    (spring-security-crypto 라이브러리 추가 또는 spring-security-web 라이브러리 추가)
			//    => 주의! spring-security-web 버전에 따른 컴파일러 버전 오류 발생할 수 있음
			//       (java.lang.UnsupportedClassVersionError: org/springframework/security/crypto/bcrypt/BCryptPasswordEncoder has been compiled by a more recent version of the Java Runtime (class file version 61.0), this version of the Java Runtime only recognizes class file versions up to 55.0 (클래스 [org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder]을(를) 로드할 수 없습니다)
			//       (class file version 이 55.0 일 경우 JDK 11, 61.0 일 경우 JDK 17 을 의미함)
			//       해결방법 : JDK 11 기준 spring-security-web 라이브러리 5.x.x 사용
			// => BCryptPasswordEncoder 활용한 해싱은 Salting(솔팅) 기능을 통해
			//    동일한 평문(원본 암호)이라도 매번 다른 결과값(암호문)을 얻을 수 있다!
			// 1. BcryptPasswordEncoder 클래스 인스턴스 생성
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			// 2. BcryptPasswordEncoder 객체의 encode() 메서드를 호출하여 
			//    원문(평문) 패스워드에 대한 해싱(= 암호화) 수행 후 결과값 저장
			//    => 파라미터 : Member 객체의 패스워드(평문 암호)   리턴타입 : String(암호문)
			String securePasswd = passwordEncoder.encode(member.getMember_passwd());
			// 3. 암호화 된 패스워드를 MemberVO 객체에 저장
			member.setMember_passwd(securePasswd);
			// ---------------------------------------------------------------------
			// MemberService - registMember() 메서드 호출하여 회원가입 작업 요청
			// => 파라미터 : MemberVO 객체   리턴타입 : int(insertCount)
			int insertCount = service.registMember(member);
			
			// 회원가입 성공/실패에 따른 페이지 처리
			// => 성공 시 "MemberJoinSuccess" 리다이렉트
			// => 실패 시 "fail_back.jsp" 포워딩(Model 객체의 "msg" 속성값으로 "회원 가입 실패!" 저장)
			if(insertCount > 0) { // 성공
				// ------------------------------------------------
				// 회원 가입 성공 시 인증 메일 발송 기능 추가
				// => SendMailService - sendAuthMail() 메서드 호출하여 인증 메일 발송 요청
				// => 파라미터 : 아이디, 이메일(= 회원 가입 시 입력한 정보)
				// => 리턴타입 : String(인증코드)
				String email = member.getMember_email1() + "@" + member.getMember_email2();
				String authCode = mailService.sendAuthMail(member.getMember_id(), email);
				
				// MemberService - registAuthCode() 메서드 호출하여
				// 인증 메일 발송에 사용된 아이디 및 인증 정보를 DB 에 등록
				// => 파라미터 : 아이디, 인증코드
				service.registAuthInfo(member.getMember_id(), authCode);
				
				// ------------------------------------------------
				return "redirect:/MemberJoinSuccess";
			} else { // 실패
				// 실패 시 메세지 출력 후 이전페이지로 돌아가는 기능을
				// 하나의 jsp 페이지로 모듈화하여 공통된 방식으로 처리
				model.addAttribute("msg", "회원 가입 실패!");
				return "fail_back";
			}
			
		}
		
		@GetMapping("JoinAgree")
		public String joinSuccess() {
			return "other/join_pro";
		}
		
		@PostMapping("JoinEnd")
		public String joinAgree(Member_AgreeVO memberAgree, Model model) {
			System.out.println(memberAgree);
			int insertCount = service.registAgreeMember(memberAgree);
			
			if(insertCount > 0) {
				return "redirect:/Main";
			} else {
				model.addAttribute("msg", "정보 동의 실패!");
				return "fail_back";
			}
		}
		
		//=============================
		//storeMapping
		@GetMapping("StoreBest")
		public String best() {
			return "store/store_best";
		}
		
		@GetMapping("StoreNew")
		public String storeNew() {
			return "store/store_new";
		}
		
		@GetMapping("StoreKit")
		public String mealKit() {
			return "store/store_kit";
		}
		
		@GetMapping("ProductDetail")
		public String productDetail() {
			return "store/product_detail";
		}
		
}
