package com.itwillbs.c3t2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.c3t2.service.MemberService;
import com.itwillbs.c3t2.vo.MemberVO;

@Controller
public class MainController {
		
		@Autowired
		private MemberService service;
	// 硫붿씤�럹�씠吏� �젒�냽 而⑦듃濡ㅻ윭
	
		@GetMapping("Main")
		public String main() {
			return "other/main";
		}
	
		@GetMapping("About")
		public String about() {
			return "other/about";
		}
		
		@GetMapping("Menu")
		public String menu() {
			return "other/menu";
		}
		
		@GetMapping("NewsEvent")
		public String newsEvent() {
			return "other/news";
		}
		
		@GetMapping("Location")
		public String location() {
			return "other/location";
		}
		
		// 예약 클릭 시 예약 폼으로 이동
		@GetMapping("ReservationForm")
		public String reservationForm() {
			return "reservation/reservation_form";
		}
		
		@GetMapping("OnlineStore")
		public String onlineStore() {
			return "store/store_main";
		}
		
		@GetMapping("Login")
		public String login() {
			return "other/login";
		}
		
		@GetMapping("Join")
		public String join() {
			return "other/join";
		}
		
		@PostMapping("JoinPro")
		public String joinPro(MemberVO member, Model model) {
			System.out.println(member);
			int insertCount = service.registMember(member);
			
			if(insertCount > 0) { // 성공
				return "redirect:/JoinSuccess";
			} else { // 실패
				model.addAttribute("msg", "회원 가입 실패!");
				return "fail_back";
			}
		}
		
		@GetMapping("/JoinSuccess")
		public String joinSuccess() {
			return "other/join_pro";
		}
		
		//=============================
		//storeMapping
		@GetMapping("StoreBest")
		public String best() {
			return "store/store_best";
		}
		
		@GetMapping("StoreNew")
		public String storeNew() {
			return "store/store_new";
		}
		
		@GetMapping("StoreKit")
		public String mealKit() {
			return "store/store_kit";
		}
		
		@GetMapping("ProductDetail")
		public String productDetail() {
			return "store/product_detail";
		}
		
}
