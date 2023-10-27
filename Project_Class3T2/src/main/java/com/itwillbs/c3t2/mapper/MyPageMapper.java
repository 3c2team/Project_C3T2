package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReviewVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Mapper
public interface MyPageMapper {
	



	
	// 회원 상세정보 조회
	MemberVO selectMemberDetails(String member_id);
	
	//리뷰 상세내역 조회
	List<ReviewVO> selectReviewDetail(Integer member_num);
	
	//상품 구매내역
	List<UserOrderVO> getOrderList(Integer member_num);
	
	//비번 재입력
	MemberVO selectMember(MemberVO member);
	
	// 찜 목록
	List<FavoriteVO> getFavorite(String member_id);

	
	// 찜 목록 삭제
	int deleteFavorite(Integer favoriteNum);
	


	
	
}
