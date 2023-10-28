package com.itwillbs.c3t2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c3t2.handler.GenerateRandomCode;
import com.itwillbs.c3t2.service.ReservationService;
import com.itwillbs.c3t2.vo.MemberVO;
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
	
	
	
	// 예약 폼 전송, 예약 확인 페이지 이동
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, Model model) {
		
		// 예약번호 랜덤
//		String reservationNum = GenerateRandomCode.getRandomCode(10); // 길이 10 만큼의 난수 생성
		
		// 회원가입 작업 요청
//		System.out.println(reservation);
		
		int insertCount = service.insertReservation(reservation);
		
		// => 실패 시 "fail_back.jsp" 포워딩(Model 객체의 "msg" 속성값으로 "회원 가입 실패!" 저장)
		if(insertCount > 0) { // 성공
			System.out.println(reservation);
			return "redirect:/ReservationSuccess";
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
	public String reservationSearchInfo(ReservationVO reservation, HttpSession session, Model model) {

		ReservationVO dbReservation = service.getReservation(reservation);
		System.out.println(dbReservation);
		
		model.addAttribute("reservation", dbReservation);
//		session.setAttribute("sGuestNum", reservation.getReservation_guest_num());
		
		return "reservation/reservation_search_Info";
	}
	
	// 비회원 예약 취소 페이지 이동
	@GetMapping("/ReservationCancel")
	public String reservationcancel() {
		return "reservation/reservation_cancel";
	}
	
	// 비회원 예약 정보 수정
	@GetMapping("/ReservationUpdate")
	public String reservationUpdate(ReservationVO reservation, int reservation_guest_num, HttpSession session, Model model) {
//		@RequestParam(defaultValue = "1") String pageNum,
		
		int sGuestNum = (int)session.getAttribute("sGuestNum");
		if(sGuestNum < 0) {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "fail_back";
		}
		
		ReservationVO dbReservation = service.updateReservation(reservation_guest_num);
//		System.out.println(dbReservation);
		
		// 회원 상세정보를 Model 객체에 저장
		model.addAttribute("reservation", dbReservation);
		return "reservation/reservation_update";
	}
	
	//예약 성공 이동
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess() {
		return "reservation/reservation_success";
	}
	
    
//	// 2) 리턴타입을 void 로 명시하고 HttpServletResponse 객체를 통해 응답 데이터를 출력
//	@ResponseBody
//	@PostMapping("/IsSchedule")
//	public void isSchedule(ScheduleVO schedule, HttpSession session, HttpServletResponse response) {
////		System.out.println(board.getBoard_num() + ", " + board.getBoard_file1());
//		
//		// Service - removeBoardFile() 메서드를 호출하여 지정된 파일 삭제 요청
//		// => 파라미터 : BoardVO 객체(글번호, 삭제할 파일명)   리턴타입 : int(deleteCount)
////		int deleteCount = service.removeBoardFile(board);
//		int seleCount = service.isSchedule(schedule.getBoard_file1(), schedule);
//		
//		
//		String uploadDir = "/resources/upload"; // 가상의 경로
//		String saveDir = session.getServletContext().getRealPath(uploadDir); // 실제 경로
//		
////		try {
////			response.getWriter().print("test2222");
////		} catch (IOException e) {
////			e.printStackTrace();
////		}
//	}
}
