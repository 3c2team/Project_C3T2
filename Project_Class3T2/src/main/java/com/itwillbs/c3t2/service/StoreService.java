package com.itwillbs.c3t2.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ProductMapper;
import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;

@Service
public class StoreService {
	@Autowired
	private ProductMapper mapper;

	public List<ProductVO> getProductbestList() {
		return mapper.selectProductBestList();
	}
	
	public List<ProductVO> getProductHotList() {
		return mapper.selectProductHotList();
	}

	public List<ProductVO> getProductNewList() {
		return mapper.selectProductNewList();
	}

//	public List<ProductVO> getCategoryList(String category) {
//		return mapper.selectCategoryList(category);
//	}	// 오류 수정중
	
	public ProductVO getProductDetail(int proNum) {
		return mapper.selectProductDetail(proNum);
	}

	public List<ProductImgVO> getProductImg(int proNum) {
		return mapper.selectProductImg(proNum);
	}
	// 카트에 담은 상품 조회 (= peoduct_num)
		public List<ProductVO> getProductCartList(int proNum, String sId) {
			// TODO Auto-generated method stub
			return mapper.selectProductCartList(proNum, sId);
		}
		
		// 메인페이지에서 장바구니 이동 시 카트 조회
		public List<ProductVO> getMainCartList(String sId) {
			// TODO Auto-generated method stub
//			return mapper.selectMainCartList(sId);
			return mapper.selectProductCartList(sId);
		}

		// 카트 페이지에 온 회원 아이디 검색
		public List<MemberVO> memberAuth(String sId) {
			// TODO Auto-generated method stub
			return mapper.selectPayMember(sId);
		}
		
		// 같은 상품이 CART에 있는지 조회	
		public CartVO getCartMember(int proNum, String sId) {
			return mapper.selectCartMember(proNum, sId);
		}

		//카트에 해당 상품 담기 (수정 전)
//		public int registCart(String sId, int proNum) {
//			// TODO Auto-generated method stub
//			return  mapper.insertCart(sId, proNum);
//		}

		public List<ProductVO> getProductCartList(String sId) {
			// TODO Auto-generated method stub
			return mapper.insertCart(sId);
		}



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



	
	
	
	
	
}
