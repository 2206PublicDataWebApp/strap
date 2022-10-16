package com.kh.strap.board.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.service.BoardService;
import com.kh.strap.board.store.logic.BoardStoreLogic;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardStoreLogic bStore;

	@Override
	public int registerBoard(Board board) {
		int result = bStore.insertBoard(session, board);
		return result;
	}
}
