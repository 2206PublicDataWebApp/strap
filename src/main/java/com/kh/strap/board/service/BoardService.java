package com.kh.strap.board.service;

import java.util.List;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReply;

public interface BoardService {
	public int registerBoard(Board board);
	
	public int getTotalCount(String searchCondition, String searchValue);
	
	public List<Board> printAllBoard(int currentPage, int boardLimit);
	
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
	
	// 댓글
	// 댓글 등록
	public int registerReply(BoardReply bReply);
	
	// 댓글 리스트
	public List<BoardReply> printAllReply(int boardNo);
	
	// 댓글 수정
	public int modifyReply(BoardReply bReply);
	
	// 댓글 삭제
	public int deleteReply(Integer replyNo);
}



















