package com.kh.strap.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.strap.board.domain.Board;

public interface BoardStore {
	public int insertBoard(SqlSessionTemplate session, Board board);
	
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit);
	
	public List<Board> selectSearchBoard(SqlSession session, String searchCondition, String searchValue, int currentPage, int boardLimit);
	
	public Board selectOneByNo(SqlSession session, Integer boardNo);
	
	public int updateBoardCount(SqlSessionTemplate session, Integer boardNo);

	void updateLike(SqlSession session, Integer boardNo) throws Exception;

	void updateLikeCancel(SqlSession session, Integer boardNo) throws Exception;

	void insertLike(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	void deleteLike(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	int likeCheck(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	void updateLikeCheck(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	void updateLikeCheckCancel(SqlSession session, Integer boardNo, String memberNick) throws Exception;
	
	/*
	 * public int selectCountGood(SqlSessionTemplate session, Integer boardNo);
	 * 
	 * public int selectCountBad(SqlSessionTemplate session, Integer boardNo);
	 * 
	 * public int selectBoardRecord(SqlSessionTemplate session, String memberNick,
	 * Integer boardNo);
	 * 
	 * public int insertGoodBadCount(SqlSessionTemplate session, Integer boardNo,
	 * String memberNick, String goodOrBad);
	 */
	
}















