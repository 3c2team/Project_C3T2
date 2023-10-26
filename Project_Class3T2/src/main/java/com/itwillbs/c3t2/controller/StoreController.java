package com.itwillbs.c3t2.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.c3t2.service.StoreService;
import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService service;
	
	@GetMapping("StoreBest")
	public String best(Model model) {
		List<ProductVO> bestList = service.getProductbestList();
//		System.out.println(bestList);
		
		model.addAttribute("bestList", bestList);
		return "store/store_best";
	}
	
	@GetMapping("StoreHot")
	public String storeHot(Model model) {
		List<ProductVO> hotList = service.getProductHotList();
//		System.out.println(hotList);
		
		model.addAttribute("hotList", hotList);
		
		return "store/store_hot";
	}
	
	
	@GetMapping("StoreNew")
	public String storeNew(Model model) {
		List<ProductVO> newList = service.getProductNewList();
//		System.out.println(newList);
		
		model.addAttribute("newList", newList);
		
		return "store/store_new";
	}
	
	@GetMapping("StoreKit")
	public String storeKit(Model model) {
		List<ProductVO> bestList = service.getProductbestList();
		model.addAttribute("bestList", bestList);
		return "store/store_kit";
	}	// 아래 코드 수정 전 까지 임시 사용
	
//	@RequestMapping("/Products")
//	public String category(@RequestParam("category") String category, Model model) {
//	    System.out.println("컨트롤러 왔다");
//		List<ProductVO> categoryList = service.getCategoryList(category);
//		System.out.println("list: " + categoryList);
//	    model.addAttribute("categoryList", categoryList);
//	    return "store/store_kit";
//	}	// 오류 수정중
	
	// 상세페이지~
	@GetMapping("ProductDetail")
	public String productDetail(int proNum, Model model) {
		ProductVO productDetail = service.getProductDetail(proNum);
		List<ProductImgVO> productImgList = service.getProductImg(proNum);
		
		List<ProductImgVO> productMiniImgList = new ArrayList<ProductImgVO>();
		ProductImgVO productInfoImg = new ProductImgVO();
		
		for(ProductImgVO proImg : productImgList ) {
			if(proImg.getProduct_image().contains("info")) {
				productInfoImg = proImg;
			} else {
				productMiniImgList.add(proImg);
			}
		}
		
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productMiniImgList", productMiniImgList);
		model.addAttribute("productInfoImg", productInfoImg);
		return "store/product_detail";
	}
	
	}
