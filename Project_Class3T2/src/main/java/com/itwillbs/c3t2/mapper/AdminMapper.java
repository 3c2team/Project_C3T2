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
	List<Map<String, Object>> selectReservationList();
	
	//관리자조회
	AdminVO selectAdmin(AdminVO admin);
	
	//상품조회
	List<Map<String,Object>> selectProductList();
	
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
	
	//리뷰 조회(복수)
	List<Map<String, Object>> selectReviewList();
	
	//리뷰 삭제
	int deleteReview(int review_num);

	
//	List<Map<String, Object>> selectEventList();

//	int insertEvent(Map<String, Object> map);

//	Map<String, Object> selectEvent(int event_num);

//	int deleteEvent(int event_num);

	// 문의사항 조회(복수)
	List<Map<String, Object>> selectQnaBoardList();

	// 문의사항 조회(단수)
	Map<String, Object> selectQnaBoard(int qna_num);
	
	// 문의사항 답변(관리자)
	int updateQnaBoard(Map<String, Object> map);

	// 리뷰 조회(단수)
	Map<String, Object> selectReview(int review_num);

	// 회원탈퇴 사유 조회
	Map<String, Integer> selectMemberOut();

	// 회원탈퇴 날짜 조회
	List<Map<String, Integer>> selectOutDate();
	
	// 레스토랑 테이블 조회
	Map<String, Object> selectRestaurant(String sId);

	// 레스토랑 테이블 수정
	int updateRestaurant(Map<String, Object> map);
	
	// 레스토랑 테이블 등록
	int insertRestaurant(Map<String, Object> map);

	// 관리자 등록
	int insertAdmin(Map<String, Object> map);

	List<Map<String, Integer>> selectYearDate();

	List<Map<String, Integer>> selectMonthDate(int year);

	List<Map<String, Integer>> selectHourDate(int day);

	List<Map<String, Integer>> selectProductSales();

	int updateReservation(int checkbox);

	int deleteFavorite(int product_num);

}
