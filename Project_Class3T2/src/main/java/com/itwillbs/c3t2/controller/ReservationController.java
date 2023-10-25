package com.itwillbs.c3t2.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.c3t2.service.ReservationService;
import com.itwillbs.c3t2.vo.ReservationVO;

@Controller
public class ReservationController {
	// MemberService 객체 자동 주입
	@Autowired
	private ReservationService service;
	
	// 예약 폼 전송
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, Model model
								,@RequestParam Map<String,Object> map) {
//		System.out.println(member);
		
		// ---------------------------------------------------------------------
		// ReservationService - registReservation() 메서드 호출하여 회원가입 작업 요청
		// => 파라미터 : ReservationVO 객체   리턴타입 : int(insertCount)
		System.out.println(map);
		System.out.println(reservation);
//		int insertCount = service.registReservation(reservation);
		
		// 예약 성공/실패에 따른 페이지 처리
		// => 성공 시 "ReservationSuccess" 리다이렉트
		// => 실패 시 "fail_back.jsp" 포워딩(Model 객체의 "msg" 속성값으로 "회원 가입 실패!" 저장)
//		if(insertCount > 0) { // 성공
//			System.out.println(reservation);
//			return "redirect:/ReservationSuccess";
//		} else { // 실패
			// 실패 시 메세지 출력 후 이전페이지로 돌아가는 기능을
			// 하나의 jsp 페이지로 모듈화하여 공통된 방식으로 처리
//			model.addAttribute("msg", "회원 가입 실패!");
			return "fail_back";
//		}
		
	}
	
	//예약 성공 이동
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess() {
		return "reservation/reservation_success";
	}
	
//
//	// "/ReservationDetail" 예약 상세정보 조회 요청 비즈니스 로직
//		@GetMapping("/ReservationList")
//		public String reservationList(@RequestParam int reservation_num, Model model) {
//			// BoardService - getBoard() 메서드 호출하여 글 상세정보 조회 요청
//			// => 파라미터 : 글번호   리턴타입 : BoardVO(board)
//			ReservationVO reservation = service.getReservation(reservation_num);
//			
//			// 조회 결과 저장
//			model.addAttribute("reservation", reservation);
//			
//			return "reservation/reservation_info";
//		}
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
