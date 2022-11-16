package com.kh.strap.board.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReply;

public interface BoardService {
	// 게시글 등록
	public int registerBoard(Board board);
	// 댓글 등록
	public int registerBoardReply(BoardReply bReply);
	// 추천 테이블  삽입
	public void insertLike(Integer boardNo, String memberNick) throws Exception;
	// 전체 게시글 리스트 조회
	public List<Board> printAllBoard(int currentPage, int boardLimit);
	// 자유글 리스트 조회
	public List<Board> printFreeBoard(int currentPage, int boardLimit);
	// 후기글 리스트 조회
	public List<Board> printReviewBoard(int currentPage, int boardLimit);
	// 게시글 검색
	public List<Board> printSearchBoard(String searchCondition, String searchValue, int currentPage, int boardLimit);
	// 게시글 상세페이지
	public Board printOneByNo(Integer boardNo);
	// 게시글 추천 중복 방지
	public int likeCheck(Integer boardNo, String memberNick) throws Exception;
	// 자유글 총 개수
	public int getFreeTotalCount(String searchCondition, String searchValue);
	// 후기글 총 개수
	public int getReviewTotalCount(String searchCondition, String searchValue);
	// 댓글 리스트
	public List<BoardReply> printBoardReplyByNo(int boardNo);
	// 후기글 추천수 TOP3
	public List<Board> printBestRankBoard();
	// 모든 게시글 카운트 
	public int getTotalCount(String searchCondition, String searchValue);
	// 게시글 테이블 추천 +1
	public void updateLike(Integer boardNo) throws Exception;
	// 게시글 테이블 추천 -1
	public void updateLikeCancel(Integer boardNo) throws Exception;
	// 추천 테이블 구분자 1
	public void updateLikeCheck(Integer boardNo, String memberNick) throws Exception;
	// 추천 테이블 구분자 0
	public void updateLikeCheckCancel(Integer boardNo, String memberNick) throws Exception;
	// 조회수 중복 방지
	public int updateBoardCount(Integer boardNo);
	// 게시글 수정
	public int modifyOneByNo(Board board);
	// 댓글 삭제
	public int removeBoardReply(BoardReply bReply);
	// 게시글 삭제
	public int removeOneByNo(int boardNo);
	// 추천 테이블 삭제
	public void deleteLike(Integer boardNo, String memberNick) throws Exception;
}


















