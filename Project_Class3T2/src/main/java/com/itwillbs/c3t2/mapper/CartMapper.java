package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductVO;

public interface CartMapper {
	
		// CART 상품 조회
		public List<ProductVO> selectProductCartList(@Param("proNum") int proNum,@Param("sId") String sId);

		// 메인 페이지에서 CART 상품 조회
		public List<ProductVO> selectProductCartList(String sId);

		// 카트페이지에서 회원정보 출력
		public List<MemberVO> selectPayMember(String sId);

		// CART에 해당 상품 있는지 조회
		public CartVO selectCartMember(@Param("proNum") int proNum,@Param("sId") String sId);

		// CART에 상품 담기
		public int insertCart(@Param("sId") String sId, @Param("proNum") int proNum,@Param("proCount") int proCount);

//		public List<ProductVO> selectMainCartList(String sId);

		// 한가지 선택 상품 삭제
		public int deleteCartProduct(int proNum);

		// 카트페이지에서 회원아이디 Cart 테이블에 저장
		public List<ProductVO> insertCart(String sId);
		
		// 카트 상품 금액 계산 결과
		public int updateCartPrice(String sId);
		
		// CART에 담은 상품 총액 계산
		public CartAllPriceVO selectCartAllPrice(String sId);

		// 선택 상품 삭제 진행
		public int deleteSelectCart(int proNum1);

		// 장바구니 비우기
		public int deleteAll(String sId);

}
