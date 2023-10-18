package com.itwillbs.c3t2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.MemberMapper;
import com.itwillbs.c3t2.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;

	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}
	

}
