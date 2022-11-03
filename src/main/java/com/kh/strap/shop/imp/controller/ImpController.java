package com.kh.strap.shop.imp.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.strap.shop.imp.service.ImpService;

@Controller
public class ImpController {
	@Autowired
	ImpService iService;
	
	
	//아임포트 환불
	@RequestMapping(value="/imp/payment/cancel",method=RequestMethod.POST)
	public String ImpPaymentCancel(
			@RequestParam("merchant_uid")String merchant_uid) {
		OutputStreamWriter osw;
		BufferedWriter bw;
		InputStreamReader isr;
		BufferedReader br;
		StringBuffer sb;
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObjectParam = new JSONObject();
		JSONObject jsonObjectResult;
		String access_token = getImpToken();
		//연결할 url
		String hostUrl = "https://api.iamport.kr/payments/cancel";
		try {
			URL url = new URL(hostUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Authorization ",access_token);
			
			jsonObjectParam.put("merchant_uid", merchant_uid);
			
			System.out.println(merchant_uid);
			System.out.println(jsonObjectParam.toString());
			
			osw = new OutputStreamWriter(con.getOutputStream());
			bw = new BufferedWriter(osw);
			bw.write(jsonObjectParam.toString());
			bw.flush();
			
			if(con.getResponseCode() == 200) {
				isr = new InputStreamReader(con.getInputStream());
				br = new BufferedReader(isr);
				String line = "";
				sb = new StringBuffer();
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				jsonObjectResult = (JSONObject)jsonParser.parse(sb.toString());
				
				System.out.println(jsonObjectResult.toString());
				
			}else {
				System.out.println(con.getResponseCode());
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	//아임포트 토큰발급
	public String getImpToken() {
		OutputStreamWriter osw;
		BufferedWriter bw;
		InputStreamReader isr;
		BufferedReader br;
		StringBuffer sb = new StringBuffer();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObjectParam = new JSONObject();
		JSONObject jsonObjectResult;
		//연결할 url
		String hostUrl = "https://api.iamport.kr/users/getToken";
		try {
			//1.url객체를 생성하고 연결객체를 얻고 설정한다.
			URL url = new URL(hostUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json");
			
			//2.요청 시 전달할 값을 json객체에 put 하여 셋팅한다.
			jsonObjectParam.put("imp_key", "1546448204854828");
			jsonObjectParam.put("imp_secret","pG4rfkzau979iJO8vLgE5yQJWw0vpccxFQ1GSIW9e4RVzLga5Rj7LMtsyYMysF51MLNandPjuiY9N5Yo");
			
			//3.문자출력스트림으로 요청하기
			osw = new OutputStreamWriter(con.getOutputStream());
			bw = new BufferedWriter(osw);
			bw.write(jsonObjectParam.toString());
			bw.flush();
			
			//4.문자입력스트림으로 응답받기
			isr = new InputStreamReader(con.getInputStream());
			br = new BufferedReader(isr);
			String line = "";
			String result = "";
			if(con.getResponseCode() == 200) {
				while((line = br.readLine()) != null) {
					result += line;
				}
				//5.응답받은 문자열을 json객체로 만들고 필요한 값을 뽑기
				jsonObjectResult = (JSONObject)jsonParser.parse(result);
				JSONObject responseJson = (JSONObject)jsonObjectResult.get("response");
				String access_token = responseJson.get("access_token").toString();
				System.out.println("토큰발급성공 : " + access_token);
				return access_token;
				
			}else {
				return "";
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	

}
