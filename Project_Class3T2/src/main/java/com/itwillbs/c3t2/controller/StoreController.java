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
	
	@GetMapping("CartPro")
	public String cart(int proNum, Model model, HttpSession session, MemberVO member, int proCount) {
		
		System.out.println("구매 회원 아이디 : " + session.getAttribute("sId"));
		String sId = (String)session.getAttribute("sId");
		
		if(sId == null ) {
			model.addAttribute("msg", "로그인 후 이용 부탁드립니다!");
			return "fail_back";
		}
		
		System.out.println("상품 수량 : " + proCount);
		
		// CART페이지 회원 정보
//		List<MemberVO> payMember = service.memberAuth(sId);
//		System.out.println("구매회원 정보 : " + payMember);
				
		// 같은 상품이 CART에 있는지 조회	
		CartVO productCart = service.getCartMember(proNum);
		if(productCart != null) {
			model.addAttribute("msg", "이미 장바구니에 담긴 상품 입니다!");
			return "fail_back";
		}
		
		// 카트에 상품 등록 (회원 아이디, 상품 번호, 상품 수량)
		int insertCart = service.registCart(sId, proNum, proCount);
		
		if(insertCart > 0) {
			System.out.println("CART 테이블에 product_num 등록 성공");
		}
		
		//------------------------------------------------------------
		// 온라인 스토어에서 카트 페이지 넘어갈 때 등록 상품 목록 조회
		List<ProductVO> productList = service.getProductCartList(proNum); 
		
		System.out.println("상품 번호 : " + proNum);
//
		System.out.println("주문 상품 리스트1 : " + productList);		
		model.addAttribute("productList", productList);
		
		
		
		
		return "store/cart";
	}
	
//	@GetMapping("MainCart")
//	public String mainCart(Model model, HttpSession session) {
//		String sId = (String)session.getAttribute("sId");
//		System.out.println("장바구니 아이디 : " + sId);
//		
//		List<ProductVO> productList = service.getMainCartList(sId);
//		model.addAttribute("productList", productList);
//		
//		System.out.println("주문 상품 리스트: " + productList);		
//		
//		return "store/cart";
//	}
	
	@GetMapping("/DeleteCartProduct")
	public String deleteCart(int proNum, HttpSession session, Model model) {
		String sId = (String)session.getAttribute("sId");
		System.out.println("삭제버튼 클릭 시 아이디 : " + sId);
		System.out.println("삭제할 상품 번호 : " + proNum);
		
		int deleteProduct = service.deleteCartProduct(proNum);
		if(deleteProduct > 0) {
			System.out.println(proNum + " : 삭제 완료");
		}
		
		List<ProductVO> productList = service.getMainCartList(sId);
		model.addAttribute("productList", productList);
		
		return "store/cart";
	}
	
	
//	@GetMapping("SelectDeleteCart")
//	@ResponseBody
//	public void selectDeleteCart(HttpSession session, int proNum) {
//		System.out.println("삭제 시 넘어온 값 : " + proNum);
//	}

	
	@GetMapping("Pay")
	public String pay(MemberVO member) {
		
		return "store/pay";
	}
}
