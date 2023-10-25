package com.itwillbs.c3t2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

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
	public ProductVO getproductList(int product_num) {
		// TODO Auto-generated method stub
		return  mapper.selectProduct(product_num);
	}
	public List<Map<String,Object>> getproductImg(int product_num) {
		// TODO Auto-generated method stub
		return mapper.selectProductImg(product_num);
	}
	public int registProduct(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertProduct(map);
	}
	public int registProductImg(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertProductImg(map);
	}
	public int deleteProduct(int product_num) {
		return mapper.deleteProduct(product_num);
	}
	public int deleteProductImg(int product_num) {
		// TODO Auto-generated method stub
		return mapper.deleteProductImg(product_num);
	}
	

}
