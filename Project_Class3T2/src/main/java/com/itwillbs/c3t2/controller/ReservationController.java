package com.itwillbs.c3t2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	
	
	// 예약 폼 페이지 이동
	@GetMapping("/ReservationForm")
	public String reservationForm(Model model) {
		List<Map<String, Integer>> dinningMax = service.getDinningMax();
		model.addAttribute("dinningMax", dinningMax);
		return "reservation/reservation_form";
	}
	
	// 예약가능 여부 확인
	@ResponseBody
	@GetMapping("/ReservationSchedule")
	public List<Map<String, String>> reservationSchedule(@RequestParam Map<String, String> param) {
		return service.selectDateCount(param);
	}
	
	
	
	// 예약 폼 전송, 예약 확인 페이지 이동
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, HttpSession session, Model model, HttpServletRequest request) {
		
		// 예약 번호 - 6자리 랜덤 숫자
		reservation.setReservation_guest_num(GenerateRandomCode.getRandomNumCode(6, 6));
		reservation.setReservation_email(reservation.getReservation_email1() + "@" + reservation.getReservation_email2());
		reservation.setReservation_member_id((String)session.getAttribute("sId"));
		
		int insertCount = service.insertReservation(reservation);
		
		if(insertCount < 0) {
			model.addAttribute("msg", "예약 실패!");
			return "fail_back";
		}
		mailService.sendReservationMail(reservation);
		// 회원 상세정보를 Model 객체에 저장
		model.addAttribute("msg", "예약내역 이메일을 전송했습니다."); // 출력할 메세지
		model.addAttribute("targetURL", request.getContextPath() + "/ReservationSuccess" 
																 + "?"
																 + "reservation_guest_num=" + reservation.getReservation_guest_num());
		return "forward";
	}
	
	//예약 성공 이동
	@RequestMapping(value = "/ReservationSuccess", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservationSuccess(ReservationVO reservation, 
			@RequestParam int reservation_guest_num,
			Model model) {
		
		model.addAttribute("reservation", reservation);
		return "reservation/reservation_success";
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
		
		// 쿼리 조회
		ReservationVO dbReservation = service.selectReservation(reservation_guest_num, reservation_email1 + "@" + reservation_email2); 
		System.out.println("예약객체 !!!!!!"+dbReservation);
		
		// 조회 사항 넘겨주기
		if(dbReservation == null) {
			model.addAttribute("msg", "입력하신 정보가 맞지 않습니다. 입력한 내용을 확인하신 후 다시 시도해 주세요.");
			return "fail_back";
		}
		model.addAttribute("reservation", dbReservation);
		return "reservation/reservation_search_Info";
	}
	
	// 비회원 예약 취소 페이지 이동
	@GetMapping("/ReservationDelete")
	public String reservationDelete(ReservationVO reservation,
			@RequestParam int reservation_guest_num, 
			@RequestParam String reservation_person_name,
			Model model) {
		reservation = service.selectNumName(reservation_guest_num, reservation_person_name);
		
		int deleteCount = service.deleteReservation(reservation_guest_num, reservation_person_name);
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
		
		reservation = service.selectNumName(reservation_guest_num, reservation_person_name);
		reservation.setReservation_email1(reservation.getReservation_email().split("@")[0]);
		reservation.setReservation_email2(reservation.getReservation_email().split("@")[1]);
		model.addAttribute("reservation", reservation);
		return "reservation/reservation_update";
	}
	
	// 비회원 예약 정보 수정
	@PostMapping("/ReservationUpdatePro")
	public String reservationUpdatePro(ReservationVO reservation, Model model, HttpServletRequest request) {
		
		reservation.setReservation_email(reservation.getReservation_email1() + "@" + reservation.getReservation_email2()); //나눠주기 합치기
		int updateCount = service.updateReservation(reservation);
		if(updateCount < 0) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		mailService.sendReservationMail(reservation);
		// 회원 상세정보를 Model 객체에 저장
		model.addAttribute("msg", "예약내역 이메일을 전송했습니다."); // 출력할 메세지
		model.addAttribute("targetURL", request.getContextPath() + "/ReservationSearchInfo"
												+ "?"
												+ "reservation_guest_num=" + reservation.getReservation_guest_num()
												+ "&reservation_email1=" + reservation.getReservation_email1()
												+ "&reservation_email2=" + reservation.getReservation_email2());
		return "forward";
	}
}
