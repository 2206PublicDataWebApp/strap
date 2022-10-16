package com.kh.strap.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.service.logic.BoardServiceImpl;


@Controller
public class BoardController {
	
	@Autowired
	private BoardServiceImpl bService;
	
	/**
	 * 게시글 작성 페이지 이동
	 * @return : "/board/boardWrite"
	 */
	@RequestMapping(value = "/board/writeView.strap", method = RequestMethod.GET)
	public String registerView() {

		return "/board/boardWrite";
	}
	
	/**
	 * 
	 * @param mv
	 * @param board
	 * @return mv.setViewName("/board/list.strap")
	 */
	@RequestMapping(value = "/board/write.strap", method = RequestMethod.POST)
	public ModelAndView reviewWrite(ModelAndView mv, 
			@ModelAttribute Board board) {
		
		//1. 작성페이지에서 전달받은 board로 INSERT한다.
		int result = bService.registerBoard(board);
		try {
			if (result > 0) {
				mv.setViewName("redirect:/board/list.strap?currnentPage=1");
			} else {
				mv.addObject("msg", "게시물 저장에 실패하였습니다.").setViewName("/common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("/common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 게시판 목록 페이지 출력
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/list.strap", method=RequestMethod.GET)
	public ModelAndView boardListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		/////////////////////////////////////////////////////////////////////////
		int currentPage = (page != null) ? page : 1;
		//int totalCount = bService.getTotalCount("","");
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		// 23/5 = 4.8 + 0.9 = 5(.7)
		//maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		//if(maxPage < endNavi) {
		//	endNavi = maxPage;
		//}
		//////////////////////////////////////////////////////////////////////////
		// /board/list.kh?page=${currentPage }
		//List<Board> bList = bService.printAllBoard(currentPage, boardLimit);
		/*
		 * if(!bList.isEmpty()) { mv.addObject("urlVal", "list");
		 * mv.addObject("maxPage", maxPage); mv.addObject("currentPage", currentPage);
		 * mv.addObject("startNavi", startNavi); mv.addObject("endNavi", endNavi);
		 * mv.addObject("bList", bList); }
		 */
		mv.setViewName("board/boardListView");
		return mv;
	}
}
