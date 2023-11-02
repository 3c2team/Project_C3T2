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

	public int registReview(Map<String, Object> map) {
		return mapper.insertReview(map);
	}
	
	public List<ReviewVO> getReviewList(int proNum) {
		return mapper.selectReviewList(proNum);
	}

	public List<QnAVO> getQnAList(int proNum) {
		return mapper.selectQnAList(proNum);
	}

	public int registQuestion(QnAVO question) {
		return mapper.insertQuestion(question);
	}

	public int registFavorite(FavoriteVO favorite) {
		return mapper.insertFavorite(favorite);
	}
}
