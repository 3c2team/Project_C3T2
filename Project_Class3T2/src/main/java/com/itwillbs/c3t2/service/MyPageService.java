package com.itwillbs.c3t2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.MyPageMapper;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReviewVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Service
public class MyPageService {
	
	@Autowired
	private MyPageMapper mapper;
	
	//회원 상세내역
	public MemberVO getMemberDetails(String member_id) {
		return mapper.selectMemberDetails(member_id);
	}
	
	//리뷰 상세내역
	public List<ReviewVO> getReviewDetail(Integer member_num) {
		return mapper.selectReviewDetail(member_num);
		
	}
	// 상품 구매 내역
	public List<UserOrderVO> getOrderList(Integer member_num) {
		return mapper.getOrderList(member_num);
	}
	
	// 비번 점검
}
