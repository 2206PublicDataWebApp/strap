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

	// 댓글 등록
	public int insertReply(SqlSession session, BoardReply bReply);
	
	// 댓글 전체조회
	public List<BoardReply> selectAllReply(SqlSession session, int boardNo);
	
	// 댓글 수정
	public int modifyReply(SqlSession session, BoardReply bReply);
	
	// 댓글 삭제
	public int deleteReply(SqlSession session, Integer replyNo);
	
	public int insertReReply(SqlSession session, BoardReReply bReReply);
	
	public List<BoardReReply> selectAllReReply(SqlSession session, Map<String, Object> map);
}















