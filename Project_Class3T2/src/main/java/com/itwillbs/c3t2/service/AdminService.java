package com.itwillbs.c3t2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.AdminMapper;
import com.itwillbs.c3t2.mapper.MemberMapper;
import com.itwillbs.c3t2.vo.AdminVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;

	public List<MemberVO> selectMemberList() {
		System.out.println("selectMemberList : 들어옴");
		return mapper.selectMemberList();
	}
	public List<ReservationVO> getReservationList() {

		return mapper.selectReservationList();
	}
	public AdminVO getAdmin(AdminVO admin) {
		return mapper.selectAdmin(admin);
	}
	public List<ProductVO> getproductList() {

		return mapper.selectProduct();
	}
	public ProductVO getProduct(int product_num) {
		// TODO Auto-generated method stub
		return mapper.selectProduct(product_num);
	}
	

}
