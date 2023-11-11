package com.itwillbs.c3t2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.QnAVO;
import com.itwillbs.c3t2.vo.ReviewVO;

@Mapper
public interface ProductMapper {
	// Best 조회
	public List<ProductVO> selectProductBestList();
	// Hot 조회
	List<ProductVO> selectProductHotList();
	// New 조회
	public List<ProductVO> selectProductNewList();
	// Category 조회
	public List<ProductVO> selectProductCategoryList(int category_num);
	// 상품상세 조회
	public Map<String, Object> selectProductDetail(Map<String, Object> param);
	// 상품상세 이미지 조회
	public List<ProductImgVO> selectProductImg(int proNum);
	// 리뷰 리스트 조회
	public List<ReviewVO> selectReviewList(int proNum);
	// 리뷰 등록
	public int insertReview(Map<String, Object> map);
	// 문의하기 리스트 조회
	public List<QnAVO> selectQnAList(int proNum);
	// 문의하기 등록
	public int insertQuestion(QnAVO question);
	// 관심상품 등록
	public int insertFavorite(Map<String, Object> param);
	// 관심상품 삭제
	public int deleteFavorite(Map<String, Object> param);
}