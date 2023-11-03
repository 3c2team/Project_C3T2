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
	public List<Map<String, Object>> getReservationList() {

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
	public List<Map<String, Object>> selectNoticeList() {
		return mapper.selectNotice();
	}
	public int insertNotice(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.insertNotice(map);
	}
	public int deleteNotice(int notice_num) {
		return mapper.deleteNotice(notice_num);
	}
	public List<Map<String, Object>> selectReviewList() {
		// TODO Auto-generated method stub
		return mapper.selectReviewList();
	}
	public int deleteReview(int review_num) {
		// TODO Auto-generated method stub
		return mapper.deleteReview(review_num);
	}
	public List<Map<String, Object>> selectEventList() {
		// TODO Auto-generated method stub
		return mapper.selectEventList();
	}
	public int insertEvent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.insertEvent(map);
	}
	public Map<String, Object> selectEvent(int event_num) {
		// TODO Auto-generated method stub
		return mapper.selectEvent(event_num);
	}
	public int deleteEvent(int event_num) {
		// TODO Auto-generated method stub
		return mapper.deleteEvent(event_num);
	}
	public List<Map<String, Object>> selectQnaBoardList() {
		// TODO Auto-generated method stub
		return mapper.selectQnaBoardList();
	}
	public Map<String, Object> selectQnaBoard(int qna_num) {
		// TODO Auto-generated method stub
		return mapper.selectQnaBoard(qna_num);
	}
	public int updateQnaBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.updateQnaBoard(map);
	}
	public Map<String, Object> selectReview(int review_num) {
		// TODO Auto-generated method stub
		return mapper.selectReview(review_num);
	}
	public Map<String, Integer> selectMemberOut() {
		// TODO Auto-generated method stub
		return mapper.selectMemberOut();
	}
	public List<Map<String, Integer>> selectOutDate() {
		// TODO Auto-generated method stub
		return mapper.selectOutDate();
	}
	

}
