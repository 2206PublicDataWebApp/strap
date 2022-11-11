package com.kh.strap.board.service.logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReReply;
import com.kh.strap.board.domain.BoardReply;
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

	// 게시글 수정
	@Override
	public int modifyOneByNo(Board board) {
		int result = bStore.updateOneByNo(session, board);
		return result;
	}

	@Override
	public int removeOneByNo(int boardNo) {
		int result = bStore.deleteOneByNo(session, boardNo);
		return result;
	}

	@Override
	public List<Board> printFreeBoard(int currentPage, int boardLimit) {
		List<Board> bList = bStore.selectFreeBoard(session, currentPage, boardLimit);
		return bList;
	}

	@Override
	public List<Board> printReviewBoard(int currentPage, int boardLimit) {
		List<Board> bList = bStore.selectReviewBoard(session, currentPage, boardLimit);
		return bList;
	}

	@Override
	public int getFreeTotalCount(String searchCondition, String searchValue) {
		int totalCount = bStore.selectFreeTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public int getReviewTotalCount(String searchCondition, String searchValue) {
		int totalCount = bStore.selectReviewTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public int registerBoardReply(BoardReply bReply) {
		int result = bStore.insertBoardReply(session, bReply);
		return result;
	}
	
	@Override
	public List<BoardReply> printBoardReplyByNo(int boardNo) {
		List<BoardReply> bReplyList = bStore.selectBoardReplyByNo(session, boardNo);
		return bReplyList;
	}

	@Override
	public int removeBoardReply(BoardReply bReply) {
		return bStore.deleteBoardReply(session, bReply);
	}

	@Override
	public int modifyBoardReply(BoardReply bReply) {
		return bStore.updateBoardReply(session, bReply);
	}

	@Override
	public List<Board> printBestRankBoard() {
		List<Board> bList = bStore.selectBestRankBoard(session);
		return bList;
	}
}






