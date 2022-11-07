package com.kh.strap.board.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReReply;
import com.kh.strap.board.domain.BoardReply;

public interface BoardStore {
	public int insertBoard(SqlSessionTemplate session, Board board);
	
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit);
	
	public List<Board> selectSearchBoard(SqlSession session, String searchCondition, String searchValue, int currentPage, int boardLimit);
	
	public Board selectOneByNo(SqlSession session, Integer boardNo);
	
	public int updateBoardCount(SqlSessionTemplate session, Integer boardNo);

	void updateLike(SqlSession session, Integer boardNo) throws Exception;

	void updateLikeCancel(SqlSession session, Integer boardNo) throws Exception;

	void insertLike(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	void deleteLike(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	int likeCheck(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	void updateLikeCheck(SqlSession session, Integer boardNo, String memberNick) throws Exception;

	void updateLikeCheckCancel(SqlSession session, Integer boardNo, String memberNick) throws Exception;
	
	public int updateOneByNo(SqlSessionTemplate session,Board board);
	
	public int deleteOneByNo(SqlSession session, int boardNo);
	
	public List<Board> selectFreeBoard(SqlSession session, int currentPage, int boardLimit);
	
	public List<Board> selectReviewBoard(SqlSession session, int currentPage, int boardLimit);
	
	public int selectFreeTotalCount(SqlSession session, String searchCondition, String searchValue);
	
	public int selectReviewTotalCount(SqlSession session, String searchCondition, String searchValue);
	
	public int insertBoardReply(SqlSessionTemplate session, BoardReply bReply);
	
	public List<BoardReply> selectBoardReplyByNo(SqlSessionTemplate session,int boardNo);
	
	public int deleteBoardReply(SqlSessionTemplate session,BoardReply bReply);
	public int updateBoardReply(SqlSessionTemplate session,BoardReply bReply);

}















