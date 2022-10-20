package com.kh.strap.board.service;

import java.util.List;

import com.kh.strap.board.domain.Board;

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
	
	/*
	 * // 추천 public int getCountGood(Integer boardNo); // 비추천 public int
	 * getCountBad(Integer boardNo);
	 * 
	 * public int getBoardRecord(String memberNick, Integer boardNo);
	 * 
	 * public int addGoodBadCount(Integer boardNo, String memberNick, String
	 * goodOrBad);
	 */
}



















