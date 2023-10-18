package com.itwillbs.c3t2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.c3t2.mapper.MemberMapper;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.Member_AgreeVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;

	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	public int registAgreeMember(Member_AgreeVO memberAgree) {
		return mapper.insertAgreeMember(memberAgree);
	}

	public void registAuthInfo(String member_id, String authCode) {
		// 기존 인증정보가 존재하는지 여부 확인
		// MemberMapper - selectAuthInfo() 메서드 호출하여 기존 인증정보 조회
		// => 파라미터 : 아이디   리턴타입 : AuthInfoVO(authInfo)
		AuthInfoVO authInfo = mapper.selectAuthInfo(member_id);
//				System.out.println("인증 정보 : " + authInfo);
		
		// 기존 인증정보 존재 여부 판별
		if(authInfo == null) { // 기존 인증정보 존재하지 않을 경우(새 인증정보 추가)
			System.out.println("기존 인증정보 없음!");
			
			// MemberMapper - insertAuthInfo() 메서드 호출하여 새 인증정보 추가
			mapper.insertAuthInfo(member_id, authCode);
		} else { // 기존 인증정보 존재(기존 인증정보 갱신)
			System.out.println("기존 인증정보 있음!");
			
			// MemberMapper - updateAuthInfo() 메서드 호출하여 기존 인증정보 갱신
			mapper.updateAuthInfo(member_id, authCode);
		}
	}

	// 이메일 인증 요청
		public boolean emailAuth(AuthInfoVO authInfo) {
		boolean isAuthSuccess = false;
		
		// MemberMapper - selectAuthInfo() 메서드를 호출하여 아이디가 일치하는 인증정보 조회(재사용)
		AuthInfoVO currentAuthInfo = mapper.selectAuthInfo(authInfo.getId());
		System.out.println("전달받은 인증정보 : " + authInfo);
		System.out.println("조회된 기존 인증정보 : " + currentAuthInfo);
		
		// 조회된 인증정보 존재할 경우
		if(currentAuthInfo != null) {
			// 하이퍼링크 통해 전달받은 인증코드와 조회된 인증정보의 인증코드 문자열 비교
			if(authInfo.getAuth_code().equals(currentAuthInfo.getAuth_code())) { // 인증코드 일치
				// 1. Mapper - updateMailAuthStatus() 메서드를 호출하여
				//    member 테이블의 인증상태(mail_auth_status)를 "Y" 로 변경
				// => 파라미터 : 아이디
				mapper.updateMailAuthStatus(authInfo.getId());
				
				// 2. Mapper - deleteAuthInfo() 메서드를 호출하여
				//    auth_info 테이블의 인증정보 삭제
				// => 파라미터 : 아이디
				mapper.deleteAuthInfo(authInfo.getId());
				
				// 3. isAuthSuccess 를 true 로 변경
				isAuthSuccess = true;
			}
		}
		
		return isAuthSuccess;
	}
	

}
