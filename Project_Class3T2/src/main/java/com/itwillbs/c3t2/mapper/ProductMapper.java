package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c3t2.vo.ProductVO;

@Mapper
public interface ProductMapper {

	public List<ProductVO> selectProductNewList();

	public ProductVO selectProductDetail(int proNum);

	public List<ProductVO> selectProductCartList(int proNum);
}