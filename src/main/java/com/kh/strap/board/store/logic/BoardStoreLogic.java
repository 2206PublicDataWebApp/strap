package com.kh.strap.board.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.store.BoardStore;


@Repository
public class BoardStoreLogic implements BoardStore{

	@Override
	public int insertBoard(SqlSessionTemplate session, Board board) {
		int result = session.insert("BoardMapper.insertBoard", board);
		return result;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("BoardMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Board> bList = session.selectList("BoardMapper.selectAllBoard",null,rowBounds);
		return bList;
	}

	public List<Board> selectSearchBoard(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<Board> bList = session.selectList("BoardMapper.selectSearchBoard",paramMap,rowBounds);
		return bList;
	}

	@Override
	public Board selectOneByNo(SqlSession session, Integer boardNo) {
		Board board = session.selectOne("BoardMapper.selectOneByNo", boardNo);
		return board;
	}

	 @Override public int updateBoardCount(SqlSessionTemplate session, Integer boardNo) { 
		 return session.update("BoardMapper.updateBoardCount", boardNo);
	 }

	@Override
	public int selectCountGood(SqlSessionTemplate session, Integer boardNo) {
		int count=session.selectOne("BoardMapper.selectCountGood", boardNo);
		return count;
	}

	@Override
	public int selectCountBad(SqlSessionTemplate session, Integer boardNo) {
		int count=session.selectOne("BoardMapper.selectCountBad", boardNo);
		return count;
	}

	@Override
	public int selectBoardRecord(SqlSessionTemplate session, String memberNick, Integer boardNo) {
		HashMap<String, String> paramMap=new HashMap<String, String>();
		paramMap.put("boardNo", boardNo.toString());
		paramMap.put("memberNick", memberNick);
		int result=session.selectOne("BoardMapper.selectBoardRecord", paramMap);
		return result;
	}

	@Override
	public int insertGoodBadCount(SqlSessionTemplate session, Integer boardNo, String memberNick, String goodOrBad) {
		HashMap<String, String> paramMap=new HashMap<String, String>();
		paramMap.put("boardNo", boardNo.toString());
		paramMap.put("memberNick", memberNick);
		paramMap.put("goodOrBad", goodOrBad);
		
		int result=session.insert("BoardMapper.insertGoodBadCount", paramMap);
		if(goodOrBad.equals("GOOD")) {
			session.update("BoardMapper.updateGood", boardNo);
		}
		else {
			session.update("BoardMapper.updateBad", boardNo);
		}
		return result;
	}
}

















