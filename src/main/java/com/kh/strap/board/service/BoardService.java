package com.kh.strap.board.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReReply;
import com.kh.strap.board.domain.BoardReply;

public interface BoardService {
	public int registerBoard(Board board);
	
	public int getTotalCount(String searchCondition, String searchValue);
	
	public List<Board> printAllBoard(int currentPage, int boardLimit);
	
	public List<Board> printFreeBoard(int currentPage, int boardLimit);
	
	public List<Board> printReviewBoard(int currentPage, int boardLimit);
	
	public List<Board> printSearchBoard(String searchCondition, String searchValue, int currentPage, int boardLimit);

	public Board printOneByNo(Integer boardNo);

	public void updateLike(Integer boardNo) throws Exception;

	void updateLikeCancel(Integer boardNo) throws Exception;

	void insertLike(Integer boardNo, String memberNick) throws Exception;

	void deleteLike(Integer boardNo, String memberNick) throws Exception;

	int likeCheck(Integer boardNo, String memberNick) throws Exception;

	void updateLikeCheck(Integer boardNo, String memberNick) throws Exception;

	void updateLikeCheckCancel(Integer boardNo, String memberNick) throws Exception;
	
	// 수정
	public int modifyOneByNo(Board board);
	
	// 게시글 삭제
	public int removeOneByNo(int boardNo);
	
	public int getFreeTotalCount(String searchCondition, String searchValue);
	
	public int getReviewTotalCount(String searchCondition, String searchValue);
	
	// 댓글
	public int registerBoardReply(BoardReply bReply);
	
	public List<BoardReply> printBoardReplyByNo(int boardNo);

	public int removeBoardReply(BoardReply bReply);
	public int modifyBoardReply(BoardReply bReply);
}


















