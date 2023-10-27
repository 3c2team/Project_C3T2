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
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.itwillbs.c3t2.mapper.MemberMapper;
import com.itwillbs.c3t2.vo.AuthInfoVO;
import com.itwillbs.c3t2.vo.MemberVO;
import com.itwillbs.c3t2.vo.NoticeVO;
import com.itwillbs.c3t2.vo.UserOrderVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;

	public int registMember(MemberVO member) {
		return mapper.insertMember(member);
	}
	
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
            sb.append("&client_id=46389b0d2a4098beef5e03823cefb9a9"); // TODO REST_API_KEY 입력
            sb.append("&redirect_uri=http%3A%2F%2Flocalhost%3A8081%2Fc3t2%2Fkakao"); // TODO 인가코드 받은 redirect_uri 입력
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
//            System.out.println("responseCode : " + responseCode);
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            
//            System.out.println("response body : " + result);

            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

//            System.out.println("access_token : " + access_Token);
//            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        }catch (IOException e) {
            e.printStackTrace();
        }

        return access_Token;
    }
	
	public HashMap<String, Object> createKakaoUser(String access_Token) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
//	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
//	        System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        String id = element.getAsJsonObject().get("id").getAsString();
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        
	        userInfo.put("nickname", nickname);
	        userInfo.put("id", id);
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	
	public MemberVO getMemberKakaoLogin(String kakao_id) {
		System.out.println("@@@@@@@@@@@@" + mapper.selectMemberKakaoLogin(kakao_id));
		return mapper.selectMemberKakaoLogin(kakao_id);
	}

	public void registAuthInfo(String member_id, String authCode) {
		AuthInfoVO authInfo = mapper.selectAuthInfo(member_id);
//				System.out.println("인증 정보 : " + authInfo);
		
		if(authInfo == null) { // 기존 인증정보 존재하지 않을 경우(새 인증정보 추가)
			System.out.println("기존 인증정보 없음!");
			
			mapper.insertAuthInfo(member_id, authCode);
		} else { // 기존 인증정보 존재(기존 인증정보 갱신)
			System.out.println("기존 인증정보 있음!");
			
			mapper.updateAuthInfo(member_id, authCode);
		}
	}

		public boolean emailAuth(AuthInfoVO authInfo) {
		boolean isAuthSuccess = false;
		
		AuthInfoVO currentAuthInfo = mapper.selectAuthInfo(authInfo.getId());
		System.out.println("전달받은 인증정보 : " + authInfo);
		System.out.println("조회된 기존 인증정보 : " + currentAuthInfo);
		
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

//	public MemberVO getMember(MemberVO member) {
//		return mapper.selectMember(member);
//	}


	public String getMemberId(String member_phone_num) {
		return mapper.selectMemberId(member_phone_num);
	}

	public int updateMemberPasswd(String member_id, String securePasswd) {
		return mapper.updateMemberPasswd(member_id, securePasswd);
	}


	public String getMemberEmail(String member_id) {
		return mapper.selectMemberEmail(member_id);
	}

	public MemberVO getMemberLogin(String member_id) {
		return mapper.selectMemberLogin(member_id);
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

	public List<NoticeVO> getNewsList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectNoticeList(searchType, searchKeyword, startRow, listLimit);
	}

	public int getNoticeListCount(String searchType, String searchKeyword) {
		return mapper.selectNoticeListCount(searchType, searchKeyword);
	}

	public NoticeVO getNotice(int notice_num) {
		NoticeVO notice = mapper.selectNotice(notice_num);
		
		if(notice != null) {
			mapper.updateReadcount(notice);
		}
		return notice; 
	}

	public int addKakaoId(String member_id, String kakao_id) {
		return mapper.updateKakaoId(member_id, kakao_id);
	}
}
