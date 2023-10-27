package com.itwillbs.c3t2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.ReviewVO;

@Mapper
public interface ProductMapper {
	public List<ProductVO> selectProductBestList();
	
	List<ProductVO> selectProductHotList();

	public List<ProductVO> selectProductNewList();
	
//	public List<ProductVO> selectCategoryList(String category); // 오류 수정중
	
	public ProductVO selectProductDetail(int proNum);

	public List<ProductImgVO> selectProductImg(int proNum);

	public int insertReview(ReviewVO review);

	
}