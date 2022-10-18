package com.kh.strap.board.service;

import java.util.List;

import com.kh.strap.board.domain.Board;

public interface BoardService {
	public int registerBoard(Board board);
	
	public int getTotalCount(String searchCondition, String searchValue);
	
	public List<Board> printAllBoard(int currentPage, int boardLimit);
	
	public List<Board> printSearchBoard(String searchCondition, String searchValue, int currentPage, int boardLimit);
}
