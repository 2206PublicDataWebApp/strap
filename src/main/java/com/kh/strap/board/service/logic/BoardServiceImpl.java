package com.kh.strap.board.service.logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReply;
import com.kh.strap.board.service.BoardService;
import com.kh.strap.board.store.logic.BoardStoreLogic;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private BoardStoreLogic bStore;

	// 게시글 등록
	@Override
	public int registerBoard(Board board) {
		int result = bStore.insertBoard(session, board);
		return result;
	}
	// 댓글 등록
	@Override
	public int registerBoardReply(BoardReply bReply) {
		int result = bStore.insertBoardReply(session, bReply);
		return result;
	}
	// 추천 테이블 삽입
	@Override
	public void insertLike(Integer boardNo,String memberNick) throws Exception{
		bStore.insertLike(session, boardNo, memberNick);
	}
	// 모든 게시글 총 개수
	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = bStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}
	// 전체 게시글 리스트 조회
	public List<Board> printAllBoard(int currentPage, int boardLimit) {
		List<Board> bList = bStore.selectAllBoard(session, currentPage, boardLimit);
		return bList;
	}
	// 게시글 검색
	@Override
	public List<Board> printSearchBoard(String searchCondition, String searchValue, int currentPage, int boardLimit) {
		 List<Board> bList = bStore.selectSearchBoard(session,searchCondition,searchValue,currentPage,boardLimit);
		 return bList;
	}
	// 게시글 상세페이지
	@Override
	public Board printOneByNo(Integer boardNo) {
		Board board = bStore.selectOneByNo(session, boardNo);
		return board;
	}
	// 게시글 추천 중복 방지
	@Override
	public int likeCheck(Integer boardNo,String memberNick) throws Exception{
		return bStore.likeCheck(session, boardNo, memberNick);
	}
	// 자유글 리스트 조회
	@Override
	public List<Board> printFreeBoard(int currentPage, int boardLimit) {
		List<Board> bList = bStore.selectFreeBoard(session, currentPage, boardLimit);
		return bList;
	}
	// 후기글 리스트 조회
	@Override
	public List<Board> printReviewBoard(int currentPage, int boardLimit) {
		List<Board> bList = bStore.selectReviewBoard(session, currentPage, boardLimit);
		return bList;
	}
	// 자유글 총 개수
	@Override
	public int getFreeTotalCount(String searchCondition, String searchValue) {
		int totalCount = bStore.selectFreeTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}
	// 후기글 총 개수
	@Override
	public int getReviewTotalCount(String searchCondition, String searchValue) {
		int totalCount = bStore.selectReviewTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}
	// 댓글 리스트
	@Override
	public List<BoardReply> printBoardReplyByNo(int boardNo) {
		List<BoardReply> bReplyList = bStore.selectBoardReplyByNo(session, boardNo);
		return bReplyList;
	}
	// 후기글 추천수 TOP3
	@Override
	public List<Board> printBestRankBoard() {
		return bStore.selectBestRankBoard(session);
	}
	// 게시글 조회수 카운트
	public int updateBoardCount(Integer boardNo) {
		int result = bStore.updateBoardCount(session, boardNo);
		return result;
	}
	// 게시글 테이블 추천 +1
	@Override
	public void updateLike(Integer boardNo) throws Exception{
		 bStore.updateLike(session, boardNo);
	}
	// 게시글 테이블 추천 -1
	@Override
	public void updateLikeCancel(Integer boardNo) throws Exception{
		bStore.updateLikeCancel(session, boardNo);
	}
	// 추천 테이블 구분자 1
	@Override
	public void updateLikeCheck(Integer boardNo,String memberNick)throws Exception{
		bStore.updateLikeCheck(session, boardNo, memberNick);
	}
	// 추천 테이블 구분자 0
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
	// 댓글 삭제
	@Override
	public int removeBoardReply(BoardReply bReply) {
		return bStore.deleteBoardReply(session, bReply);
	}
	// 게시글 삭제
	@Override
	public int removeOneByNo(int boardNo) {
		int result = bStore.deleteOneByNo(session, boardNo);
		return result;
	}
	// 추천 테이블 삭제
	@Override
	public void deleteLike(Integer boardNo,String memberNick)throws Exception{
		bStore.deleteLike(session, boardNo, memberNick);
	}
}






