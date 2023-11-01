package com.itwillbs.c3t2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.c3t2.mapper.MyPageMapper;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ReservationVO;
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
	public List<ReviewVO> getReviewDetail(String member_num) {
		return mapper.selectReviewDetail(member_num);
		
	}
	// 상품 구매 내역
	public List<UserOrderVO> getOrderList(String member_num) {
		return mapper.getOrderList(member_num);
	}

//	// 찜 목록
//	public List<FavoriteVO> getFavorite(String member_id) {
//		return mapper.getFavorite(member_id);
//	}
	// 찜 목록 삭제
	public boolean deleteFavorite(Integer favoriteNum) {
        int result = mapper.deleteFavorite(favoriteNum);
        return result > 0;  // 삭제된 행의 수가 0보다 크면 true를 반환, 그렇지 않으면 false를 반환
    }
	
	// 예약 내역
	public List<ReservationVO> getReservationDetail(String member_id) {
		return mapper.getReservation(member_id);
	}

	//비밀번호 업데이트
	public Integer updatePassword(Map<String, Object> param) {
		return mapper.updatePassword(param);
	}

	public Integer updateMember(MemberVO memberVO) {
		return mapper.updateMember(memberVO);
	}

	
	@Transactional
	public void mypageMemberOut(Map<String, Object> paraMap)  throws Exception  {
		
		//2.회원 탈퇴 처리 
		try {
			 mapper.deleteMemberOut(paraMap);	
		} catch (RuntimeException e) {
			throw new RuntimeException();
		}
		//1.회원 탈퇴 사유 등록 처리
		mapper.insertMbershipWithdrawal(paraMap);						
	}

	/**
	 * 장바구니 목록
	 * @param member_id
	 * @return
	 */
	public List<CartVO> getCartList(Map<String, Object> paraMap) {
		return 	mapper.getCartList(paraMap);
	}

	
	/**
	 * 장바구니 전체 갯수
	 * @param member_id
	 * @return
	 */
	public int getCartTotalCount(Map<String, Object> parMap) {
		return 	mapper.getCartTotalCount(parMap);
	}
	
	// 장바구니 삭제
	public boolean deleteCartItem(int cartNum) {
		int result = mapper.deleteCartItem(cartNum);
		return result > 0;  // 삭제된 항목의 수가 0보다 크면 true를 반환, 그렇지 않으면 false를 반환
	}
	
	// 찜 전체 갯수
	public int getFavoriteTotalCount(Map<String, Object> paraMap) {
		return mapper.getZzimTotalCount(paraMap);
	}
	// 찜 목록
	public List<FavoriteVO> getFavoriteList(Map<String, Object> parMap) {
		return mapper.getZzimList(parMap);
	}
	// 예약 취소
	public void cancelReservation(int reservationNum) {
        mapper.cancelReservation(reservationNum);
    }
		
	
	
}
