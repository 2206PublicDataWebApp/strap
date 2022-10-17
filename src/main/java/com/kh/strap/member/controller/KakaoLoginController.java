package com.kh.strap.member.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KakaoLoginController {

	/**
	 * 
	 * @param code 인증 성공시토큰 받기 요청에 필요한 인가 코드
	 * @param error 인증 실패시 반환되는 에러코드 
	 * @param error_descirption 인증 실패시 반환되는 에러 메시지
	 * @return
	 */
	@RequestMapping("/member/socialEnroll.strap")
	public ModelAndView getKakaoOauthCode(
			@RequestParam(value="code", required = false) String code
			,@RequestParam(value="error", required = false) String error
			,@RequestParam(value="error_descirption", required = false) String error_descirption
			,ModelAndView mv) {
		System.out.println("code : " + code);
		System.out.println("error : " + error);
		System.out.println("error_description : " + error_descirption);
		
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
            System.out.println("flush 완료");
            
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
            System.out.println("result = " + result);

            // json parsing : String 형식의 JSON을 JSONObject형으로 추출
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject)jsonParser.parse(result);

            String access_token = jsonObj.get("access_token").toString();
            String refresh_token = jsonObj.get("refresh_token").toString();
            System.out.println("refresh_token = " + refresh_token);
            System.out.println("access_token = " + access_token);

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
	
		mv.addObject("code", code);
		mv.addObject("token",token);
		mv.setViewName("/member/socialEnroll");
		return mv;
	}
	
//	@RequestMapping("/member/getKakaoToken")
//	public String getKakaoToken(
//			@RequestParam("code") String code) {
//		String token = "";
//		//요청을 보낼 domain
//		String host = "https://kauth.kakao.com/oauth/token";
//		try {
//			//URL 객체 생성
//			URL url = new URL(host);
//			//HttpURLConnection 객체 생성
//			//url.openConnection는 URLConnection을 리턴하고 HttpURLConnection형태로 캐스팅하여 사용한다.
//			//HttpsURLConnection 클래스는 URLConnection을 구현한 것
//			HttpsURLConnection urlConnection = (HttpsURLConnection)url.openConnection();
//			urlConnection.setRequestMethod("POST");//요청 방식
//			urlConnection.setDoOutput(true);
//			System.out.println(urlConnection.getResponseCode());//200
//			System.out.println(urlConnection.getResponseMessage());//ok
//			
//			//HTTP 통신 Request
//			OutputStreamWriter osw = new OutputStreamWriter(urlConnection.getOutputStream());//OutputStreamWriter 바이트출력스트림(OuputStream)을 문자출력스트림으로 변환시키는 보조스트림
//			BufferedWriter bw = new BufferedWriter(osw);//입출력 향상을 위한 BuffereWrieter
//			StringBuffer sb = new StringBuffer();
//			sb.append("grant_type=authorization_code");
//            sb.append("&client_id=21529b6c9fe8f1a51afa1b59f685c562");
//            sb.append("&redirect_uri=http://localhost:9999/member/socialEnroll.strap");
//            sb.append("&code=" + code);
//            bw.write(sb.toString());
//            bw.flush();
//            
//            //HTTP 통신 Response
//            InputStreamReader isr = new InputStreamReader(urlConnection.getInputStream());
//            BufferedReader br = new BufferedReader(isr);
//            String line = "";
//            String result = "";
//            while ((line = br.readLine()) != null) {
//                result += line;
//            }
//            System.out.println("result = " + result);
//
//            // json parsing : String 형식의 JSON을 JSONObject형으로 추출
//            JSONParser jsonParser = new JSONParser();
//            JSONObject jsonObj = (JSONObject)jsonParser.parse(result);
//
//            String access_token = jsonObj.get("access_token").toString();
//            String refresh_token = jsonObj.get("refresh_token").toString();
//            System.out.println("refresh_token = " + refresh_token);
//            System.out.println("access_token = " + access_token);
//
//            token = access_token;
//            
//            br.close();
//            bw.close();
//		} catch (MalformedURLException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		return token;
//	}
	
}
