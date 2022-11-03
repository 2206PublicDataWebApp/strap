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
	
	// 댓글 등록
	@Override
	public int registerReply(BoardReply bReply) {
		int result = bStore.insertReply(session, bReply);
		return result;
	}

	// 댓글 리스트
	@Override
	public List<BoardReply> printAllReply(int boardNo) {
		List<BoardReply> brList = bStore.selectAllReply(session, boardNo);
		return brList;
	}

	@Override
	public int modifyReply(BoardReply bReply) {
		int result = bStore.modifyReply(session, bReply);
		return result;
	}

	@Override
	public int deleteReply(Integer replyNo) {
		int result = bStore.deleteReply(session, replyNo);
		return result;
	}

	@Override
	public int registerReReply(BoardReReply bReReply) {
		int result = bStore.insertReReply(session, bReReply);
		return result;
	}

	@Override
	public List<BoardReReply> printAllReReply(Map<String, Object> map) {
		List<BoardReReply> bReList = bStore.selectAllReReply(session,map);
		return bReList;
	}

}






