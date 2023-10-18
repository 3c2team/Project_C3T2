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
	
	
	
}
