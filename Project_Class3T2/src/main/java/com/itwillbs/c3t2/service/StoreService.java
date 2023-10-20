package com.itwillbs.c3t2.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.ProductMapper;
import com.itwillbs.c3t2.vo.ProductVO;

@Service
public class StoreService {
	@Autowired
	private ProductMapper mapper;

	public List<ProductVO> getProductNewList() {
		return mapper.selectProductNewList();
	}

	public ProductVO getProductDetail(int proNum) {
		return mapper.selectProductDetail(proNum);
	}

	public List<ProductVO> getProductCartList(int proNum) {
		// TODO Auto-generated method stub
		return mapper.selectProductCartList(proNum);
	}
	
	
	
}
