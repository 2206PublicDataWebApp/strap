package com.kh.strap.board.controller;

import com.kh.strap.admin.controller.*;
import com.kh.strap.admin.domain.*;
import com.kh.strap.admin.service.*;
import com.kh.strap.admin.service.logic.*;
import com.kh.strap.admin.store.*;
import com.kh.strap.admin.store.logic.*;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.kh.strap.admin.domain.Notice;
import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReReply;
import com.kh.strap.board.domain.BoardReply;
import com.kh.strap.board.service.logic.BoardServiceImpl;
import com.kh.strap.member.domain.Member;

@Controller
public class BoardController {
	
	/*
	 * @ExceptionHandler({NullPointerException.class, NumberFormatException.class})
	 * public String errorHandler() { return "redirect:/home.strap"; }
	 */
	
	@Autowired
	private BoardServiceImpl bService;
	
	@Autowired
	private NoticeService nService;
	
	/**
	 * 게시글 작성 페이지 이동
	 * @return : "/board/boardWrite"
	 */
	@RequestMapping(value = "/board/writeView.strap", method = RequestMethod.GET)
	public String registerView() {

		return "/board/boardWrite";
	}
	
	/**
	 *  게시글 작성 페이지
	 * @param mv
	 * @param board
	 * @return mv.setViewName("/board/list.strap")
	 */
	@RequestMapping(value = "/board/boardWrite.strap", method = RequestMethod.POST)
	public ModelAndView boardWrite(ModelAndView mv, 
			@ModelAttribute Board board) {
		
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
	 * 게시판 전체글 페이지 출력
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/list.strap", method=RequestMethod.GET)
	public ModelAndView boardListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = bService.getTotalCount("","");
		int boardLimit = 10;
		int noticeLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Board> bList = bService.printAllBoard(currentPage, boardLimit);
		List<Notice> nList = nService.printNoticeList(currentPage, noticeLimit);
		
		if(!bList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("bList", bList);
			mv.addObject("nList", nList);
		}
		mv.setViewName("board/boardListView");
		return mv;
	}
	
	/**
	 * 게시판 자유글 페이지 출력
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/free.strap", method=RequestMethod.GET)
	public ModelAndView boardFree(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = bService.getFreeTotalCount("","");
		int boardLimit = 10;
		int noticeLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Board> bList = bService.printFreeBoard(currentPage, boardLimit);
		List<Notice> nList = nService.printNoticeList(currentPage, noticeLimit);
		
		if(!bList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("bList", bList);
			mv.addObject("nList", nList);
		}
		mv.setViewName("board/boardListView");
		return mv;
	}
	
	/**
	 * 게시판 후기글 페이지 출력
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/review.strap", method=RequestMethod.GET)
	public ModelAndView boardReview(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = bService.getReviewTotalCount("","");
		int boardLimit = 10;
		int noticeLimit = 5;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
		endNavi = startNavi + naviLimit - 1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		List<Board> bList = bService.printReviewBoard(currentPage, boardLimit);
		List<Notice> nList = nService.printNoticeList(currentPage, noticeLimit);
		
		if(!bList.isEmpty()) {
			mv.addObject("urlVal", "list");
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.addObject("bList", bList);
			mv.addObject("nList", nList);
		}
		mv.setViewName("board/boardListView");
		return mv;
	}
	
	/**
	 * 게시판 검색
	 * @param mv
	 * @param search
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value="/board/search.strap",method=RequestMethod.GET)
	public ModelAndView boardSearchView(
			ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			int currentPage = (page != null) ? page : 1;
			int totalCount = bService.getTotalCount(searchCondition, searchValue);
			int boardLimit = 10;
			int noticeLimit = 5;
			int naviLimit = 5;
			int maxPage;
			int startNavi;
			int endNavi;
			maxPage = (int)((double)totalCount/boardLimit + 0.9);
			startNavi = ((int)((double)currentPage/naviLimit+0.9)-1)*naviLimit+1;
			endNavi = startNavi + naviLimit - 1;
			if(maxPage < endNavi) {
				endNavi = maxPage;
			}
			List<Board> bList = bService.printSearchBoard(searchCondition, searchValue, currentPage, boardLimit);
			List<Notice> nList = nService.printNoticeList(currentPage, noticeLimit);
			if(!bList.isEmpty()) {
				mv.addObject("bList", bList);
				
			}else {
				mv.addObject("bList", null);
			}
			mv.addObject("nList", nList);
			mv.addObject("urlVal", "search");
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi);
			mv.setViewName("board/boardListView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 썸머노트 이미지 업로드
	 * @param multipartFile
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/board/uploadSummernoteImageFile", method = RequestMethod.POST)
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		
		//JsonObject jsonObject = new JsonObject();
		JSONObject jsonObject = new JSONObject();
		try {
			// 에디터에서 업로드한 file을 MultipartFile로 받았다
			
			// 1.파일 이름과 경로를 설정한다
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\image\\board\\summerImageFiles";	//저장될 외부 파일 경로
			
			//2.파일이름이 중복되지 않도록 재정의 해준다
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);	//파일 확장자
			String boardFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
			
			// 3.저장할 경로의 폴더(디렉토리)가 없으면 새로 만든다
			File targetFile = new File(savePath);
			if (!targetFile.exists()) {
				targetFile.mkdir();
			}
			
			// 4.설정한경로에 재정의한 이름으로 파일을 저장한다
			multipartFile.transferTo(new File(savePath + "\\" + boardFileRename));
		
			// 5.ajax의 success로 리턴해줄 json오브젝트에 프로퍼티를 저장해준다
			// 1)썸머노트의 insertImage 설정값에 넣어줄 파일의 경로
			// 2)원래 파일이름
			// 3)ajax 성공여부
//			jsonObject.addProperty("url", "/resources/image/board/summerImageFiles/" + boardFileRename);
//			jsonObject.addProperty("originName", originalFileName);
//			jsonObject.addProperty("responseCode", "success");
			jsonObject.put("url", "/resources/image/board/summerImageFiles/" + boardFileRename);
			jsonObject.put("originName", originalFileName);
			jsonObject.put("responseCode", "success");
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return jsonObject.toJSONString();
	}
	
	/**
	 * 게시글 상세 페이지
	 * @param boardNo
	 * @param page
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/board/detail.strap", method=RequestMethod.GET)
	public ModelAndView boardDetailView(
			ModelAndView mv
			, @RequestParam("boardNo") Integer boardNo
			, @RequestParam("page") Integer page
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) {
		List<BoardReply> bReplyList = bService.printBoardReplyByNo(boardNo);
		if(!bReplyList.isEmpty()) {
			mv.addObject("bReplyList", bReplyList);
		}else {
			mv.addObject("bReplyList",null);
		}
		// 해당 게시판 번호를 받아 상세페이지로 넘겨준다
		Board board = bService.printOneByNo(boardNo);
		
		Cookie[] cookies = request.getCookies();	
		// 비교하기 위해 새로운 쿠기
		Cookie viewCookie = null;
		// 쿠기가 있을 경우
		if (cookies != null && cookies.length > 0) {
			
			for (int i = 0; i < cookies.length; i++) {
				// Cookie의 name이 cookie + boardNo와 일치하는 쿠키를 viewCookie에 넣어준다
				if (cookies[i].getName().equals("cookie"+boardNo)) {
					viewCookie = cookies[i];
				}
			}
		}
			if (board != null) {
				session.setAttribute("boardNo", board.getBoardNo());
				mv.addObject("page", page);
				mv.addObject("board", board);
				// viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리한다
				if (viewCookie == null) {
					// 쿠키 생성(이름, 값)
					Cookie newCookie = new Cookie("cookie"+boardNo, "|" + boardNo + "|");
					// 쿠키 추가
					response.addCookie(newCookie);					
					// 쿠키를 추가 시키고 조회수 증가시킨다
					int result = bService.updateBoardCount(boardNo);
				// viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않는다
				} else {
					// 쿠키 값 받아온다
					String value = viewCookie.getValue();
				}				
				mv.setViewName("board/boardDetail");
				return mv;
			} else {
				mv.setViewName("common/errorPage");
				return mv;
			}
	}
	
	/**
	 * 공지사항 상세 페이지
	 * @param mv
	 * @param noticeNo
	 * @param page
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/board/noticeDetail.strap", method=RequestMethod.GET)
	public ModelAndView noticeDetailView(ModelAndView mv
			, @RequestParam("noticeNo") Integer noticeNo
			, @RequestParam("page") Integer page
			, HttpSession session
			,HttpServletRequest request
			,HttpServletResponse response) {
		try {
			Notice notice = nService.printOneByNo(noticeNo);
			session.setAttribute("noticeNo", notice.getNoticeNo());
			mv.addObject("notice", notice);
			mv.addObject("page", page);
			
			Cookie [] cookies = request.getCookies();
	        Cookie viewCookie = null;
	        
	        if (cookies != null && cookies.length > 0) {
	            for (int i = 0; i < cookies.length; i++) {
	                if (cookies[i].getName().equals("cookie" + noticeNo)) { 
	                    viewCookie = cookies[i];
	                }
	            }
	        }
	        if (notice != null) {
	            mv.addObject("page", page);
	        	mv.addObject("notice", notice);
	            if (viewCookie == null) {    
	                Cookie newCookie = new Cookie("cookie"+noticeNo, "|" + noticeNo + "|");
	                response.addCookie(newCookie);
	                int result = nService.viewUp(noticeNo);
	            } else { 
	                String value = viewCookie.getValue();
	            }
	        }
			mv.setViewName("board/boardNoticeDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 게시글 추천
	 * @param mv
	 * @param boardNo
	 * @param page
	 * @param memberNick
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/board/updateLike", method = RequestMethod.POST)
	public ModelAndView updateLike(
			ModelAndView mv
			, @RequestParam("boardNo") Integer boardNo
			, @RequestParam("page") Integer page
			, @RequestParam("memberNick") String memberNick
			, HttpSession session) {
		try {
			
			int likeCheck = bService.likeCheck(boardNo, memberNick);
			if(likeCheck == 0) {
				//좋아요 처음누름
				bService.insertLike(boardNo, memberNick); //like테이블 삽입
				bService.updateLike(boardNo);	//게시판테이블 +1
				bService.updateLikeCheck(boardNo, memberNick);//like테이블 구분자 1
				
			}else if(likeCheck == 1) {
				bService.updateLikeCheckCancel(boardNo, memberNick); //like테이블 구분자0
				bService.updateLikeCancel(boardNo); //게시판테이블 - 1
				bService.deleteLike(boardNo, memberNick); //like테이블 삭제
			}
			session.setAttribute("likeCheck", likeCheck);
			mv.setViewName("redirect:/board/detail.strap?boardNo="+boardNo+"&page="+page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	/**
	 * 게시글 수정페이지 이동
	 * @param mv
	 * @param boardNo
	 * @param page
	 * @return
	 */
	@RequestMapping(value = "/board/modifyView.strap", method = RequestMethod.GET)
	public ModelAndView boardModifyView(
			ModelAndView mv
			, @RequestParam("boardNo") Integer boardNo
			, @RequestParam("page") int page) {
		try {
			Board board = bService.printOneByNo(boardNo);
			mv.addObject("board", board);
			mv.addObject("page", page);
			mv.setViewName("board/boardModify");			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 게시글 수정페이지
	 * @param mv
	 * @param board
	 * @param page
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/board/modify.strap",method=RequestMethod.POST)
	public ModelAndView boardModify(
			ModelAndView mv
			,@ModelAttribute Board board
			,@RequestParam("page") Integer page
			,HttpServletRequest request) {
		try {
			int result = bService.modifyOneByNo(board);
			mv.setViewName("redirect:/board/list.strap?page="+page);
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 게시글 삭제
	 * @param session
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/remove.strap", method=RequestMethod.GET)
	public String boardRemove(
			HttpSession session
			, Model model
			, @RequestParam("page") Integer page) {
		try {
			int boardNo = (int)session.getAttribute("boardNo");
			int result = bService.removeOneByNo(boardNo);
			if(result > 0) {
				session.removeAttribute("boardNo");
			}
			return "redirect:/board/list.strap?page="+page;
		} catch (Exception e) {
			model.addAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	/**
	 * 댓글 작성
	 * @param mv
	 * @param page
	 * @param bReply
	 * @return
	 */
	@RequestMapping(value="/board/reply/write.strap",method=RequestMethod.POST)
	public ModelAndView boardReplyWrite(ModelAndView mv,
			@RequestParam("page") Integer page,
			@ModelAttribute BoardReply bReply) {
		
		//1.댓글 작성에서 가져온 rReply를 INSERT해준다
		int result = bService.registerBoardReply(bReply);
		if(result>0 ) {
			
			//2.등록 성공 시 파라미터 값을 전달하면서 상세페이지로 리다이렉트한다
			int boardNo = bReply.getBoardNo();
			mv.setViewName("redirect:/board/detail.strap?boardNo="+boardNo+"&page="+page);
		}else {
			
		}
		return mv;
	}
    
	/**
	 * 댓글 수정
	 * @param mv
	 * @param bReply
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/reply/modify.strap",method=RequestMethod.POST)
	public ModelAndView boardReplyModify(ModelAndView mv,
			@ModelAttribute BoardReply bReply,
			@RequestParam("page") Integer page) {
		
		//1. UPDATE문을 이용하여 게시물의 내용을 변경한다.
		int result = bService.modifyBoardReply(bReply);
		if(result>0) {
			
			//2. 성공 후 현재의 상세페이지로 리다이렉트한다.
			int boardNo = bReply.getBoardNo();
			mv.setViewName("redirect:/board/detail.strap?boardNo="+boardNo+"&page="+page);
		}else {
			
		}
		return mv;
	}
	
	/**
	 * 댓글 삭제
	 * @param mv
	 * @param bReply
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/board/reply/remove.strap",method=RequestMethod.POST)
	public ModelAndView boardReplyRemove(ModelAndView mv,
			@ModelAttribute BoardReply bReply,
			@RequestParam("page") Integer page) {
		
		//1. UPDATE문을 이용하여 게시물의 내용과 상태를 변경한다.
		int result = bService.removeBoardReply(bReply);
		if(result>0) {
			
		//2.로직 성공 후 현재의 상세페이지로 리다이렉트한다.
		int boardNo = bReply.getBoardNo();
		mv.setViewName("redirect:/board/detail.strap?boardNo="+boardNo+"&page="+page);
		}else {
			
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView boardBestRank(
			ModelAndView mv
			, @RequestParam("boardNo") Integer boardNo
			, @RequestParam("page") Integer page
			, HttpSession session) {
		try {
			//Board board = bService.printBestRankBoard();
			List<Board> bList = bService.printBestRankBoard();
			mv.addObject("bList", bList);
			//session.setAttribute("boardNo", board.getBoardNo());
			//mv.addObject("board", board);
			mv.addObject("page", page);
			mv.setViewName("home");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}