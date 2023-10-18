package com.itwillbs.c3t2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.c3t2.service.StoreService;
import com.itwillbs.c3t2.vo.ProductVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@GetMapping("StoreBest")
	public String best() {
		return "store/store_best";
	}
	
	
	@GetMapping("StoreKit")
	public String mealKit() {
		return "store/store_kit";
	}
	
	@GetMapping("StoreNew")
	public String storeNew(Model model) {
		List<ProductVO> newList = service.getProductNewList();
		System.out.println(newList);
		
		model.addAttribute("newList", newList);
		
		return "store/store_new";
	}
	
	@GetMapping("ProductDetail")
	public String productDetail(int proNum, Model model) {
//		ProductVO productDetail = service.getProductDetail(proNum);
//		System.out.println(productDetail);
//		
//		model.addAttribute("productDetail", productDetail);
		
		return "store/product_detail";
	}
}
