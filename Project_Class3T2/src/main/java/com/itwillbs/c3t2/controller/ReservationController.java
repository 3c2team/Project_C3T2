package com.itwillbs.c3t2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c3t2.handler.GenerateRandomCode;
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

			// 예약 확인 이메일 전송
//			String email = reservation.getEmail1() + "@" + reservation.getEmail2();
//			String authCode = mailService.sendAuthMail(reservation.getId(), email);
//			service.registAuthInfo(reservation.getName(), authCode);
			return "redirect:/ReservationSuccess";
		} else { // 실패
			model.addAttribute("msg", "예약 실패!");
			return "fail_back";
		}
	}
	
	//비회원 예약 검색 페이지 이동
	@GetMapping("/ReservationGuestSearch")
	public String reservationGuestSearch() {
		return "reservation/reservation_guest_search";
	}
	
	//비회원 예약 조회 페이지 이동
	@GetMapping("/ReservationGuestSearchInfo")
	public String reservationGuestSearchInfo() {
		return "reservation/reservation_guest_search_Info";
	}
	
	//비회원 예약 취소 페이지 이동
	@GetMapping("/ReservationGuestCancle")
	public String reservationGuestCancle() {
		return "reservation/reservation_guest_cancle";
	}
	
	//예약 성공 이동
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess() {
		return "reservation/reservation_success";
	}
	
//
	// "/ReservationDetail" 예약 상세정보 조회 요청 비즈니스 로직
	@GetMapping("/ReservationList")
	public String reservationList(@RequestParam int reservation_num, Model model) {
		// BoardService - getBoard() 메서드 호출하여 글 상세정보 조회 요청
		// => 파라미터 : 글번호   리턴타입 : BoardVO(board)
		ReservationVO reservation = service.selectReservation(reservation_num);
		
		// 조회 결과 저장
		model.addAttribute("reservation", reservation);
		
		return "reservation/reservation_info";
	}
//    
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
