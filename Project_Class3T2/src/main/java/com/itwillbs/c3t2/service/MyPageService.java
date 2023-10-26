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
	
	// 상품 구매 내역
	public List<UserOrderVO> getOrderList() {
		return mapper.getOrderList();
	}
	//회원 상세내역
	public MemberVO getMemberDetails(String member_id) {
		return mapper.selectMemberDetails(member_id);
	}
	
	//리뷰 상세내역
	public List<ReviewVO> getReviewDetail(int memberNum) {
		return mapper.selectReviewDetail(memberNum);
	}
	
	// 비번 점검
	// 사용자가 입력한 비밀번호와 데이터베이스의 비밀번호를 비교하는 메서드
	public boolean MypagePasswdChange(String member_id, String member_passwd) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// 데이터베이스에서 해당 회원의 정보를 가져옴
		MemberVO member = mapper.selectPassword(member_id);
				
		// BCrypt를 사용하여 저장된 비밀번호와 입력된 비밀번호를 비교
		return encoder.matches(member_passwd, member.getMember_passwd());
	}
}
