package com.itwillbs.c3t2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.AdminMapper;
import com.itwillbs.c3t2.mapper.MemberMapper;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public List<MemberVO> selectMemberList() {
		
		return mapper.selectMemberList();
	}
	public List<ReservationVO> getReservationList() {

		return mapper.selectReservationList();
	}
	

}
