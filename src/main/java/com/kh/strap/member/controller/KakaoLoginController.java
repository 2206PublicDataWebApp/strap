package com.kh.strap.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.KakaoLoginService;
import com.kh.strap.member.service.MemberService;

@Controller
public class KakaoLoginController {

	@Autowired
	private KakaoLoginService kService;
	@Autowired
	private MemberService mService;
	
	
	/**
	 * 소셜 로그인 시도
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
			,ModelAndView mv
			,HttpServletRequest request) {
		String access_token = kService.getToken(code);
		Map<String, Object> userInfo = kService.getUserInfo(access_token);
		//에러처리, 회원가입 중 새로고침 시 로그인페이지로 이동 
		if(userInfo == null || userInfo.isEmpty()) {
			mv.setViewName("redirect:/member/loginView.strap");
			return mv;
		}
		String memberId = (String)userInfo.get("memberId");
		int result = mService.kakaoMembercheck(memberId);
		
		System.out.println("==========getCode=========");
		System.out.println("code : " + code);
		System.out.println("==========getToekn=========");
		System.out.println("access_toekn : " + access_token);
		System.out.println("==========getUserInfo=========");
		System.out.println("userInfo : " + userInfo);
		System.out.println("==========getIdCheck=========");
		System.out.println("result : " + result);
		if(result == 1) {
			//로그인 처리 
			Member member = mService.memberById(memberId);
			HttpSession session = request.getSession();
			session.setAttribute("access_token", access_token);
			session.setAttribute("loginUser", member);
			mv.setViewName("redirect:/");
		} else {
			//회원가입 처리 > socilaEnroll.jsp
			mv.addObject("userInfo", userInfo);
			mv.setViewName("/member/socialEnroll");
		}
		return mv;
	}
	
	/**
	 * 소셜 로그아웃
	 * @return
	 */
	@RequestMapping("/member/kakaoLogout.strap")
	public String kakaoLogout(
			@RequestParam("token") String token
			,HttpSession session) {
		kService.logout(token);
		session.removeAttribute("access_token");
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	/**
	 * 소셜 회원가입
	 * @param member 가입 정보
	 * @return 가입 후 로그인 페이지로 이동
	 */
	@RequestMapping(value="/member/socialRegister.strap", method=RequestMethod.POST)
	public String insertMember(
			@ModelAttribute Member member
			,String jymAddress
			,String jymTitle
			) {
		String memberJym = jymAddress +"," +jymTitle;
		member.setMemberJym(memberJym);
		int result = mService.insertSocialMember(member);
		if(result==1) {
			return "/member/loginView";
		}else {
			return "/common/error.page"; 
		}
	}
	
	
}
