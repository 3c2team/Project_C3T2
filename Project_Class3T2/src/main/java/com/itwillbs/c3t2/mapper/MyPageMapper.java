package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.itwillbs.c3t2.service.MyPageService;

import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReviewVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Mapper
public interface MyPageMapper {
	


	List<ReviewVO> selectReviewDetail = null;

	//상품 구매내역
	List<UserOrderVO> getOrderList();
	
	// 회원 상세정보 조회
	MemberVO selectMemberDetails(String member_id);
	
	//리뷰 상세내역 조회
	List<ReviewVO> selectReviewDetail(Integer member_num);
	
	//비번 다시한번 묻기
	
	// memberId를 기반으로 특정 회원의 정보를 가져오는 메서드
	MemberVO selectPassword(String member_id);


	
	
}
