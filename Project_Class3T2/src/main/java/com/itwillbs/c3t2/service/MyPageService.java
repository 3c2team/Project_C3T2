package com.itwillbs.c3t2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.MyPageMapper;
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
	public List<ReviewVO> getReviewDetail(Integer member_num) {
		return mapper.selectReviewDetail(member_num);
		
	}
	// 상품 구매 내역
	public List<UserOrderVO> getOrderList(Integer member_num) {
		return mapper.getOrderList(member_num);
	}

	// 찜 목록
	public List<FavoriteVO> getFavorite(String member_id) {
		return mapper.getFavorite(member_id);
	}
	// 찜 목록 삭제
	public boolean deleteFavorite(Integer favoriteNum) {
        int result = mapper.deleteFavorite(favoriteNum);
        return result > 0;  // 삭제된 행의 수가 0보다 크면 true를 반환, 그렇지 않으면 false를 반환
    }
	
	// 예약 내역
	public List<ReservationVO> getReservationDetail(Integer member_num) {
		return mapper.getReservation(member_num);
	}
	
}
