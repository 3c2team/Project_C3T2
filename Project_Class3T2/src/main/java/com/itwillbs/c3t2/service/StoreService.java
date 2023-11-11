package com.itwillbs.c3t2.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ProductMapper;
import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.QnAVO;
import com.itwillbs.c3t2.vo.ReviewVO;

@Service
public class StoreService {
	@Autowired
	private ProductMapper mapper;
	// Best 조회
	public List<ProductVO> getProductbestList() {
		return mapper.selectProductBestList();
	}
	// Hot 조회
	public List<ProductVO> getProductHotList() {
		return mapper.selectProductHotList();
	}
	// New 조회
	public List<ProductVO> getProductNewList() {
		return mapper.selectProductNewList();
	}
	// Category 조회
	public List<ProductVO> getProductCategoryList(int category_num) {
		return mapper.selectProductCategoryList(category_num);
	}
	// 상품상세 조회
	public Map<String, Object> getProductDetail(Map<String, Object> param) {
		return mapper.selectProductDetail(param);
	}
	// 상품상세 이미지 조회
	public List<ProductImgVO> getProductImg(int proNum) {
		return mapper.selectProductImg(proNum);
	}
	// 리뷰 리스트 조회
	public List<ReviewVO> getReviewList(int proNum) {
		return mapper.selectReviewList(proNum);
	}
	// 리뷰 등록
	public int registReview(Map<String, Object> map) {
		return mapper.insertReview(map);
	}
	// 문의하기 리스트 조회
	public List<QnAVO> getQnAList(int proNum) {
		return mapper.selectQnAList(proNum);
	}
	// 문의하기 등록
	public int registQuestion(QnAVO question) {
		return mapper.insertQuestion(question);
	}
	// 관심상품 등록
	public int registFavorite(Map<String, Object> param) {
		return mapper.insertFavorite(param);
	}
	// 관심상품 삭제
	public int deleteFavorite(Map<String, Object> param) {
		return mapper.deleteFavorite(param);
	}
}
