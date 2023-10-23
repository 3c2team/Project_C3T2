package com.itwillbs.c3t2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c3t2.vo.AdminVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.ProductVO;
import com.itwillbs.c3t2.vo.ReservationVO;

@Mapper
public interface AdminMapper {

	List<MemberVO> selectMemberList();
	List<ReservationVO> selectReservationList();
	AdminVO selectAdmin(AdminVO admin);
	List<ProductVO> selectProduct();
	ProductVO selectProduct(int product_num);

}
