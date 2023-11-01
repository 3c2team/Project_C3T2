package com.itwillbs.c3t2.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.itwillbs.c3t2.handler.GenerateRandomCode;
import com.itwillbs.c3t2.service.ReservationService;
import com.itwillbs.c3t2.service.SendMailService;
import com.itwillbs.c3t2.vo.ReservationVO;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService service;
	
	@Autowired 
	private SendMailService mailService;
	
	
	//예약 폼 페이지 이동
	@GetMapping("/ReservationForm")
	public String reservationForm() {
		return "reservation/reservation_form";
	}
	
//	@ResponseBody
//	@GetMapping("/ReservationSchedule")
//	public String reservationSchedule(String reservation_date) {
//		
//		
//	}
	
	
	
	// 예약 폼 전송, 예약 확인 페이지 이동
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, Model model) {
		
		// 예약 번호 - 6자리 랜덤 숫자
		reservation.setReservation_guest_num(Integer.parseInt(GenerateRandomCode.getRandomNumCode(6)));
//		System.out.println(reservation);
		reservation.setReservation_email(reservation.getReservation_email1() + "@" + reservation.getReservation_email2());
		
		int insertCount = service.insertReservation(reservation);
		
		if(insertCount > 0) { // 성공 시 success로 이동
			System.out.println(reservation);
			mailService.sendReservationMail(reservation);
			model.addAttribute("msg", "예약내역 이메일을 전송했습니다."); // 출력할 메세지
			model.addAttribute("reservation", reservation);
			return "reservation/reservation_success";
		} else { // => 실패 시 "fail_back.jsp" 포워딩
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
	@RequestMapping(value = "/ReservationSearchInfo", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservationSearchInfo(ReservationVO reservation,
			@RequestParam int reservation_guest_num, 
			@RequestParam String reservation_email1, 
			@RequestParam String reservation_email2, 
			Model model) {
		
		if(reservation_guest_num != reservation.getReservation_guest_num() || !reservation_email1.equals(reservation.getReservation_email1()) || !reservation_email2.equals(reservation.getReservation_email2())) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		System.out.println("!!!"+reservation_guest_num);
		System.out.println("!!!"+reservation_email1);
		System.out.println("!!!"+reservation_email2);
		// 쿼리 조회
		ReservationVO dbReservation = service.getPersonName(reservation_guest_num, reservation_email1+"@"+reservation_email2); 
		// 예약 조회 내역 없으면 fail back 구현해놓기!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		System.out.println("예약객체 !!!!!!"+dbReservation);
		
		// 조회 사항 넘겨주기
		model.addAttribute("reservation", dbReservation);
		
		return "reservation/reservation_search_Info";
	}
	
	// 비회원 예약 취소 페이지 이동
	@GetMapping("/ReservationDelete")
	public String reservationDelete(ReservationVO reservation,
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
		
		System.out.println("예약!!!!!!!!!!!!" + reservation);
		System.out.println("예약날짜!!!!!!" + reservation.getReservation_date());
		reservation.setReservation_email(reservation.getReservation_email1() + "@" + reservation.getReservation_email2()); // 메서드로 빼기
		System.out.println("이메일: " + reservation.getReservation_email());
		int updateCount = service.updateReservation(reservation);
//		int updateCount = service.updateReservation(reservation.getReservation_guest_num(), reservation.getReservation_person_name());
		if(updateCount < 0) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		// 회원 상세정보를 Model 객체에 저장
		return "redirect:/ReservationSearchInfo?"
				+ "reservation_guest_num=" + reservation.getReservation_guest_num() 
				+ "&reservation_email1=" + reservation.getReservation_email1() 
				+ "&reservation_email2=" + reservation.getReservation_email2();
//		return "";
	}
	
	//예약 성공 이동
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess(ReservationVO reservation, 
			@RequestParam String reservation_person_name, 
			@RequestParam String reservation_email, 
			Model model) {
		reservation = service.getGuestNum(reservation_person_name, reservation_email);
		
		model.addAttribute("reservation", reservation);
		System.out.println("예약번호 : " + reservation.getReservation_guest_num());
		return "reservation/reservation_success";
	}
	
}
