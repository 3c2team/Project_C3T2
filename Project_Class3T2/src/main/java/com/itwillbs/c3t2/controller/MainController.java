package com.itwillbs.c3t2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	// 硫붿씤�럹�씠吏� �젒�냽 而⑦듃濡ㅻ윭
	
		@GetMapping("main")
		public String main() {
			return "other/main";
		}
	
		@GetMapping("about")
		public String about() {
			return "other/about";
		}
		
		@GetMapping("menu")
		public String menu() {
			return "other/menu";
		}
		
		@GetMapping("newsEvent")
		public String newsEvent() {
			return "other/news";
		}
		
		@GetMapping("location")
		public String location() {
			return "other/location";
		}
		
		@GetMapping("reservation")
		public String reservation() {
			return "reservation/reservation";
		}
		
		@GetMapping("onlineStore")
		public String onlineStore() {
			return "store/store_main";
		}
		
		@GetMapping("login")
		public String login() {
			return "other/login";
		}
		
		@GetMapping("join")
		public String join() {
			return "other/join";
		}
		
		//storeMapping
		@GetMapping("store_best")
		public String best() {
			return "store/store_best";
		}
		
		@GetMapping("store_new")
		public String storeNew() {
			return "store/store_new";
		}
		
		@GetMapping("store_kit")
		public String mealKit() {
			return "store/store_kit";
		}
		
}
