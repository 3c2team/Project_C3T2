package com.itwillbs.c3t2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.c3t2.vo.AdminVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Mapper
public interface AdminMapper {

	// 회원조회
	List<MemberVO> selectMemberList();
	
	//예약조회
	List<ReservationVO> selectReservationList();
	
	//관리자조회
	AdminVO selectAdmin(AdminVO admin);
	
	//상품조회
	List<ProductVO> selectProduct();
	
	//상품상세정보 조회
	ProductVO selectProduct(int product_num);
	
	//상품 이미지 조회
	List<Map<String,Object>> selectProductImg(int product_num);
	
	//상품 등록
	int insertProduct(Map<String, Object> map);
	
	//상품 이미지 등록
	int insertProductImg(Map<String, Object> map);
	
	//상품삭제(아직하는중)
	int deleteProduct(int product_num);
	
	//상품이미지삭제
	int deleteProductImg(int product_num);
	
	//공지사항 조회
	List<Map<String, Object>> selectNotice();
	
	//공지사항 등록
	int insertNotice(Map<String, String> map);
	
	//공지사항 삭제
	int deleteNotice(int notice_num);
	
	//리뷰 조회
	List<Map<String, Object>> selectReviewList();
	//리뷰 삭제
	int deleteReview(int review_num);

	Map<String, String> selectReviewImg();

	List<Map<String, Object>> selectEventList();

	int insertEvent(Map<String, Object> map);

	Map<String, Object> selectEvent(int event_num);

	int deleteEvent(int event_num);

}
