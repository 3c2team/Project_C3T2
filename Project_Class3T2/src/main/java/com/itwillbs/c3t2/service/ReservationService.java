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
		public int registReservation(ReservationVO reservation) {
			return mapper.insertReservation(reservation);
		}
		
//		// 예약 상세정보 조회 요청
//		public ReservationVO getReservation(ReservationVO reservation) {
//			return mapper.selectReservation(reservation);
//		}

		
}
