package com.itwillbs.c3t2.service;

import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.handler.GenerateRandomCode;
import com.itwillbs.c3t2.handler.SendMailClient;
import com.itwillbs.c3t2.vo.ReservationVO;


@Service
public class SendMailService {
	
	public String sendAuthMail(String id, String email) {
		String authCode = GenerateRandomCode.getRandomCode(50);
		String subject = "[J'ai Faim] 가입 인증 메일입니다.";
		String content = "J'ai Faim 가입을 환영합니다. 아래 링크를 클릭하여 이메일 인증을 완료해주세요." 
							+ "<a href='http://c3d2306t2.itwillbs.com/Project_Class3T2/MemberEmailAuth?id=" + id + "&auth_code=" + authCode + "'>"
							+ "이메일 인증확인 링크</a>";
		new Thread(new Runnable() {
			@Override
			public void run() {
				SendMailClient mailClient = new SendMailClient();
				mailClient.sendMail(email, subject, content);
			}
		}).start();
		
		return authCode;
	}
	
	// 변경된 비밀번호 메일로 전송
	public String sendAuthMail_passwd(String id, String email) {
		String authCode = GenerateRandomCode.getRandomCode(8);
		String subject = "[J'ai Faim] 비밀번호 변경 메일입니다.";
		String content = "변경된 임시 비밀번호입니다. 로그인 후 비밀번호 변경해주세요!<br>" + authCode;
		new Thread(new Runnable() {
			@Override
			public void run() {
				SendMailClient mailClient = new SendMailClient();
				mailClient.sendMail(email, subject, content);
			}
		}).start();
		
		return authCode;
	}

	// 인증 메일 발송 요청을 위한 sendReservationMail() 메서드 정의
	public String sendReservationMail(ReservationVO reservation) {
		// 인증 메일에 포함시킬 난수 생성
		String authCode = GenerateRandomCode.getRandomCode(10); // 길이 50 만큼의 난수 생성
//		System.out.println(authCode);
		String subject = "[J'ai Faim] 예약 확인 메일입니다.";
//		String content = "인증코드 : " + authCode;
		// 사용자가 인증 메일 내의 링크 클릭 시 인증 수행을 위한 서블릿 주소를 요청하도록
		// 인증 메일 본문에 하이퍼링크를 사용하여 인증 코드 및 사용자 구별에 사용할 아이디 포함
		String content = "[J'ai Faim] 예약해주셔서 감사합니다.<br>"
				+ "예약 번호 : " + reservation.getReservation_guest_num() +"<br>"
				+ "예약자 성함 : " + reservation.getReservation_person_name() +"<br>"
				+ "예약 일자 : " + reservation.getReservation_date() + " " + reservation.getReservation_time() +"<br>"
				+ "예약 인원 : " + reservation.getReservation_person_count() +"<br>"
				+ "아래 링크를 클릭하여 예약 정보를 확인해주세요.<br>"
				+ "<a href='http://c3d2306t2.itwillbs.com/Project_Class3T2/ReservationSearchInfo?reservation_guest_num=" + reservation.getReservation_guest_num() 
				+ "&reservation_email1=" + reservation.getReservation_email1()
				+ "&reservation_email2=" + reservation.getReservation_email2()
				+ "'>"
				+ "주소 및 예약확인하러가기</a>";
		// -----------------------------------------------------------
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				SendMailClient mailClient = new SendMailClient();
				mailClient.sendMail(reservation.getReservation_email(), subject, content);
			}
		}).start();
		
		// 발송된 인증코드 리턴
		return authCode;
	}
}