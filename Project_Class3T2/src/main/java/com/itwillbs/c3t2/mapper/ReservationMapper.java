package com.itwillbs.c3t2.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c3t2.vo.ReservationVO;

@Mapper
public interface ReservationMapper {
	
	// 예약 폼에서 레코드 작성
	int insertReservation(ReservationVO reservation);

	// 비회원 예약 상세정보 조회
	ReservationVO getReservation(ReservationVO reservation);
	
	
	int updateReservation(int reservation_guest_num);
	
	// 예약 번호 조회
	ReservationVO selectGuestNum(ReservationVO reservation);
	
	// 예약 취소
	int deleteReservation(ReservationVO reservation);

	
	
}
