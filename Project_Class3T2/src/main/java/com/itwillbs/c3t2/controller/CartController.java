package com.itwillbs.c3t2.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.c3t2.service.CartService;
import com.itwillbs.c3t2.vo.CartAllPriceVO;
import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.FavoriteVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.OrderDetailVO;
import com.itwillbs.c3t2.vo.PayAllPriceVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Controller
public class CartController {
		
	@Autowired CartService service;

	// 장바구니로 이동
	@GetMapping("MainCart")
	public String mainCart(
					@RequestParam(value = "proNum", defaultValue = "0" ,required = false) int proNum
					, @RequestParam(value = "proCount", defaultValue = "0" ,required = false) int proCount
					, @RequestParam(value = "proNums",defaultValue = "0" ,required = false) int[] proNums
					, @RequestParam(value = "favoriteProNum", defaultValue = "0", required = false) int favoriteProNum
					, Model model
					, HttpSession session) {
		
		// 로그인 회원 정보 저장
		String sId = (String)session.getAttribute("sId");
		System.out.println("장바구니 아이디 : " + sId);
		
		// 비회원 장바구니 이동 시 접근 불가
		if(sId == null ) {
			model.addAttribute("msg", "로그인 후 이용 부탁드립니다!");
			return "fail_back";
		}
				
		// 같은 상품이 CART에 있는지 조회	
		CartVO productCart = service.getCartMember(proNum, sId);
		if(proNum > 0) {
			if(productCart != null) {
				model.addAttribute("msg", "이미 장바구니에 담긴 상품 입니다!");
				return "fail_back";
			}
		}
		
		// PRODUCT_DETAIL 페이지에서 넘어 온 상품 수량 
		if(proCount > 0) {
			System.out.println("상품 갯수 : " + proCount);
		}
		
		// 카트에 상품 등록 (회원 아이디, 상품 번호, 상품 수량) 
		if(proNum > 0) {
			int insertCart = service.registCart(sId, proNum, proCount);		
			if(insertCart > 0) {
				System.out.println("CART 테이블에 product_num 등록 성공");
			}
		}		
		
		// 카트 상품 금액 계산 결과
		int cartPrice = service.registCartPrice(sId);
		
		// 동일 상품이 관심상품에 있는지 확인
		FavoriteVO selectFavorite = service.selectFavoriteProduct(sId, favoriteProNum);
		
		if(selectFavorite != null) {
			model.addAttribute("msg", "동일 상품이 관심상품에 있습니다.");
			return "fail_back";
		}else {
			// 관심 상품 등록
			System.out.println("관심상품 번호 : " + favoriteProNum);
			if(favoriteProNum > 0) {
				int insertFavorite = service.insertFavoriteProduct(sId, favoriteProNum);
				if(insertFavorite > 0) {
					System.out.println("관심 상품 등록 완료!");
					model.addAttribute("msg", "관심상품 등록이 완료 됐습니다.");
					return "fail_back";
				}
			}
		}
		
		//ORDER_DETAIL 테이블 비우기
		int deleteOrderDetail = service.deleteOrderDetail(sId);
		if(deleteOrderDetail > 0) {
			System.out.println("CART에서 ORDER_DETAIL 삭제 완료");
		}
		
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
	
	@PostMapping("/CountChange")
	@ResponseBody
	public int countChange(
					@RequestParam(value = "productCount",defaultValue = "0", required = false) int productCount
					, @RequestParam(value = "productNumber",defaultValue = "0", required = false) int productNumber
					, HttpSession session) {
		
		int result = 0;
		String sId = (String)session.getAttribute("sId");
		
		System.out.println("변경된 수량 데이터 : " + productCount + ", " + productNumber + ", sId : " + sId);
		
		int proCount = service.updateProductCount(sId, productCount, productNumber);
//		CartAllPriceVO cartAllPrice = service.getCartAllPrice(sId);
		CartVO cartProductPrice = service.selectCartPrice(sId, productNumber);
		
		result = cartProductPrice.getProduct_price();
		
		return result;
	}
	
	//=============================================================================================================================================
	
	// 상품 하나 삭제 시 해당 상품 삭제
	@GetMapping("/DeleteCartProduct")
	public String deleteCart(
					@RequestParam(value = "proNum",defaultValue = "0", required = false) int proNum
					,@RequestParam(value = "proNums",defaultValue = "0", required = false) int[] proNums
					, HttpSession session
					, Model model) {
		String sId = (String)session.getAttribute("sId");
	//					System.out.println("삭제버튼 클릭 시 아이디 : " + sId);
		System.out.println("개별 삭제 시 넘어온 값 : " + proNum);
		System.out.println("선택 삭제 시 넘어온 값 : " + proNums);

		// 개별 삭제
		if(proNum > 0) {
			int deleteProduct = service.deleteCartProduct(proNum);
			if(deleteProduct > 0) {
				System.out.println(proNum + " : 삭제 완료");
			}
		}
		
		// 선택 상품 삭제 작업
		if(proNums[0] != 0) {
			for( int proNum1 : proNums) {
				int deleteProduct = service.selectDeleteCartProduct(proNum1);
				if(deleteProduct > 0) {
					System.out.println(proNum1 + " : 삭제 완료");
				}
			}
		}
		
		List<ProductVO> productList = service.getMainCartList(sId);
		model.addAttribute("productList", productList);
		 
		// 카트 상품 총액
		CartAllPriceVO cartAllPrice = service.getCartAllPrice(sId);
		model.addAttribute("cartAllPrice", cartAllPrice);
		System.out.println("결과값 뭐임? :" + cartAllPrice);
		
		
		return "store/cart";
	}
		
	//--------------------------------------------------------------------------------------------------------------------------------------------------
	
	// 장바구니 비우기
	@GetMapping("productAllDelete")
	public String allDelete(HttpSession session) {
		String sId = (String)session.getAttribute("sId");
		
		//장바구니 비우기
		int cartDel = service.productAllDelete(sId);
		
		return "store/store_main";
	}	
	
	
	//=============================================================================================================================================
	
	@GetMapping("PayPro")
	public String pay(
					@RequestParam(value = "proNums",defaultValue = "0", required = false) int[] proNums
					, @RequestParam(value = "deleteProNum",defaultValue = "0", required = false) int[] deleteProNum
					, @RequestParam(value = "proNumber",defaultValue = "0", required = false) int proNumber
					, @RequestParam(value = "proCount",defaultValue = "0", required = false) int proCount
					, @RequestParam(value = "proPrice",defaultValue = "0", required = false) int proPrice
					, HttpSession session 
					, MemberVO member
					, Model model) {
//		proNumber=61&proCount=1&proPrice=17500
		String sId = (String)session.getAttribute("sId");
		
		// 비회원 장바구니 이동 시 접근 불가
		if(sId == null ) {
			model.addAttribute("msg", "로그인 후 이용 부탁드립니다!");
			return "fail_back";
		}
				
		System.out.println("결제 회원 : " + sId  + ", 상품 정보 : " + proNumber + ", " + proCount + ", 가격정보 : " + proPrice);
				
		//ORDER_DETAIL 테이블 비우기
		int deleteOrderDetail = service.deleteOrderDetail(sId);
		if(deleteOrderDetail > 0) {
			System.out.println("PayPro에서 ORDER_DETAIL 삭제 완료");
		}
		
		// 선택 상품 ORDER_DETAIL에 저장
		
		if(proNums[0] != 0) {
			for( int proNum : proNums) {
				// 저장 작업
				int insertOrderDetail = service.insertOrderDetail(sId, proNum);
				if(insertOrderDetail > 0) {
					System.out.println("ORDER_DETAIL에 저장 성공");
				}
			}
		}
		
		// 전체 상품 ORDER_DETAIL에 저장
		if(proNumber == 0) {
			if(proNums[0] == 0) {
				int insertOrderDetail = service.insertOrderDetail(sId);
					if(insertOrderDetail > 0) {
						System.out.println("ORDER_DETAIL에 저장 성공");
					}
			}	
		}else if(proNumber > 0) {// 상품 상세 페이지에서 결제 페이지로 이동시 ORDER_DETAIL에 저장
			int insertProduct = service.insertProduct(sId, proNumber, proCount, proPrice);
		}
		
		// 결제 상품 삭제 
		if(deleteProNum[0] != 0) {
			for(int proNum:deleteProNum) {
				int deletePayProduct = service.deletePayProduct(proNum);
			}
			
		}
		
		// 메인 페이지에서 카트 등록 상품 목록 조회
		List<ProductVO> productPayList = service.selectPayProduct(sId);
		model.addAttribute("productPayList", productPayList);
		
		System.out.println("선택 결제 상품 조회 성공");
		
		// 페이 상품 총액
		System.out.println("나옴??");
		PayAllPriceVO payAllPrice = service.getPaytAllPrice(sId);
		System.out.println("나옴2??");
		model.addAttribute("payAllPrice", payAllPrice);
		System.out.println("결제 상품 갯수랑 총액 :" + payAllPrice);
		
		
		// 회원정보 조회
		member = service.getMember(sId);
		
        System.out.println("멤버 이메일 주소1 : " + member.getMember_e_mail());
        
        String Email = member.getMember_e_mail();
        String[] ArraysEmail = Email.split("@");
        	
        session.setAttribute("Email1", ArraysEmail[0]);
        session.setAttribute("Email2", ArraysEmail[1]);
        
        System.out.println("이메일 1 : " + ArraysEmail[0]);
        System.out.println("이메일 2 : " + ArraysEmail[1]);
        
        model.addAttribute("Member", member); 
		return "store/pay";
	}
	
	// 포인트 사용 체크 시 
	@PostMapping("UsePoint")
	@ResponseBody
	public int usePoint(
					@RequestParam(value = "memberPoint", defaultValue = "0", required = false) int memberPoint
					, HttpSession session
					, MemberVO member) {
		
		String sId = (String)session.getAttribute("sId");
		
		int result = 0;

		// 포인트 조회
		System.out.println("usePoint의 memberPoint : " + memberPoint);
		
		member = service.getMember(sId);
		
		// 페이 상품 총액
		PayAllPriceVO payAllPrice = service.getPaytAllPrice(sId);
		System.out.println("결제 상품 갯수랑 총액 :" + payAllPrice);
		
		int allPay = payAllPrice.getAllPrice() + 3000;
		System.out.println("포인트 사용 전 총액 : " + allPay);
		result = allPay - memberPoint;
		
		System.out.println("포인트 계산 후 금액 : " + result);
		System.out.println("상품 총 금액" + allPay);
		System.out.println("해당 회원의 포인트 : " +  member.getMember_point());
	
		return result;
	}
		
	@GetMapping("/ResultPay")
	public String resultPay(
						int[] deleteProNum
						, MemberVO member
						, HttpSession session
						, Model model) {
		String sId = (String)session.getAttribute("sId");
		
		for(int proNum:deleteProNum) {
			int deletePayProduct = service.deletePayProduct(proNum);
			if(deletePayProduct > 0) {
				System.out.println("deletePayProduct 삭제 성공");
			}
		}
		
		List<ProductVO> productPayList = service.selectPayProduct(sId);
		
		model.addAttribute("productPayList", productPayList);
		System.out.println("productPayList : " + productPayList);
		
		PayAllPriceVO payAllPrice = service.getPaytAllPrice(sId);
		model.addAttribute("payAllPrice", payAllPrice);
		
		// 회원정보 조회
		member = service.getMember(sId);
        String Email = member.getMember_e_mail();
        String[] ArraysEmail = Email.split("@");
        session.setAttribute("Email1", ArraysEmail[0]);
        session.setAttribute("Email2", ArraysEmail[1]);
        model.addAttribute("Member", member); 
        
        if(productPayList.isEmpty()) {
        	model.addAttribute("msg", "장바구니 창으로 이동합니다.");
			model.addAttribute("targetURL", "MainCart");
			return "forward";
		}
		
		return "store/pay";
	}
	
	@PostMapping("PaymentPro")
	public String paymentPro(
					@RequestParam Map<String, Object> map
					, MemberVO member
					, OrderDetailVO orderDetail
					, HttpSession session
					, Model model, 
					int[] order_detail_num) {
		
		String sId = (String)session.getAttribute("sId");
		
		// 메인 페이지에서 카트 등록 상품 목록 조회
		List<ProductVO> productPayList = service.selectPayProduct(sId);
		model.addAttribute("productPayList", productPayList);
		
		member = service.getMember(sId);
		model.addAttribute("Member", member); 
		 
		System.out.println("PaymentPro : " + sId);
		System.out.println("PaymentPro : " + productPayList);
		System.out.println("PaymentPro : " + member);
		System.out.println("PaymentPro : " + orderDetail);
		
		// 배송지 정보 저장
		map.put("sId", sId);
		System.out.println("사용할 포인트 : " + map.get("usePoint"));
		System.out.println("Order_detail_num : " + map.get("order_detail_num"));
		 
		session.setAttribute("receiver_name", map.get("receiver_name"));
		session.setAttribute("receiver_addr1", map.get("receiver_addr1"));
		session.setAttribute("receiver_addr2", map.get("receiver_addr2"));
		session.setAttribute("phone", map.get("phone"));
		session.setAttribute("eMail", map.get("eMail"));
		session.setAttribute("mailUrl", map.get("mailUrl"));
		session.setAttribute("usePoint", map.get("usePoint"));
		
		if(!map.get("receiver_request").equals("")) {
			session.setAttribute("receiver_request", map.get("receiver_request"));
		}else if(map.get("receiver_request").equals("")){
			String request = "-";
			session.setAttribute("receiver_request", request);
		}
		
		for(int i = 0; i < order_detail_num.length; i++) {
			System.out.println(map.put("order_detail_num", order_detail_num[i]));
		}
		
		// 포인트 사용 시 배송지에 정보 저장
		if(!map.get("usePoint").equals("")) {
//			for(int i = 0; i < order_detail_num.length; i++) {
//				map.put("order_detail_num", order_detail_num[i]);
//				int insertReceiverUsePoint = service.insertReceiverUsePoint(map); 
//			}
			
			String usePoint = (String)map.get("usePoint");
			int resultPoint = Integer.parseInt(usePoint);
			PayAllPriceVO payAllPrice = service.getPaytAllPrice(sId);
			model.addAttribute("payAllPrice", payAllPrice);
			System.out.println("PaymentPro 결제 상품 갯수랑 총액 :" + payAllPrice);
			
			int resultPrice = (payAllPrice.getAllPrice() + 3000) - resultPoint;
			System.out.println("최종 결제 금액 : " + resultPrice);
			model.addAttribute("resultPrice",resultPrice);
			session.setAttribute("resultPrice",resultPrice);
			
			session.setAttribute("usePoint", map.get("usePoint"));
		}
		
		// 포인트 미 사용 시 배송지에 정보 저장
		if(map.get("usePoint").equals("")){// 포인트 없을 때
			
//			for(int i = 0; i < order_detail_num.length; i++) {
//				map.put("order_detail_num", order_detail_num[i]);
//				int insertReceiverInfo = service.insertReceiverInfo(map);
//			}
			
			PayAllPriceVO payAllPrice = service.getPaytAllPrice(sId);
			model.addAttribute("payAllPrice", payAllPrice);
			System.out.println("PaymentPro 결제 상품 갯수랑 총액 :" + payAllPrice);
			
			int resultPrice = (payAllPrice.getAllPrice() + 3000);
			System.out.println("최종 결제 금액 : " + resultPrice);
			model.addAttribute("resultPrice",resultPrice);
			session.setAttribute("resultPrice",resultPrice);
			
			int resultPoint = 0;
			session.setAttribute("usePoint", resultPoint);
		}
		
		// 결제 상품 이름 조회
		
		ProductVO productNames = service.selectProductNames(sId);
		System.out.println("결제 상품 명 : " + productNames);
		System.out.println(productNames.getProduct_name());
		model.addAttribute("paymentProduct",productNames.getProduct_name());
		
		session.setAttribute("usePoint", map.get("usePoint"));
        session.setAttribute("paymentProduct", productNames.getProduct_name());
		
		return "store/payment";
	}
	
	@PostMapping("PaymentResult")
	@ResponseBody
	public String paymentResult(HttpSession session,@RequestParam Map<String, Object> map) {
		
		System.out.println("결제 성공");
		System.out.println("주문번호 : " + map.get("merchant_uid"));
			
		String sId = (String)session.getAttribute("sId");
		String receiver_name = (String)session.getAttribute("receiver_name");
		String receiver_addr1 = (String)session.getAttribute("receiver_addr1");
		String receiver_addr2 = (String)session.getAttribute("receiver_addr2");
		String phone = (String)session.getAttribute("phone");
		String eMail = (String)session.getAttribute("eMail");
		String mailUrl = (String)session.getAttribute("mailUrl");
		String receiver_request = (String)session.getAttribute("receiver_request");
//		System.out.println("출력 확인");
				
		String usePoint = (String)session.getAttribute("usePoint");
		if(usePoint.equals("")) {
			int resultPoint = 0;
			map.put("usePoint", resultPoint);
		}else if(!usePoint.equals("")) {
			int resultPoint = Integer.parseInt(usePoint);
			map.put("usePoint",resultPoint);
		}
		
		map.put("sId", sId);
		map.put("receiver_name",receiver_name );
		map.put("receiver_addr1", receiver_addr1);
		map.put("receiver_addr2", receiver_addr2);
		map.put("phone", phone);
		map.put("eMail", eMail);
		map.put("mailUrl", mailUrl);
		map.put("receiver_request", receiver_request);
		
		System.out.println("sId : " + sId);
		System.out.println("회원 ID : " + map.get("sId"));
		String paymentProduct = (String)session.getAttribute("paymentProduct");
		String[] arrPaymentProduct = paymentProduct.split("|");
		System.out.println("상품 이름 : " + paymentProduct);
			
		// 상품 정보 가져 오기
		List<ProductVO> productPayList = service.selectPayProduct(sId);
		System.out.println("상품 정보 : " + productPayList);
		
		for(ProductVO payProduct:productPayList) {
			System.out.println( "상품 이름 :  " + payProduct.getProduct_name());
			System.out.println( "상품 번호 : " + payProduct.getProduct_num());
			System.out.println( "상품 수량 : " + payProduct.getProduct_count());
			
			map.put("productName", payProduct.getProduct_name());
			map.put("productNum", payProduct.getProduct_num()); 
			map.put("productCount", payProduct.getProduct_count());
			map.put("ProductPrice", payProduct.getProduct_price());
			
			// USER_ORDER 데이터 저장
			int insertUserOrder = service.insertUserOrder(map);
			
			// 주문 상품 CART에서 삭제 
			int deletePaymentCart = service.deletePaymentCart(map);
					
		}
		
		// 포인트 사용 시 배송지에 정보 저장
		if(!map.get("usePoint").equals("")) {
			
			// 배송 정보 저장
			int insertReceiverUsePoint = service.insertReceiverUsePoint(map); 
			
			// MEMBER 테이블에서 포인트 차감
			int updateMemberPoint = service.updateMemberPoint(map);
			
			// 사용 포인트 POINT 테이블에 반영 
			int insertUsePoint = service.insertUsePoint(map);
			
		}
		
		// 포인트 미사용 시 배송지에 정보 저장
		if(map.get("usePoint").equals("")) {
			int insertReceiverUsePoint = service.insertReceiverUsePoint(map); 
			
		}
		
		// 적립금 포인트 POINT 테이블에 반영 
		UserOrderVO getResultPrice = service.getUserOrderPrice(map);
		int resultPrice = getResultPrice.getProduct_price(); 
		System.out.println("진짜 최종 결제 금액 : " + resultPrice);
		int addPoint = (int) ((resultPrice * 0.01) / 10);
		System.out.println("적립할 포인트 : " + addPoint);
		map.put("addPoint", addPoint);
		int updateAddPoint = service.updateAddPoint(map);
		
		// 적립금 포인트 MEMBER 테이블에 저장
		int updateMembeAddrPoint = service.updateMemberAddPoint(map);
		
		return "other/main";
	}
	
}
