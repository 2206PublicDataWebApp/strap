package com.kh.strap.board.service.logic;

import java.util.List;

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

	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = bStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	public List<Board> printAllBoard(int currentPage, int boardLimit) {
		List<Board> bList = bStore.selectAllBoard(session, currentPage, boardLimit);
		return bList;
	}

	@Override
	public List<Board> printSearchBoard(String searchCondition, String searchValue, int currentPage, int boardLimit) {
		 List<Board> bList = bStore.selectSearchBoard(session,searchCondition,searchValue,currentPage,boardLimit);
		 return bList;
	}

}
