package com.kh.strap.member.service.logic;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.kh.strap.member.service.KakaoLoginService;

@Service
public class KakaoLoginServiceImpl implements KakaoLoginService {
	
	
	@Override
	public String getToken(String code) {
		String token = "";
		//요청을 보낼 domain
		String host = "https://kauth.kakao.com/oauth/token";
		try {
			//URL 객체 생성
			URL url = new URL(host);
			//HttpURLConnection 객체 생성
			//url.openConnection는 URLConnection을 리턴하고 HttpURLConnection형태로 캐스팅하여 사용한다.
			//HttpsURLConnection 클래스는 URLConnection을 구현한 것
			HttpsURLConnection urlConnection = (HttpsURLConnection)url.openConnection();
			urlConnection.setRequestMethod("POST");//요청 방식
			urlConnection.setDoOutput(true);
			
			//HTTP 통신 Request (인가코드 보내기)
			OutputStreamWriter osw = new OutputStreamWriter(urlConnection.getOutputStream());//OutputStreamWriter 바이트출력스트림(OuputStream)을 문자출력스트림으로 변환시키는 보조스트림
			BufferedWriter bw = new BufferedWriter(osw);//입출력 향상을 위한 BuffereWrieter
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
            sb.append("&client_id=21529b6c9fe8f1a51afa1b59f685c562");
            sb.append("&redirect_uri=http://localhost:9999/member/socialEnroll.strap");
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();
            
            //HTTP 통신 Response (토큰 받기)
            InputStreamReader isr = new InputStreamReader(urlConnection.getInputStream());
            BufferedReader br = new BufferedReader(isr);
            System.out.println("getResponseCode : "+urlConnection.getResponseCode());//200
            System.out.println("getResponseMessage : "+urlConnection.getResponseMessage());//ok
            String line = "";
            String result = "";
            while ((line = br.readLine()) != null) {
                result += line;
            }

            // json parsing : String 형식의 JSON을 JSONObject형으로 추출
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject)jsonParser.parse(result);

            String access_token = jsonObj.get("access_token").toString();
            String refresh_token = jsonObj.get("refresh_token").toString();

            token = access_token;
            
            br.close();
            bw.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return token;
	}

	@Override
	public Map<String, Object> getUserInfo(String access_token) {
		Map<String, Object> userInfo = null;
		String host = "https://kapi.kakao.com/v2/user/me";
		try {
			//객체 생성
			URL url = new URL(host);
			//URL 연결
			HttpsURLConnection urlConnection = (HttpsURLConnection)url.openConnection();
			//메소드 방식, 헤더 설정
			urlConnection.setRequestMethod("GET");
			urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
			//responseCode = 200 성공, 401 실패
			System.out.println("responseCode = " + urlConnection.getResponseCode());
			
			InputStreamReader isr = new InputStreamReader(urlConnection.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			String line="";
			String result="";
			while((line=br.readLine()) != null) {
				result += line;
			}
			System.out.println("userInfo : " + result);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
			JSONObject properties = (JSONObject)jsonObj.get("properties");
			JSONObject kakao_account = (JSONObject)jsonObj.get("kakao_account");
			
			String memberId = String.valueOf(jsonObj.get("id"));
			String memberEmail = (String)kakao_account.get("email");
			String memberGender =(String)kakao_account.get("gender");
			String memberNick =(String)properties.get("nickname");
			String mProfilePath = (String)properties.get("profile_image");
			
			userInfo = new HashMap<String, Object>();
			userInfo.put("memberId", memberId);
			userInfo.put("memberEmail", memberEmail);
			userInfo.put("memberGender", memberGender);
			userInfo.put("memberNick", memberNick);
			userInfo.put("mProfilePath", mProfilePath);
			
			br.close();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
 		return userInfo;
	}

	@Override
	public void logout(String token) {
		 String host = "https://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(host);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String result = "";
	            String line = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println(result);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	}
}

