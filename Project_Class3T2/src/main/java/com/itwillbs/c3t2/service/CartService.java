package com.itwillbs.c3t2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.CartMapper;
import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.OrderDetailVO;
import com.itwillbs.c3t2.vo.PayAllPriceVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Service
public class CartService {
	
	@Autowired
	private CartMapper mapper;
	
	// 카트에 담은 상품 조회 (= peoduct_num)
	public List<ProductVO> getProductCartList(int proNum, String sId) {
		// TODO Auto-generated method stub
		return mapper.selectProductCartList(proNum, sId);
	}
	
	// 메인페이지에서 장바구니 이동 시 카트 조회
	public List<ProductVO> getMainCartList(String sId) {
		// TODO Auto-generated method stub
//		return mapper.selectMainCartList(sId);
		return mapper.selectProductCartList(sId);
	}

	// 카트 페이지에 온 회원 아이디 검색
//	public List<MemberVO> memberAuth(String sId) {
//		// TODO Auto-generated method stub
//		return mapper.selectPayMember(sId);
//	}
	
	// 같은 상품이 CART에 있는지 조회	
	public CartVO getCartMember(int proNum, String sId) {
		return mapper.selectCartMember(proNum, sId);
	}

	//카트에 해당 상품 담기 (수정 전)
//	public int registCart(String sId, int proNum) {
//		// TODO Auto-generated method stub
//		return  mapper.insertCart(sId, proNum);
//	}

//	public List<ProductVO> getProductCartList(String sId) {
//		// TODO Auto-generated method stub
//		return mapper.insertCart(sId);
//	}


	public int deleteCartProduct(int proNum) {
		// TODO Auto-generated method stub
		return mapper.deleteCartProduct(proNum);
	}

	
	//카트에 해당 상품 담기
	public int registCart(String sId, int proNum, int proCount) {
		// TODO Auto-generated method stub
		return  mapper.insertCart(sId, proNum, proCount);
	}
	
	//카트에 담은 총액 가져오기
	public CartAllPriceVO getCartAllPrice(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectCartAllPrice(sId);
	}

	// 카트 상품 금액 계산 결과
	public int registCartPrice(String sId) {
		// TODO Auto-generated method stub
		return mapper.updateCartPrice(sId);
	}

	// 선택 상품 삭제 
	public int selectDeleteCartProduct(int proNum1) {
		// TODO Auto-generated method stub
		return mapper.deleteSelectCart(proNum1);
	}

	// 장바구니 전체 삭제
	public int productAllDelete(String sId) {
		// TODO Auto-generated method stub
		return mapper.deleteAll(sId);
	}
	
	// 회원정보 조회
	public MemberVO getMember(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectPayMember(sId);
	}

	// 관심 상품 등록
	public int insertFavoriteProduct(String sId, int favoriteProNum) {
		// TODO Auto-generated method stub
		return mapper.insertFavoriteProduct(sId, favoriteProNum);
	}

	// 동일 상품이 관심상품에 있는지 확인
	public FavoriteVO selectFavoriteProduct(String sId, int favoriteProNum) {
		// TODO Auto-generated method stub
		return mapper.selectFavoriteProduct(sId, favoriteProNum);
	}
	
	// 선택 상품 주문
		public List<ProductVO> selectPayProduct(String sId) {
			// TODO Auto-generated method stub
			return mapper.selectPayProduct(sId);
		}

	// 전체 상품 주문 조회
	public List<ProductVO> selectAllPay(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectAllPay(sId);
	}

	// 선택 상품 ORDER_DETAIL에 저장
	public int insertOrderDetail(String sId, int proNum) {
		// TODO Auto-generated method stub
		return mapper.insertOrderDetail(sId, proNum);
	}

	//선택 상품 ORDER_DETAIL에 있는지 확인 작업
	public List<OrderDetailVO> getOrderDetail(String sId, int proNum) {
		// TODO Auto-generated method stub
		return mapper.selectOrderDetail(sId, proNum);
	}

	//ORDER_DETAIL 테이블 비우기
	public int deleteOrderDetail(String sId) {
		// TODO Auto-generated method stub
		return mapper.deleteOrderDetail(sId);
	}

	// 전체 상품 ORDER_DETAIL에 저장
	public int insertOrderDetail(String sId) {
		// TODO Auto-generated method stub
		return mapper.insertOrderDetailAll(sId);
	}

	// 페이 상품 총액
	public PayAllPriceVO getPaytAllPrice(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectPayAllPrice(sId);
	}

	// 결제 상품 삭제
	public int deletePayProduct(int proNum) {
		// TODO Auto-generated method stub
		return mapper.deletePayProduct(proNum);
	}

	// 회원의 배송 정보 저장 (포인트 사용 시)
	public int insertReceiverUsePoint(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertReceiverUsePoint(map);
	}

	// 회원의 배송 정보 저장 (포인트 미 사용 시)
	public int insertReceiverInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertReceiverInfo(map);
	}

	// 결제 상품명 조회
	public ProductVO selectProductNames(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectProductNames(sId);
	}

	public int insertUserOrder(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertUserOrder(map);
	}

	// 상품 상세에서 결제 페이지로 이동 시 상품 저장
	public int insertProduct(String sId, int proNumber, int proCount, int proPrice) {
		// TODO Auto-generated method stub
		return mapper.insertOrderDetailDirect(sId, proNumber, proCount, proPrice);
	}

	// CART에서 상품 수량 변경
	public int updateProductCount(String sId, int productCount, int productNumber) {
		// TODO Auto-generated method stub
		return mapper.updateProductCount(sId, productCount, productNumber);
	}

	// 상품 수량 변경 시 금액 계산 조회
	public CartVO selectCartPrice(String sId, int productNumber) {
		// TODO Auto-generated method stub
		return mapper.selectCartPrice(sId, productNumber);
	}

	// MEMBER 테이블에서 포인트 차감
	public int updateMemberPoint(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.updateMemberPoint(map);
	}

	// 주문 상품 CART에서 삭제 
	public int deletePaymentCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.deletePaymentCart(map);
	}

	// 사용한 포인트 POINT 테이블에 저장
	public int insertUsePoint(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertUsePoint(map);
	}

	// 최종 결제 금액 조회
	public UserOrderVO getUserOrderPrice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.selectUserOrderPrice(map);
	}

	// 적립 포인트 POINT 테이블에 저장
	public int updateAddPoint(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertAddPoint(map);
	}

	// 적립 포인트 MEMBER 테이블에 저장
	public int updateMemberAddPoint(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.updateMemberAddPoint(map);
	}
	
	// 결제 내역 확인
	public List<UserOrderVO> getUserOrder(String sId, String merchantUid) {
		// TODO Auto-generated method stub
		return mapper.selectUserOrder(sId, merchantUid);
	}





}
