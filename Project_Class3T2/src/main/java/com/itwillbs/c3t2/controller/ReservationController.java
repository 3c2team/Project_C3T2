package com.itwillbs.c3t2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.c3t2.service.ReservationService;
import com.itwillbs.c3t2.vo.ReservationVO;

@Controller
public class ReservationController {
	// MemberService 객체 자동 주입
	@Autowired
	private ReservationService service;
	
	//예약 성공 이동
	@PostMapping("/ReservationPro")
	public String reservationPro(ReservationVO reservation, Model model) {
//		System.out.println(member);
		
		// ---------------------------------------------------------------------
		// ReservationService - registReservation() 메서드 호출하여 회원가입 작업 요청
		// => 파라미터 : ReservationVO 객체   리턴타입 : int(insertCount)
		int insertCount = service.registReservation(reservation);
		
		// 예약 성공/실패에 따른 페이지 처리
		// => 성공 시 "ReservationSuccess" 리다이렉트
		// => 실패 시 "fail_back.jsp" 포워딩(Model 객체의 "msg" 속성값으로 "회원 가입 실패!" 저장)
		if(insertCount > 0) { // 성공
		
			return "redirect:/MemberJoinSuccess";
		} else { // 실패
			// 실패 시 메세지 출력 후 이전페이지로 돌아가는 기능을
			// 하나의 jsp 페이지로 모듈화하여 공통된 방식으로 처리
			model.addAttribute("msg", "회원 가입 실패!");
			return "fail_back";
		}
		
	}
	
	// "/MemberJoinSuccess" 요청에 대해 "member/member_join_success.jsp" 페이지 포워딩
	// => GET 방식 요청, Dispatch 방식 포워딩
	@GetMapping("/ReservationSuccess")
	public String reservationSuccess() {
		return "reservation/reservation_success";
	}

    //예약 상세 정보 이동
    @GetMapping("ReservationInfo")
    public String reservationInfo() {
    	return "reservation/reservation_info";
    }
}
