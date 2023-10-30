package com.itwillbs.c3t2.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c3t2.service.ReservationService;
import com.itwillbs.c3t2.vo.ReservationVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	
	//예약 폼 페이지 이동
	@GetMapping("/ReservationForm")
	public String reservationForm() {
		return "reservation/reservation_form";
	}
	
	//예약 폼 페이지 이동
	@GetMapping("/ReservationInfo")
	public String reservationInfo() {
		return "reservation/reservation_info";
	}
	
	
	
	// 예약 폼 전송, 예약 확인 페이지 이동
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, Model model) {
		
		// 예약번호 랜덤숫자 6자리
		Random random = new Random();	// 랜덤 함수 선언
		int createNum = 0;  			// 1자리 난수
		String ranNum = ""; 			// 1자리 난수 형변환 변수
		int length = 6;					// 난수 자릿수:6
		String guestNum = "";  		// 결과 난수
		
		for (int i = 0; i < length; i++) { 
			createNum = random.nextInt(9);		// 0부터 9까지 올 수 있는 1자리 난수 생성
			ranNum =  Integer.toString(createNum);  // 1자리 난수를 String으로 형변환
			guestNum += ranNum;			// 생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
			reservation.setReservation_guest_num(Integer.parseInt(guestNum));
		}
		// 회원가입 작업 요청
//		System.out.println(reservation);
		
		int insertCount = service.insertReservation(reservation);
		
		// => 실패 시 "fail_back.jsp" 포워딩(Model 객체의 "msg" 속성값으로 "회원 가입 실패!" 저장)
		if(insertCount > 0) { // 성공
			System.out.println(reservation);
			model.addAttribute("reservation", reservation);
			return "reservation/reservation_success";
		} else { // 실패
			model.addAttribute("msg", "예약 실패!");
			return "fail_back";
		}
	}
	
	//비회원 예약 검색 페이지 이동
	@GetMapping("/ReservationSearch")
	public String reservationSearch() {
		return "reservation/reservation_search";
	}
	
	//비회원 예약 조회 페이지 이동
	@PostMapping("/ReservationSearchInfo")
	public String reservationSearchInfo(ReservationVO reservation, 
			@RequestParam int reservation_guest_num, 
			@RequestParam String reservation_person_phone, 
			Model model) {
		
		// 쿼리 조회
		System.out.println("!!!"+reservation_guest_num);
		System.out.println("!!!"+reservation_person_phone);
		ReservationVO dbReservation = service.getPersonName(reservation_guest_num, reservation_person_phone);
		System.out.println("예약객체 !!!!!!"+dbReservation);
//		dbReservation.setReservation_person_name(reservation.getReservation_person_name());
//		dbReservation.setReservation_guest_num(reservation.getReservation_guest_num());
		System.out.println("searchInfo: "+dbReservation);
		
		// 조회 사항 넘겨주기
		model.addAttribute("reservation", dbReservation);
		
		return "reservation/reservation_search_Info";
	}
	
	// 비회원 예약 취소 페이지 이동
	@GetMapping("/ReservationDelete")
	public String reservationDelete(ReservationVO reservation,
			@RequestParam String reservation_date, 
			@RequestParam int reservation_guest_num, 
			@RequestParam String reservation_person_name,
			Model model) {
		reservation = service.getPersonName(reservation_guest_num, reservation_person_name);
		System.out.println("delete : " + reservation_guest_num);
		System.out.println("delete : " + reservation_person_name);
		// BoardService - removeBoard() 메서드 호출하여 글 삭제 요청
		// => 파라미터 : BoardVO 객체   리턴타입 : int(deleteCount)
		int deleteCount = service.removeReservation(reservation_guest_num, reservation_person_name);
		model.addAttribute("reservation", reservation);
		if(deleteCount < 0) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		return "redirect:/Main";
	}
	
	// 비회원 예약 정보 수정
	@GetMapping("/ReservationUpdate")
	public String reservationUpdate(ReservationVO reservation, 
			@RequestParam int reservation_guest_num, 
			@RequestParam String reservation_person_name, Model model) {
		
		reservation = service.selectGuestNum(reservation_guest_num, reservation_person_name);
		System.out.println("update 날짜 : "+reservation.getReservation_date());
		
		System.out.println("update : "+reservation_guest_num);
		System.out.println("update : "+reservation_person_name);
		
		model.addAttribute("reservation", reservation);
		return "reservation/reservation_update";
	}
	
	// 비회원 예약 정보 수정
	@PostMapping("/ReservationUpdatePro")
	public String reservationUpdatePro(ReservationVO reservation, Model model) {
		
		int updateCount = service.updateReservation(reservation.getReservation_guest_num(), reservation.getReservation_person_name());
		if(updateCount < 0) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		// 회원 상세정보를 Model 객체에 저장
		return "ReservationSearchInfo";
	}
	
	//예약 성공 이동
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess(ReservationVO reservation, 
			@RequestParam String reservation_person_name, 
			@RequestParam String reservation_person_phone, 
			Model model) {
		reservation = service.getGuestNum(reservation_person_name, reservation_person_phone);
		
		model.addAttribute("reservation", reservation);
		System.out.println("예약번호 : " + reservation.getReservation_guest_num());
		return "reservation/reservation_success";
	}
	
}
