package com.itwillbs.c3t2.service;

import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.handler.GenerateRandomCode;
import com.itwillbs.c3t2.handler.SendMailClient;


@Service
public class SendMailService {
	
	// 인증 메일 발송 요청을 위한 sendAuthMail() 메서드 정의
	public String sendAuthMail(String id, String email) {
		// 인증 메일에 포함시킬 난수 생성
		String authCode = GenerateRandomCode.getRandomCode(50); // 길이 50 만큼의 난수 생성
//		System.out.println(authCode);
		// -----------------------------------------------------------
		// 인증 메일에 포함시킬 제목과 본문 생성
		String subject = "[J'ai Faim] 가입 인증 메일입니다.";
//		String content = "인증코드 : " + authCode;
		// 사용자가 인증 메일 내의 링크 클릭 시 인증 수행을 위한 서블릿 주소를 요청하도록
		// 인증 메일 본문에 하이퍼링크를 사용하여 인증 코드 및 사용자 구별에 사용할 아이디 포함
		String content = "<a href='http://localhost:8081/c3t2/MemberEmailAuth?id=" + id + "&auth_code=" + authCode + "'>"
							+ "이메일 인증을 위해 이 링크를 클릭해 주세요!</a>";
		// -----------------------------------------------------------
		// SendMailClient 인스턴스 생성 후 sendMail() 메서드를 호출하여 인증 메일 발송 요청
		// => 단, 메일 발송과 인증 코드 등록 작업을 별도로 동작시키기 위해
		//    자바의 쓰레드(Thread) 기능 활용
		// => 이 때, 익명 객체를 활용하여 1회용 쓰레드 생성
		// => new Thread(new Runnable() { public void run() { 멀티쓰레드 코드... } }).start();
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				SendMailClient mailClient = new SendMailClient();
				mailClient.sendMail(email, subject, content);
			}
		}).start();
		
		// 발송된 인증코드 리턴
		return authCode;
	}
	
}