package com.itwillbs.c3t2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	// 메인페이지 접속 컨트롤러
	
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
}
