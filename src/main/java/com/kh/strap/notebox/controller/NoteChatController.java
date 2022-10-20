package com.kh.strap.notebox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.domain.NoteChat;
import com.kh.strap.notebox.service.logic.NoteChatServiceImpl;

@Controller
public class NoteChatController {
	@Autowired
	private NoteChatServiceImpl ncService;
	
	
		// 쪽지 내 채팅리스트
		@ResponseBody
		@RequestMapping(value="/notebox/noteChatListView.strap", method=RequestMethod.GET)
		public ModelAndView showChatList(ModelAndView mv, HttpServletRequest request
				,@RequestParam("noteNo") Integer noteNo
				,@RequestParam("senderNick") String senderNick) {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			NoteChat noteChat = new NoteChat();
			noteChat.setChatNo(noteNo);
			noteChat.setSenderId(senderNick);
			List<NoteChat> nList = ncService.printNoteChatList(noteNo);
			int result = ncService.modifyNoteBox(noteNo);
			mv.addObject("memberId", memberId);
			mv.addObject("noteNo", noteNo);
			mv.addObject("nList", nList);
			mv.addObject("senderNick", senderNick);
			mv.setViewName("mypage/noteChat");
			return mv;
		}
		
		/**
		 * 
		 * @param mv
		 * @param request
		 * @param noteBox
		 * @param chatContents
		 * @return
		 */
		// 쪽지 내용 입력
		@ResponseBody
		@RequestMapping(value="/notebox/registerChat.strap", method=RequestMethod.GET)
		public ModelAndView registChat(ModelAndView mv, HttpServletRequest request
				,@ModelAttribute NoteBox noteBox
				,@RequestParam("chatContents") String chatContents) {
			noteBox.setNoteContents(chatContents);
//			HttpSession session = request.getSession();
//			Member member = (Member)session.getAttribute("loginUser");
//			String memberId = member.getMemberId();
//			System.out.println(noteBox);
			int result = ncService.registNoteChat(noteBox);
			
//			mv.addObject("noteNo", noteNo);
//			mv.addObject("nList", nList);
//			mv.addObject("senderId", senderId);
			mv.setViewName("mypage/noteChat");
			return mv;
		}
}
