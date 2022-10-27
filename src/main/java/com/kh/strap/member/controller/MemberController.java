package com.kh.strap.member.controller;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private PasswordEncoder passwordEncoder;

	/**
	 * 
	 * @return 로그인 페이지 이동
	 */
	@RequestMapping("/member/showMap.strap")
	public String showMap() {
		return "/member/jym";
	}
	
	/**
	 * 
	 * @return 로그인 페이지 이동
	 */
	@RequestMapping("/member/loginView.strap")
	public String loginView() {
		return "/member/loginView";
	}
	
	/**
	 * 
	 * @return 일반가입 페이지 이동
	 */
	@RequestMapping("/member/enroll.strap")
	public String enrollForm() {
		return "/member/enroll";
	}
	
	/**
	 * 아이디 중복 체크
	 * @param memberId 회원가입할 아이디
	 * @return 회원가입 페이지
	 */
	@ResponseBody
	@RequestMapping("/member/memberIdCheck.strap")
	public String memberIdCheck(
			@RequestParam("memberId") String memberId) {
		int result = mService.memberIdCheck(memberId);
		if(result ==0) {
			return "ok";
		} else {
			return "error";
		}
	}
	
	/**
	 * 닉네임 중복 체크
	 * @param memberNick 회원가입할 닉네임
	 * @return 회원가입 페이지
	 */
	@ResponseBody
	@RequestMapping("/member/memberNickCheck.strap")
	public String memberNickCheck(
			@RequestParam("memberNick") String memberNick) {
		int result = mService.memberNickCheck(memberNick);
		if(result ==0) {
			return "ok";
		} else {
			return "error";
		}
	}
	/**
	 * 일반 회원가입
	 * @param member 가입 정보
	 * @return 가입 후 로그인 페이지로 이동
	 */
	@RequestMapping(value="/member/register.strap", method=RequestMethod.POST)
	public String insertMember(
			@ModelAttribute Member member
			,String jymAddress
			,String jymTitle
			) {
		String memberJym = jymAddress +"," +jymTitle;
		System.out.println(member.toString());
		member.setMemberJym(memberJym);
		String rawPwd = member.getMemberPwd();
		String encodePwd = passwordEncoder.encode(member.getMemberPwd());
		member.setMemberPwd(encodePwd);
		int result = mService.inserMember(member);
		return "/member/loginView";
	}
	
	/**
	 * 일반 로그인
	 * @param memberId 로그인 아이디
	 * @param memberPwd 로그인 비밀번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/member/login.strap",produces = "text/plain;charset=utf-8", method=RequestMethod.POST)
	public String memberLogin(
			String memberId
			,String memberPwd
			,HttpServletRequest request) {
		String encodePwd = mService.memberPwdById(memberId);
		System.out.println(passwordEncoder.matches(memberPwd, encodePwd));
		
		if(passwordEncoder.matches(memberPwd, encodePwd)) {
			//로그인 시 닉네임으로 세션 등록
			Member member = mService.memberById(memberId);
			member.setMemberPwd(null);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", member);
			return "ok";
		}else {
			return "no";
		}
	}
	
	/**
	 * 로그 아웃(세션파괴)
	 * @return 
	 */
	@RequestMapping("/member/logout.strap")
	public String memberLogout(
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	
	/**
	 * @return 아이디 찾기 페이지로 이동
	 */
	@RequestMapping("/member/findId.strap")
	public String findId() {
		return "/member/findId";
	}
	
	/**
	 * @return 비번 찾기 페이지로 이동
	 */
	@RequestMapping("/member/findPwd.strap")
	public String findPwd() {
		return "/member/findPwd";
	}

	/**
	 * 
	 * @param memberEmail 회원 이메일
	 * @return 생성된 난수와 전송되었다는 문자열 json 리턴
	 */
	@ResponseBody
	@RequestMapping(value="/member/sendMail.strap",produces="applicaiton/json;charset=utf-8")
	public String sendMail(
			@RequestParam("memberEmail") String memberEmail) {
		int result = mService.IdCheckByEmail(memberEmail);
		System.out.println(memberEmail);
		System.out.println("해당 이메일로 가입한 아이디 갯수 :" + result);
		//해당 이메일로 가입한 아이디가 있으면 이메일 전송
		if(result > 0) {
			//6자리 난수 생성
			ThreadLocalRandom random = ThreadLocalRandom.current();
			String num = String.valueOf(random.nextInt(100000, 1000000));
			String subject = "[스트랩] 아이디 찾기 인증번호";
			String content = "요청하신 아이디를 찾기 위한 인증 번호 [ "+num+" ]입니다";
			String from ="스트랩팀 <mykri155@gmail.com>";
			String to = memberEmail;
			System.out.println(to);
			try {
				//MimeMessage 객체를 생성하여 발송하는 방법
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); //true는 멀티파트 메시지를 사용한다는 의미, 단순 텍스트는 생략가능
				mailHelper.setFrom(from);			//보내는이
				mailHelper.setTo(to);				//받는이
				mailHelper.setSubject(subject);		//제목
	            mailHelper.setText(content, true);	//내용, true는 html을 사용하겠다는 의미, 단순 텍스트는 생략 가능
	//            파일 업로드 시 추가할 코드
	//            FileSystemResource file = new FileSystemResource(new File("경로\업로드파일.형식")); 
	//            mailHelper.addAttachment("업로드파일.형식", file);  
	            mailSender.send(mail);				//전송
	            JSONObject jsonObj = new JSONObject();
	            jsonObj.put("num", num);
	            jsonObj.put("send", "ok");
	            return jsonObj.toString();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		JSONObject jsonObj = new JSONObject();
        jsonObj.put("send", "error");
		return jsonObj.toString();	
	}
	
	/**
	 * @param memberEmail 회원 이메일
	 * @return 해당 이메일로 가입한 아이디를 List로 아이디 찾기 결과 페이지에 리턴
	 */
	@RequestMapping(value="/member/findIdResult.strap", method=RequestMethod.POST)
	public ModelAndView findIdResult(
			ModelAndView mv
			,@RequestParam("memberEmail") String memberEmail) {
		List<Member> sList = mService.findIdByEmail(memberEmail);
		mv.addObject("sList", sList);
		mv.setViewName("/member/findIdResult");
		return mv;
	}
	
	/**
	 * @param memberEmail
	 * @param memberId
	 * 비밀번호를 찾기위해 아이디와 이메일이 일치하는지 확인
	 */
	@ResponseBody
	@RequestMapping(value="/member/idEmailCheck.strap", produces="applicaiton/json;charset=utf-8",method=RequestMethod.POST)
	public String idEmailCheck(
			@RequestParam("memberId") String memberId
			,@RequestParam("memberEmail") String memberEmail) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberEmail(memberEmail);
		System.out.println(member);
		int result = mService.idEmailCheck(member);
		System.out.println("아이디와 이메일 일치" + result);
		if(result ==1) {
			ThreadLocalRandom random = ThreadLocalRandom.current();
			String num = String.valueOf(random.nextInt(100000, 1000000));
			String subject = "[스트랩] 비밀번호 찾기 인증번호";
			String content = "요청하신 비밀번호를 찾기 위한 인증 번호 [ "+num+" ]입니다";
			String from ="스트랩팀 <mykri155@gmail.com>";
			String to = memberEmail;
			System.out.println(to);
			try {
				//MimeMessage 객체를 생성하여 발송하는 방법
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); //true는 멀티파트 메시지를 사용한다는 의미, 단순 텍스트는 생략가능
				mailHelper.setFrom(from);			//보내는이
				mailHelper.setTo(to);				//받는이
				mailHelper.setSubject(subject);		//제목
	            mailHelper.setText(content, true);	//내용, true는 html을 사용하겠다는 의미, 단순 텍스트는 생략 가능
	//            파일 업로드 시 추가할 코드
	//            FileSystemResource file = new FileSystemResource(new File("경로\업로드파일.형식")); 
	//            mailHelper.addAttachment("업로드파일.형식", file);  
	            mailSender.send(mail);				//전송
	            JSONObject jsonObj = new JSONObject();
	            jsonObj.put("num", num);
	            jsonObj.put("send", "ok");
	            return jsonObj.toString();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		JSONObject jsonObj = new JSONObject();
        jsonObj.put("send", "error");
		return jsonObj.toString();
	}
	
	@RequestMapping(value="/member/findPwdResult.strap", method=RequestMethod.POST)
	public String findPwdResult(
			String memberId,
			String memberEmail) {
		//임시 비밀번호 생성
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7','8', '9',
									  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
									  'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
									  'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 10; i++) {
		  idx = (int)(charSet.length * Math.random()); // 0~35 난수 발생
		  sb.append(charSet[idx]);
		}
		//임시 비밀번호로 테이블 변경
		String memberPwd = passwordEncoder.encode(sb.toString());
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPwd(memberPwd);
		int result = mService.changePwd(member);
		//이메일 발송
		String subject = "[스트랩] 임시 비밀번호 전송";
		String content = "회원님의 계정 비밀번호가 [ "+sb+" ]로 변경되었습니다. 로그인 후 비밀번호를 변경해주세요";
		String from ="스트랩팀 <mykri155@gmail.com>";
		String to = memberEmail;
		try {
			//MimeMessage 객체를 생성하여 발송하는 방법
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); //true는 멀티파트 메시지를 사용한다는 의미, 단순 텍스트는 생략가능
			mailHelper.setFrom(from);			//보내는이
			mailHelper.setTo(to);				//받는이
			mailHelper.setSubject(subject);		//제목
            mailHelper.setText(content, true);	//내용, true는 html을 사용하겠다는 의미, 단순 텍스트는 생략 가능
//            파일 업로드 시 추가할 코드
//            FileSystemResource file = new FileSystemResource(new File("경로\업로드파일.형식")); 
//            mailHelper.addAttachment("업로드파일.형식", file);  
            mailSender.send(mail);				//전송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "member/loginView";
	}
	

	
	
	
}
