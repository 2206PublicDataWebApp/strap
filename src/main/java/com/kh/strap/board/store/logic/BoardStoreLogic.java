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

}
