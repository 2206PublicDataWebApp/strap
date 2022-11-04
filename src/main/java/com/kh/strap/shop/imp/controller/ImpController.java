package com.kh.strap.shop.imp.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.strap.shop.imp.service.ImpService;
import com.kh.strap.shop.product.domain.OrderCancel;
import com.kh.strap.shop.product.service.ProductService;

@Controller
public class ImpController {
	@Autowired
	ImpService iService;
	@Autowired
	ProductService pService;
	
	
	//아임포트 환불
	@ResponseBody
	@RequestMapping(value="/imp/payment/cancel",method=RequestMethod.POST)
	public String ImpPaymentCancel(
			@RequestParam("merchant_uid")String merchant_uid,
			@RequestParam(value="reason")String inputReason) {
		OutputStreamWriter osw;
		DataOutputStream dos;
		BufferedWriter bw;
		BufferedOutputStream bos;
		InputStreamReader isr;
		BufferedReader br;
		StringBuffer sb;
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObjectParam = new JSONObject();
		JSONObject jsonObjectResult;
		
		String access_token = getImpToken();
		//연결할 url
		String hostUrl="https://api.iamport.kr/payments/cancel";
		try {
			URL url = new URL(hostUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Authorization","Bearer "+access_token);
			
			jsonObjectParam.put("merchant_uid", merchant_uid);
			jsonObjectParam.put("reason", inputReason);
			
			System.out.println(merchant_uid);
			System.out.println(jsonObjectParam.toString());
			
			osw = new OutputStreamWriter(con.getOutputStream());
			bw = new BufferedWriter(osw);
			bw.write(jsonObjectParam.toString());
			bw.flush();
			
			isr = new InputStreamReader(con.getInputStream());
			br = new BufferedReader(isr);
			if(con.getResponseCode() == 200) {
				String line = "";
				sb = new StringBuffer();
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				jsonObjectResult = (JSONObject)jsonParser.parse(sb.toString());
				System.out.println(jsonObjectResult.toString());
				//취소내역에 필요한 정보도 DB에 저장하여야 한다.
				/*code // 0이 아니면 실패
				 * 속의 json
				 * response{}
				 * cancelled_at
				 * buyer_name
				 * emb_pg_provider
				 * reason
				 * amount
				 * status
				 * buyer_tel
				 */
				if(Integer.parseInt(jsonObjectResult.get("code").toString())!=0) {
					//환불 실패
					return "fail";
				}else {
					//환불 성공, 환불 정보 DB 저장 및 성공 메시지 화면단 반환
					JSONObject responseJson = (JSONObject)jsonObjectResult.get("response");
					String buyer_name = (String)responseJson.get("buyer_name");
					String emb_pg_provider = (String)responseJson.get("emb_pg_provider");
					String reason = (String)responseJson.get("reaseon");
					Integer amount = Integer.parseInt(responseJson.get("amount").toString());
					String status = (String)responseJson.get("status");
					String buyer_tel = (String)responseJson.get("buyer_tel");
					
					OrderCancel oc = new OrderCancel(merchant_uid, buyer_name, emb_pg_provider, reason, amount, status, buyer_tel);
					
					if(pService.registerCancelInfo(oc) > 0) {
						if(pService.modifyCancelOrder(merchant_uid)>0) {
							return "success";
						}
					}
				}
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "fail";
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
			if(con.getResponseCode() == 200) {
				String line = "";
				sb = new StringBuffer();
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				//5.응답받은 문자열을 json객체로 만들고 필요한 값을 뽑기
				jsonObjectResult = (JSONObject)jsonParser.parse(sb.toString());
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
