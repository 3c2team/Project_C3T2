package com.itwillbs.c3t2.service;

import java.util.List;
import java.util.Map;

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
		public ReservationVO selectReservation(int reservation_guest_num, String reservation_email) {
			ReservationVO reservation = mapper.selectNumEmail(reservation_guest_num, reservation_email);
			
			return reservation;
		}
		
		// 예약 수정
		public int updateReservation(ReservationVO reservation) {
			return mapper.updateReservation(reservation);
		}

		// 예약 번호로 조회
		public ReservationVO selectNumName(int reservation_guest_num, String reservation_person_name) {
			return mapper.selectNumName(reservation_guest_num, reservation_person_name);
		}
		
		// 
		public int deleteReservation(int reservation_guest_num, String reservation_person_name) {
			return mapper.deleteReservation(reservation_guest_num, reservation_person_name);
		}
		
		// 예약 번호를 조회
		public ReservationVO selectNameEmail(String reservation_person_name, String reservation_email) {
			return mapper.selectNameEmail(reservation_person_name, reservation_email);
		}

		public List<Map<String, String>> selectDateCount(Map<String, String> param) {
			return mapper.selectDateCount(param);
		}
		
		

		
}
