package com.kh.strap.board.store.logic;

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
}
