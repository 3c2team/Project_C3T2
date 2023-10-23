package com.itwillbs.c3t2.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ProductMapper;
import com.itwillbs.c3t2.vo.CartVO;
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

	public List<ProductVO> getProductCartList(int proNum) {
		// TODO Auto-generated method stub
		return mapper.selectProductCartList(proNum);
	}

	// 같은 상품이 CART에 있는지 조회	
	public CartVO getCartMember(int proNum) {
		return mapper.selectCartMember(proNum);
	}

	//카트에 해당 상품 담기
	public int registCart(String sId, int proNum, int proCount) {
		// TODO Auto-generated method stub
		return mapper.insertCart(sId, proNum, proCount);
	}
	
	// 선택 상품 삭제
	public int deleteCartProduct(int proNum) {
		// TODO Auto-generated method stub
		return mapper.deleteCartProduct(proNum);
	}

	// CART에 담긴 상품 보기 
	public List<ProductVO> getMainCartList(String sId) {
		// TODO Auto-generated method stub
		return mapper.selectMainCartList(sId);
	}
	
	
	
}
