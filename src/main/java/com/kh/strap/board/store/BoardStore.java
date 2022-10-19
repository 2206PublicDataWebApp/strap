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
	
	int selectCountGood(SqlSessionTemplate session, Integer boardNo);

	int selectCountBad(SqlSessionTemplate session, Integer boardNo);
	
	int selectBoardRecord(SqlSessionTemplate session, String memberId, Integer boardNo);

}
