package com.itwillbs.c3t2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c3t2.vo.ReservationVO;

@Mapper
public interface ReservationMapper {
	
	// 예약 폼에서 레코드 작성
	int insertReservation(ReservationVO reservation);

	// 비회원 예약 상세정보 조회
	ReservationVO getReservation(ReservationVO reservation);
	
	// 예약 번호로 조회
	ReservationVO selectNumName(@Param("reservation_guest_num") int reservation_guest_num, @Param("reservation_person_name") String reservation_person_name);
	
	// 예약자 성함 조회
	ReservationVO selectNumEmail(@Param("reservation_guest_num") int reservation_guest_num, @Param("reservation_email") String reservation_email);

	// 예약 번호를 조회
	ReservationVO selectNameEmail(@Param("reservation_person_name")  String reservation_person_name, @Param("reservation_email") String reservation_email);
	
	// 예약 수정
	int updateReservation(ReservationVO reservation);

	// 예약 취소
	int deleteReservation(@Param("reservation_guest_num") int reservation_guest_num, @Param("reservation_person_name") String reservation_person_name);
	
	// 예약 가능한 시간 조회
	List<Map<String, String>> selectDateCount(Map<String, String> param);

	// 좌석수 조회
	List<Map<String, Integer>> selectDinningMax();
	
}
