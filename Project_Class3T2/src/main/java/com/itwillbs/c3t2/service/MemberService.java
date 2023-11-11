package com.itwillbs.c3t2.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itwillbs.c3t2.mapper.MemberMapper;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.NoticeVO;
import com.itwillbs.c3t2.vo.RestaurantVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	// bottom 데이터 불러오기
	public RestaurantVO getRestaurant() {
		return mapper.selectRestaurant();
	}
	
	// 메인 화면(최근 공지 팝업)
	public NoticeVO getNoticeRecent() {
		return mapper.selectNoticeRecent();
	}
	
	// 공지사항 리스트 출력
	public List<NoticeVO> getNoticeList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectNoticeList(searchType, searchKeyword, startRow, listLimit);
	}
	
	// 공지사항 리스트 갯수 출력
	public int getNoticeListCount(String searchType, String searchKeyword) {
		return mapper.selectNoticeListCount(searchType, searchKeyword);
	}
	
	// 공지사항 출력
	public NoticeVO getNotice(int notice_num) {
		NoticeVO notice = mapper.selectNotice(notice_num);
		
		if(notice != null) {
			mapper.updateReadcount(notice);
		}
		return notice; 
	}
	
	// 카카오 로그인(access token) 가져오기
	public String getKaKaoAccessToken(String code){
        String access_Token="";
        String refresh_Token ="";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try{
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=46389b0d2a4098beef5e03823cefb9a9");
            sb.append("&redirect_uri=http%3A%2F%2Flocalhost%3A8081%2Fc3t2%2Fkakao");
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            br.close();
            bw.close();
        }catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }
	
	// 카카오 로그인(유저 정보) 가져오기
	public HashMap<String, Object> createKakaoUser(String access_Token) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        String id = element.getAsJsonObject().get("id").getAsString();
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("id", id);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	
	// 카카오 아이디 유무 확인
	public MemberVO getMemberKakaoLogin(String kakao_id) {
		return mapper.selectMemberKakaoLogin(kakao_id);
	}
	
	// 멤버 아이디로 멤버 정보 불러오기
	public MemberVO getMemberLogin(String member_id) {
		return mapper.selectMemberLogin(member_id);
	}
	
	// 카카오 아이디 업데이트
	public int addKakaoId(String member_id, String kakao_id) {
		return mapper.updateKakaoId(member_id, kakao_id);
	}
	
	// 입력받은 이름에 맞는 멤버 아이디 가져오기
	public String getMember(String member_name) {
		return mapper.selectMember(member_name);
	}
	
	// 입력받은 전화번호에 맞는 멤버 아이디 가져오기
	public String getMemberId(String member_phone_num) {
		return mapper.selectMemberId(member_phone_num);
	}

	// 아이디에 맞는 이메일 가져오기
	public String getMemberEmail(String member_id) {
		return mapper.selectMemberEmail(member_id);
	}
	
	// 바뀐 비밀번호 업데이트
	public int updateMemberPasswd(String member_id, String securePasswd) {
		return mapper.updateMemberPasswd(member_id, securePasswd);
	}

	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}

	public void registAuthInfo(String member_id, String authCode) {
		AuthInfoVO authInfo = mapper.selectAuthInfo(member_id);
		
		if(authInfo == null) { // 기존 인증정보 존재하지 않을 경우(새 인증정보 추가)
			mapper.insertAuthInfo(member_id, authCode);
		} else { // 기존 인증정보 존재(기존 인증정보 갱신)
			mapper.updateAuthInfo(member_id, authCode);
		}
	}

		public boolean emailAuth(AuthInfoVO authInfo) {
		boolean isAuthSuccess = false;
		
		AuthInfoVO currentAuthInfo = mapper.selectAuthInfo(authInfo.getId());
		
		if(currentAuthInfo != null) {
			if(authInfo.getAuth_code().equals(currentAuthInfo.getAuth_code())) { // 인증코드 일치
				mapper.updateMailAuthStatus(authInfo.getId());
				mapper.deleteAuthInfo(authInfo.getId());
				isAuthSuccess = true;
			}
		}
		return isAuthSuccess;
	}

	public String getPasswd(MemberVO member) {
		return mapper.selectPasswd(member);
	}

	public int checkId(String member_id) {
		return mapper.selectCheckId(member_id);
	}

	// 상품 구매 내역
	public List<UserOrderVO> getOrderList() {
		return mapper.getOrderList();
	}
	
	//회원 상세내역
	public MemberVO getMemberDetails(String member_id) {
		return mapper.selectMemberDetails(member_id);
	}

	// 회원 상세정보 조회 요청
	public MemberVO getMemberDup(String id) {
		return mapper.selectMemberDup(id);
	}

	public MemberVO getMemberDupPhone(String phone_num) {
		return mapper.selectMemberDupPhone(phone_num);
	}

	public int registPoint(String member_id) {
		return mapper.insertJoinPoint(member_id);
	}
}