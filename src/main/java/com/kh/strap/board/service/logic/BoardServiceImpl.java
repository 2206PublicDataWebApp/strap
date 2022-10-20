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

	@Override
	public Board printOneByNo(Integer boardNo) {
		Board board = bStore.selectOneByNo(session, boardNo);
		return board;
	}

	public int updateBoardCount(Integer boardNo) {
		int result = bStore.updateBoardCount(session, boardNo);
		return result;
	}

	/*
	 * @Override public int getCountGood(Integer boardNo) { int count =
	 * bStore.selectCountGood(session, boardNo); return count; }
	 * 
	 * @Override public int getCountBad(Integer boardNo) { int count =
	 * bStore.selectCountBad(session, boardNo); return count; }
	 * 
	 * @Override public int getBoardRecord(String memberNick, Integer boardNo) { int
	 * result=bStore.selectBoardRecord(session, memberNick, boardNo); return result;
	 * }
	 * 
	 * @Override public int addGoodBadCount(Integer boardNo, String memberNick,
	 * String goodOrBad) { int result=bStore.insertGoodBadCount(session, boardNo,
	 * memberNick, goodOrBad); return result; }
	 */
	
	@Override
	public void updateLike(Integer boardNo) throws Exception{
		 bStore.updateLike(session, boardNo);
	}
	
	@Override
	public void updateLikeCancel(Integer boardNo) throws Exception{
		bStore.updateLikeCancel(session, boardNo);
	}

	
	@Override
	public void insertLike(Integer boardNo,String memberNick) throws Exception{
		bStore.insertLike(session, boardNo, memberNick);
	}
	
	@Override
	public void deleteLike(Integer boardNo,String memberNick)throws Exception{
		bStore.deleteLike(session, boardNo, memberNick);
	}
	
	@Override
	public int likeCheck(Integer boardNo,String memberNick) throws Exception{
		return bStore.likeCheck(session, boardNo, memberNick);
	}
	
	@Override
	public void updateLikeCheck(Integer boardNo,String memberNick)throws Exception{
		bStore.updateLikeCheck(session, boardNo, memberNick);
	}
	
	@Override
	public void updateLikeCheckCancel(Integer boardNo,String memberNick)throws Exception{
		bStore.updateLikeCheckCancel(session, boardNo, memberNick);
	}
}






