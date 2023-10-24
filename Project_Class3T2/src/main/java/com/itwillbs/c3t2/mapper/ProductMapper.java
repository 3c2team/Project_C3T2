package com.itwillbs.c3t2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.c3t2.vo.CartVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductImgVO;
import com.itwillbs.c3t2.vo.ProductVO;

@Mapper
public interface ProductMapper {
	public List<ProductVO> selectProductBestList();
	
	List<ProductVO> selectProductHotList();

	public List<ProductVO> selectProductNewList();
	
//	public List<ProductVO> selectCategoryList(String category); // 오류 수정중
	
	public ProductVO selectProductDetail(int proNum);

	public List<ProductImgVO> selectProductImg(int proNum);

//	// CART 상품 조회
//	public List<ProductVO> selectProductCartList(int proNum);
//
//	// 같은 상품이 CART에 있는지 조회	
//	public CartVO selectCartMember(int proNum);
//
//	// CART에 선택 상품 담기
//	public int insertCart(@Param("sId") String sId, @Param("proNum") int proNum, @Param("proCount") int proCount);
//
//	// 선택상품 삭제
//	public int deleteCartProduct(int proNum);
//
//	// 메인 페이지에서 CART 상품 조회
////	public List<ProductVO> selectMainCartList(String sId);
//
//	// 카트 페이지에 온 회원 아이디 검색
//	public List<MemberVO> selectPayMember(String sId);
//
//	// 메인 페이지에서 CART 상품 조회
//	public List<ProductVO> selectProductCartList(String sId);
	
	// CART 상품 조회
	public List<ProductVO> selectProductCartList(@Param("proNum") int proNum,@Param("sId") String sId);

	// 메인 페이지에서 CART 상품 조회
	public List<ProductVO> selectProductCartList(String sId);

	public List<MemberVO> selectPayMember(String sId);

	public CartVO selectCartMember(int proNum);

	// CART에 상품 담기
	public int insertCart(@Param("sId") String sId, @Param("proNum") int proNum,@Param("proCount") int proCount);

//	public List<ProductVO> selectMainCartList(String sId);

	public int deleteCartProduct(int proNum);

	public List<ProductVO> insertCart(String sId);
}