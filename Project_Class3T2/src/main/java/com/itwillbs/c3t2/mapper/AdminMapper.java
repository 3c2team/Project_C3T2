package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c3t2.vo.AdminVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Mapper
public interface AdminMapper {

	List<MemberVO> selectMemberList();
	List<ReservationVO> selectReservationList();
	AdminVO selectAdmin(AdminVO admin);

}
