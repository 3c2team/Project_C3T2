package com.itwillbs.c3t2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c3t2.service.MyPageService;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.PointVO;
import com.itwillbs.c3t2.vo.ReservationVO;
import com.itwillbs.c3t2.vo.ReviewVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Mapper
public interface MyPageMapper {
	



	
	// 회원 상세정보 조회
	MemberVO selectMemberDetails(String member_id);
	
	//리뷰 상세내역 조회
	List<ReviewVO> selectReviewDetail(String member_num);
	
	// 찜 목록
	List<FavoriteVO> getFavorite(String member_id);
	
	// 찜 목록 삭제
	int deleteFavorite(Integer favoriteNum);
	
	// 예약 내역
	List<ReservationVO> getReservation(String member_id);

	//비밀번호 업데이트
	int updatePassword(Map<String, Object> param);

	//회원 업데이트
	int updateMember(MemberVO memberVO);

	//회원 탈퇴사유 등록
	int insertMbershipWithdrawal(Map<String, Object> paraMap);

	//회원 탈퇴 처리
	int deleteMemberOut(Map<String, Object> paraMap);

	//장바구니 목록
	List<CartVO> getCartList(Map<String, Object> paraMap);

	//장바구니 전체 갯수
	int getCartTotalCount(Map<String, Object> parMap);
	
	// 장바구니 삭제
	int deleteCartItem(int cartNum);
	
	// 찜 전체 개수
	int getZzimTotalCount(Map<String, Object> paraMap);
	
	// 찜 목록
	List<FavoriteVO> getZzimList(Map<String, Object> parMap);
	
	// 예약 취소
	void cancelReservation(int reservationNum);

	// 상품 리뷰 페이지 넘어가게하기
	ReviewVO getReviewByNum(int reviewNum);
	
	// 포인트 목록
	List<PointVO> selectPoints(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("memberId") String memberId, @Param("startRow") int startRow, @Param("listLimit") int listLimit);
	
	int selectPointsCount(@Param("startDate") String startDate, @Param("endDate") String endDate, @Param("memberId") String memberId);
	
	// 리뷰 개수
	int getReviewTotalCount(Map<String, Object> paraMap);
	
	// 리뷰 목록
	List<ReviewVO> getReviewList(Map<String, Object> parMap);
	
	// 구매 개수
	int getBuyTotalCount(Map<String, Object> paraMap);
	
	// 구매 목록
	List<UserOrderVO> getOrderList(Map<String, Object> parMap);

}
