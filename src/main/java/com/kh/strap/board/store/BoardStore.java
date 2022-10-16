package com.kh.strap.board.store;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.strap.board.domain.Board;

public interface BoardStore {
	public int insertBoard(SqlSessionTemplate session, Board board);
}
