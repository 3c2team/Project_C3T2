package com.itwillbs.c3t2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ReservationMapper;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationMapper mapper;
	
		// 예약작성 작업 요청
		public int insertReservation(ReservationVO reservation) {
			return mapper.insertReservation(reservation);
		}
		
		// 예약 상세정보 조회 요청
		public ReservationVO getReservation(ReservationVO reservation) {
			return mapper.getReservation(reservation);
		}

		public int updateReservation(ReservationVO reservation) {
			return mapper.updateReservation(reservation);
		}

		// 예약 번호를 조회
		public ReservationVO getGuestNum(String reservation_person_name, String reservation_email) {
			return mapper.getGuestNum(reservation_person_name, reservation_email);
		}
		
		// 파일명 조회 요청
		public ReservationVO selectGuestNum(int reservation_guest_num, String reservation_person_name) {
			return mapper.selectGuestNum(reservation_guest_num, reservation_person_name);
		}
		
		// 글 삭제 요청
		public int removeReservation(int reservation_guest_num, String reservation_person_name) {
			return mapper.deleteReservation(reservation_guest_num, reservation_person_name);
		}

		public ReservationVO getPersonName(int reservation_guest_num, String reservation_email) {
			return mapper.getPersonName(reservation_guest_num, reservation_email);
		}
		


		
}
