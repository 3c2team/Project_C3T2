package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;

@Mapper
public interface ProductMapper {
	public List<ProductVO> selectProductBestList();
	
	List<ProductVO> selectProductHotList();

	public List<ProductVO> selectProductNewList();
	
//	public List<ProductVO> selectCategoryList(String category); // 오류 수정중
	
	public ProductVO selectProductDetail(int proNum);

	public List<ProductImgVO> selectProductImg(int proNum);

	public List<ProductVO> selectProductCartList(int proNum);
}