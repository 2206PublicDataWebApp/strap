package com.kh.strap.board.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.board.service.BoardService;
import com.kh.strap.board.store.logic.BoardStoreLogic;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private BoardStoreLogic bStore;
	
	
}
