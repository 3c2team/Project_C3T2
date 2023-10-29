package com.itwillbs.c3t2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ReservationMapper;
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

		public int updateReservation(int reservation_guest_num) {
			return mapper.updateReservation(reservation_guest_num);
		}

		// 파일명 조회 요청
		public ReservationVO getGuestNum(ReservationVO reservation) {
			return mapper.selectGuestNum(reservation);
		}

		// 글 삭제 요청
		public int removeReservation(ReservationVO reservation) {
			return mapper.deleteReservation(reservation);
		}



		
}
