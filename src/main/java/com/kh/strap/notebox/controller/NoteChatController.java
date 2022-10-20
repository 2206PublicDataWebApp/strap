package com.kh.strap.notebox.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.notebox.domain.NoteChat;
import com.kh.strap.notebox.service.logic.NoteChatServiceImpl;


public class NoteChatController {
	@Autowired
	private NoteChatServiceImpl ncService;
	
	// 쪽지 내 채팅리스트
		@ResponseBody
		@RequestMapping(value="/mypage/noteChatListView.strap", method=RequestMethod.GET)
		public ModelAndView showChatList(ModelAndView mv
				,@RequestParam("noteNo") Integer noteNo) {
			List<NoteChat> nList = ncService.printNoteChatList(noteNo);
			mv.addObject("nList", nList);
			mv.setViewName("mypage/noteChat");
			return mv;
		}
}
