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
	
	// PRODUCT_DETAIL에서 CART로 이동
			@GetMapping("CartPro")
			public String cart(int proNum, int proCount, Model model, HttpSession session, MemberVO member) {
				
				
				System.out.println("구매 회원 아이디 : " + session.getAttribute("sId"));
				
				// 로그인 회원 정보 저장
				String sId = (String)session.getAttribute("sId");
				
				// 비회원 장바구니 이동 시 접근 불가 
				if(sId == null ) {
					model.addAttribute("msg", "로그인 후 이용 부탁드립니다!");
					return "fail_back";
				}
				
				// 장바구니 이용 회원이 MEMBER DB에 있는지 확인
				List<MemberVO> payMember = service.memberAuth(sId);
				System.out.println("구매회원 정보 : " + payMember);
						
				// 같은 상품이 CART에 있는지 조회	
				CartVO productCart = service.getCartMember(proNum, sId);
				if(productCart != null) {
					model.addAttribute("msg", "이미 장바구니에 담긴 상품 입니다!");
					return "fail_back";
				}
				
				// PRODUCT_DETAIL 페이지에서 넘어 온 상품 수량
				System.out.println("상품 갯수 : " + proCount);
				
				
				// 카트에 상품 등록 (회원 아이디, 상품 번호, 상품 수량)
				int insertCart = service.registCart(sId, proNum, proCount);
				
				if(insertCart > 0) {
					System.out.println("CART 테이블에 product_num 등록 성공");
				}
				
				// 카트 상품 금액 계산 결과
				int cartPrice = service.registCartPrice(sId);
				
				// 카트 등록 상품 목록 조회
				List<ProductVO> productList = service.getProductCartList(proNum, sId); 
				System.out.println("상품 번호 : " + proNum);

				// 상품 목록 model 객체에 저장
				System.out.println("주문 상품 리스트 : " + productList);		
				model.addAttribute("productList", productList);
				
				// 카트 상품 총액
				CartAllPriceVO cartAllPrice = service.getCartAllPrice(sId);
				model.addAttribute("cartAllPrice", cartAllPrice);
				System.out.println("결과값 뭐임? :" + cartAllPrice);
				
				return "store/cart";
			}
		
		// 메인 페이지에서 장바구니로 이동
		@GetMapping("MainCart")
		public String mainCart(Model model, HttpSession session) {
			
			// 로그인 회원 정보 저장
			String sId = (String)session.getAttribute("sId");
			System.out.println("장바구니 아이디 : " + sId);
			
			// 카트 상품 금액 계산 결과
			int cartPrice = service.registCartPrice(sId);
			
			// 메인 페이지에서 카트 등록 상품 목록 조회
			List<ProductVO> productList = service.getMainCartList(sId);
			model.addAttribute("productList", productList);
			
			// 상품 목록 model 객체에 저장
			System.out.println("주문 상품 리스트 : " + productList);		
			model.addAttribute("productList", productList);
			
			// 카트 상품 총액
			CartAllPriceVO cartAllPrice = service.getCartAllPrice(sId);
			model.addAttribute("cartAllPrice", cartAllPrice);
			System.out.println("결과값 뭐임? :" + cartAllPrice);
					
			
			System.out.println("주문 상품 리스트: " + productList);		
			
			return "store/cart";
		}
	
		// 상품 하나 삭제 시 해당 상품 삭제
		@GetMapping("/DeleteCartProduct")
		public String deleteCart(int proNum, HttpSession session, Model model) {
			String sId = (String)session.getAttribute("sId");
//				System.out.println("삭제버튼 클릭 시 아이디 : " + sId);
			System.out.println("삭제할 상품 번호 : " + proNum);
			
			int deleteProduct = service.deleteCartProduct(proNum);
			if(deleteProduct > 0) {
				System.out.println(proNum + " : 삭제 완료");
			}
			
			List<ProductVO> productList = service.getMainCartList(sId);
			model.addAttribute("productList", productList);
			
			// 카트 상품 총액
			CartAllPriceVO cartAllPrice = service.getCartAllPrice(sId);
			model.addAttribute("cartAllPrice", cartAllPrice);
			System.out.println("결과값 뭐임? :" + cartAllPrice);
			
			
			return "store/cart";
		}
	
	
		@GetMapping("SelectDeleteCart")
		public String selectDeleteCart(HttpSession session, int[] proNum, Model model) {
			System.out.println("선택 삭제 시 넘어온 값 : " + proNum);
			String sId = (String)session.getAttribute("sId");
			
			System.out.println(proNum);
			
			// 선택 상품 삭제 작업
			for( int proNum1 : proNum) {
				
				int deleteProduct = service.selectDeleteCartProduct(proNum1);
				if(deleteProduct > 0) {
					System.out.println(proNum1 + " : 삭제 완료");
				}
			}
			
			// 메인 페이지에서 카트 등록 상품 목록 조회
			List<ProductVO> productList = service.getMainCartList(sId);
			model.addAttribute("productList", productList);

			// 카트 상품 총액
			CartAllPriceVO cartAllPrice = service.getCartAllPrice(sId);
			model.addAttribute("cartAllPrice", cartAllPrice);
			System.out.println("결과값 뭐임? :" + cartAllPrice);
			
			return "store/cart";
		}
		@GetMapping("productAllDelete")
		public String allDelete(HttpSession session) {
			String sId = (String)session.getAttribute("sId");
			
			//장바구니 비우기
			int cartDel = service.productAllDelete(sId);
			
			return "store/store_main";
		}	

		
		@GetMapping("Pay")
		public String pay(MemberVO member) {
			
			return "store/pay";
		}
}
