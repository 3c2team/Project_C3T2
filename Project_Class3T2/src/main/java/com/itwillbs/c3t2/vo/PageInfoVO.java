package com.itwillbs.c3t2.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor // 모든 전달인자를 받는 생성자 자동 정의
public class PageInfoVO {
	private int listCount; // 전체 게시물 목록 갯수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 갯수
	private int maxPage; // 전체 페이지 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private int pageNum;
}