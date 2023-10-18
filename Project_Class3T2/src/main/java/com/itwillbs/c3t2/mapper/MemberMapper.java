package com.itwillbs.c3t2.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.c3t2.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);


}
