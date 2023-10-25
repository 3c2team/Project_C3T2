package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.itwillbs.c3t2.service.MyPageService;

import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Mapper
public interface MyPageMapper {
	
	//상품 구매내역
	List<UserOrderVO> getOrderList();
	
	// 회원 상세정보 조회
	MemberVO selectMemberDetails(String member_id);
}
