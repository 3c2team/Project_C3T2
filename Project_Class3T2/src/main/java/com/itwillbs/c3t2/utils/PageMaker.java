package com.itwillbs.c3t2.utils;


import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.ToString;

// 페이징 처리를 위한 PageMaker 클래스(페이지네이션)
// 페이지네이션 로직을 한 곳에 모아 다양한 페이지나 프로젝트에서 동일한 클래스를 재사용할 수 있음. 
// 이로 인해 코드 중복이 줄어들고 유지 보수가 용이
@Data
@ToString
public class PageMaker {
   //mysql 들어갈 값은 page 가 아니라 pageStart, perPageNum 이다.
   //limit #{pageStart}, #{perPageNum}
   private int page;
   private int perPageNum;
   private int pageStart;
    
   //하단 페이징  << 1 2 3 4 5 6 7 8 9 10 >>
   private int totalCount; //전체 개수
   private int startPage;  // 시작 페이지
   private int endPage;    // 끝페이지
   private boolean prev;   // 이전 여부 
   private boolean next;   // 다음 여부
    
   private int displayPageNum=10;
    
   private int tempEndPage; //마지막 페이지
    
   //검색처리 추가
   private String searchType;
   private String keyword;
    
    
   public PageMaker() {
       this.page=1;          //현재 페이지 번호를 설정, 초기 페이지는 1 
       this.perPageNum=10;   //한 페이지에 표시될 데이터의 개수, limit 10 개씩 보여준다.
   }
    
    
   public void setPage(int page) {
       //페이지 번호가 0이거나 0보다 작으면 1페이지로 한다.
       if(page <=0){
           this.page=1;			// 페이지 번호를 1페이지로 설정
           return;
       }
       // 그 외의 경우, 입력된 페이지 번호를 그대로 설정합니다.
       this.page = page;
   }
        
   // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{perPageNum}
   public void setPerPageNum(int perPageNum) {
       //몇개 씩 보여줄것인가 이다. 최대 100개씩 보여 줄것으로 설정한다.
       //만약 0보다 작거나 100 보다 크면 10으로 초기화 시킨다.
       if(perPageNum <=0 || perPageNum >100){
           this.perPageNum=10;
           return;
       }
       this.perPageNum = perPageNum;
   }


   // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{pageStart}
   public int getPageStart() {
       //실질적으로 Mybatis 에서  파라미터로 인식해서  가져오는 것은 get 이다.
       // 따라서 getPageStart 에서 값을 설정한다.
       //시작 데이터 번호 = (페이지 번호 -1 ) * 페이지당 보여지는 개수
       this.pageStart=(this.page -1)*perPageNum;
       return this.pageStart;
   }

    
   //전체 페이지 설정과 동시에 하단에 뿌려질 페이지 계산하기 
   public void setTotalCount(int totalCount) {
       this.totalCount = totalCount;
       calcData();
   }
    
   // 페이지네이션을 위한 데이터를 계산하는 메서드 
   private void calcData(){
       // 현재 페이지 번호 / 하단 페이지번호 수
	   // Math.ceil(page / (double)displayPageNum)는 현재 페이지 번호를 페이지 그룹의 크기로 나누어 올림처리하여 
	   // 현재 페이지 그룹을 구하고, 이를 다시 페이지 그룹의 크기로 곱하여 현재 페이지 그룹의 마지막 페이지 번호를 구함
       endPage=(int)(Math.ceil(page / (double)displayPageNum)*displayPageNum);
        
       // startPage: 현재 페이지 그룹의 첫 페이지 번호를 계산
       startPage=(endPage - displayPageNum) +1;
       
       // tempEndPage: 전체 페이지 중 마지막 페이지 번호를 계산
       // 전체 데이터 수(totalCount)를 페이지당 데이터 수(perPageNum)로 나누어 올림처리하여 전체 페이지 수를 구함
       tempEndPage=(int)(Math.ceil(totalCount/(double)perPageNum));
       
       // 현재 페이지 그룹의 마지막 페이지 번호가 전체 페이지 수보다 크면, 마지막 페이지 번호를 전체 페이지 수로 설정
       if(endPage >tempEndPage){
           endPage=tempEndPage;
       }
       
       // prev: 이전 페이지 그룹으로 이동 가능한지 여부를 설정
       // 현재 페이지 그룹의 첫 페이지 번호가 1이면 이전 페이지 그룹으로 이동할 수 없음
       prev =startPage ==1 ? false :true;
       
       // next: 다음 페이지 그룹으로 이동 가능한지 여부를 설정
       // 현재 페이지 그룹의 마지막 페이지 번호와 페이지당 데이터 수의 곱이 전체 데이터 수보다 크거나 같으면 다음 페이지 그룹으로 이동할 수 없음
       next =endPage *perPageNum >=totalCount ? false :true;
   }
    
    
   // 주어진 페이지 번호와 검색 관련 파라미터들을 사용하여 URI 쿼리 문자열을 생성 
   // 페이지 파라미터 
   public String makeSearch(int page){
	   
	   // UriComponentsBuilder를 사용하여 URI 쿼리 문자열을 동적으로 구성.
       UriComponents uriComponents=
               UriComponentsBuilder.newInstance()
               .queryParam("page", page)				// 현재 페이지 번호를 'page' 파라미터로 추가
               .queryParam("perPageNum", perPageNum)	// 페이지당 데이터 수를 'perPageNum' 파라미터로 추가
               .queryParam("searchType", searchType)	// 검색 유형을 'searchType' 파라미터로 추가
               .queryParam("keyword", keyword)			// 검색 키워드를 'keyword' 파라미터로 추가
               .build();								// URI 쿼리 문자열을 구성
       
       // 구성된 URI 쿼리 문자열을 문자열 형태로 반환
       return uriComponents.toUriString();
   }
    
    
   // 주어진 URL과 페이징 관련 파라미터들을 사용하여 HTML 페이징 컨트롤을 생성 
   public String paginationHTML(String url){
	   
	  // StringBuffer를 사용하여 동적으로 HTML 문자열을 구성
      StringBuffer sBuffer=new StringBuffer();
      
      // 페이징 컨트롤의 시작 태그
      sBuffer.append("<ul class='pagination'>");
      
      // '처음' 버튼: 이전 페이지 그룹이 있을 경우 첫 페이지로 이동하는 버튼을 추가
      if(prev){
          sBuffer.append("<li><a href='"+url+makeSearch(1)+"'>처음</a></li>");
      }
       
      // '«' 버튼: 이전 페이지 그룹이 있을 경우 이전 페이지 그룹의 마지막 페이지로 이동하는 버튼을 추가
      if(prev){
          sBuffer.append("<li><a href='"+url+makeSearch(startPage-1)+"'>&laquo;</a></li>");
      }
       // 각 페이지 번호 버튼: 현재 페이지 그룹의 페이지 번호들을 추가
       String active="";
       for(int i=startPage; i <=endPage; i++){
           if(page==i){
                active="class=active";
           }else{
               active="";
           }
           sBuffer.append("<li " +active+" >");
           sBuffer.append("<a href='"+url+makeSearch(i)+"'>"+i+"</a></li>");
           sBuffer.append("</li>");
       }
       
       // '»' 버튼: 다음 페이지 그룹이 있을 경우 다음 페이지 그룹의 첫 페이지로 이동하는 버튼을 추가
       if(next && endPage>0){
           sBuffer.append("<li><a href='"+url+makeSearch(endPage+1)+"'>&raquo;</a></li>");         
       }
       
       // '마지막' 버튼: 다음 페이지 그룹이 있을 경우 마지막 페이지로 이동하는 버튼을 추가
       if(next && endPage>0){
           sBuffer.append("<li><a href='"+url+makeSearch(tempEndPage)+"'>마지막</a></li>");           
       }       
       // 페이징 컨트롤의 종료 태그
       sBuffer.append("</ul>");  
       
       // 구성된 HTML 문자열을 반환
       return sBuffer.toString();
   }
    
    

    
}