package com.kh.strap.notebox.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.domain.NoteChat;
import com.kh.strap.notebox.service.NoteBoxService;
import com.kh.strap.notebox.service.NoteChatService;

@Controller
public class NoteChatController {
	@Autowired
	private NoteChatService ncService;
	@Autowired
	private NoteBoxService nbService;
		
		/**
		 * 
		 * @param mv
		 * @param request
		 * @param senderNick
		 * @param recipientId
		 * @param recipientNick
		 * @param ncList
		 * @param memberId
		 * @return
		 */
		// 쪽지대화 조회
		@ResponseBody
		@RequestMapping(value="/notebox/noteChatView.strap",produces="application/json;charset=utf-8", method=RequestMethod.GET)
		public ModelAndView showNoteChat(ModelAndView mv, HttpServletRequest request
				,@RequestParam("senderNick") String senderNick
				,@RequestParam("recipientId") String recipientId
				,@RequestParam("recipientNick") String recipientNick
				,@RequestParam("ncList") String ncList
				,@RequestParam("memberId") String memberId
				) {
			Gson gson = new Gson();
			String jsonString = ncList;
//			System.out.println("nc리스트 : " + jsonString);
			gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			NoteChat[] array = gson.fromJson(jsonString, NoteChat[].class);
//		    System.out.println("어레이 : " + array);
			List<NoteChat> list = Arrays.asList(array);
//		    System.out.println("리스트 : " + list);
		    if(memberId.equals(recipientId)) {
				mv.addObject("senderNick", senderNick);
				
			} else {
				mv.addObject("senderNick", recipientNick);
			}
		    Member mOne = nbService.printOneByName(recipientNick);
		    mv.addObject("member", mOne);
			mv.addObject("ncList", list);
			mv.addObject("memberId", memberId);
			mv.setViewName("mypage/noteChat");
			return mv;
		}
		
		/**
		 * 
		 * @param request
		 * @param noteNo
		 * @param senderNick
		 * @return 스트링(json)
		 */
		// 쪽지에서 Json으로 값 이동
		@ResponseBody
		@RequestMapping(value="/notebox/noteChatListView.strap",produces="application/json;charset=utf-8", method=RequestMethod.GET)
		public String showChatList(HttpServletRequest request
				,@RequestParam("noteNo") Integer noteNo
				,@RequestParam("senderNick") String senderNick
				,@RequestParam("recipientId") String recipientId
				,@RequestParam("recipientNick") String recipientNick) {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			NoteChat noteChat = new NoteChat();
			noteChat.setChatNo(noteNo);
			noteChat.setSenderId(senderNick);
			List<NoteChat> ncList = ncService.printNoteChatList(noteNo);
			JSONArray sendArray = new JSONArray();
			int i = 0;
			for(NoteChat nc : ncList) {
				JSONObject ncJsonObj = new JSONObject();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//				System.out.println("변환전 : " +nc.getSenderDate());
				String formatDate = sdf.format(nc.getSenderDate());
//				System.out.println("변환후 : " + formatDate);
				ncJsonObj.put("chatNo", nc.getChatNo());
				ncJsonObj.put("senderId", nc.getSenderId());
				ncJsonObj.put("senderNick", nc.getSenderNick());
				ncJsonObj.put("chatContents", nc.getChatContents());
				ncJsonObj.put("senderDate", formatDate);
				sendArray.add(ncJsonObj);
				i++;
			}
//			System.out.println("제이슨 어레이 : " + sendArray);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("memberId", memberId);
			jsonObj.put("noteNo", noteNo);
			jsonObj.put("ncList", sendArray.toJSONString());
			jsonObj.put("senderNick", senderNick);
			jsonObj.put("recipientId", recipientId);
			jsonObj.put("recipientNick", recipientNick);
//			System.out.println("제이슨 스트링 전 : " + jsonObj);
//			System.out.println("제이슨 스트링 : " + jsonObj.toString());
			return jsonObj.toString();
			
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
				,@RequestParam("senderNick") String senderNick
				,@RequestParam("chatContents") String chatContents) {
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			String memberId = member.getMemberId();
			noteBox.setSenderId(memberId);
			noteBox.setSenderNick(senderNick);
			noteBox.setNoteContents(chatContents);
			int result = ncService.registNoteChat(noteBox);
			
			mv.setViewName("mypage/noteChat");
			return mv;
		}
		
		/**
		 * 
		 * @param noteNo
		 * @return
		 */
		// 쪽지 수락 ajax
		@ResponseBody
		@RequestMapping(value="/notebox/acceptNote.strap", method=RequestMethod.POST)
		public String acceptNote(@RequestParam("noteNo") Integer noteNo) {
			int result = ncService.modifyNoteBox(noteNo);
			if(result > 0) {
				return "success";
			} else {
				return "fail";
			}
		}
}
