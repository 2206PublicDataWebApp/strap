package com.kh.strap.board.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReReply;
import com.kh.strap.board.domain.BoardReply;
import com.kh.strap.board.store.BoardStore;


@Repository
public class BoardStoreLogic implements BoardStore{

	@Override
	public int insertBoard(SqlSessionTemplate session, Board board) {
		int result = session.insert("BoardMapper.insertBoard", board);
		return result;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("BoardMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Board> bList = session.selectList("BoardMapper.selectAllBoard",null,rowBounds);
		return bList;
	}

	public List<Board> selectSearchBoard(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<Board> bList = session.selectList("BoardMapper.selectSearchBoard",paramMap,rowBounds);
		return bList;
	}

	@Override
	public Board selectOneByNo(SqlSession session, Integer boardNo) {
		Board board = session.selectOne("BoardMapper.selectOneByNo", boardNo);
		return board;
	}

	 @Override public int updateBoardCount(SqlSessionTemplate session, Integer boardNo) { 
		 return session.update("BoardMapper.updateBoardCount", boardNo);
	 }

	 
	 @Override
		public void updateLike(SqlSession session, Integer boardNo) throws Exception{
		 session.update("BoardMapper.updateLike", boardNo);
		}
		
		@Override
		public void updateLikeCancel(SqlSession session, Integer boardNo) throws Exception{
			session.update("BoardMapper.updateLikeCancel", boardNo);

		}

		
		@Override
		public void insertLike(SqlSession session, Integer boardNo,String memberNick) throws Exception{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberNick", memberNick);
			map.put("boardNo", boardNo);
			session.insert("BoardMapper.insertLike", map);
		}
		
		@Override
		public void deleteLike(SqlSession session, Integer boardNo,String memberNick)throws Exception{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberNick", memberNick);
			map.put("boardNo", boardNo);
			session.delete("BoardMapper.deleteLike", map);
		}
		
		@Override
		public int likeCheck(SqlSession session, Integer boardNo,String memberNick) throws Exception{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberNick", memberNick);
			map.put("boardNo", boardNo);
			return session.selectOne("BoardMapper.likeCheck", map);
		}
		
		@Override
		public void updateLikeCheck(SqlSession session, Integer boardNo,String memberNick) throws Exception{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberNick", memberNick);
			map.put("boardNo", boardNo);
			session.update("BoardMapper.updateLikeCheck", map);
			
		}
				
		@Override
		public void updateLikeCheckCancel(SqlSession session, Integer boardNo,String memberNick) throws Exception{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberNick", memberNick);
			map.put("boardNo", boardNo);
			session.update("BoardMapper.updateLikeCheckCancel", map);
		}

		@Override
		public int updateOneByNo(SqlSessionTemplate session, Board board) {
			int result = session.update("BoardMapper.updateBoard", board);
			return result;
		}

		@Override
		public int deleteOneByNo(SqlSession session, int boardNo) {
			int result = session.delete("BoardMapper.deleteBoard", boardNo);
			return result;
		}

		// 댓글 등록
		@Override
		public int insertReply(SqlSession session, BoardReply bReply) {
			int result = session.insert("BoardMapper.insertReply", bReply);
			return result;
		}

		// 댓글 리스트
		@Override
		public List<BoardReply> selectAllReply(SqlSession session, int boardNo) {
			List<BoardReply> brList = session.selectList("BoardMapper.selectAllReply", boardNo);
			return brList;
		}

		@Override
		public int modifyReply(SqlSession session, BoardReply bReply) {
			int result = session.update("BoardMapper.modifyReply", bReply);
			return result;
		}

		@Override
		public int deleteReply(SqlSession session, Integer replyNo) {
			int result = session.delete("BoardMapper.deleteReply", replyNo);
			return result;
		}

		@Override
		public int insertReReply(SqlSession session, BoardReReply bReReply) {
			int result = session.insert("BoardMapper.insertReReply", bReReply);
			return result;
		}

		@Override
		public List<BoardReReply> selectAllReReply(SqlSession session, Map<String, Object> map) {
			List<BoardReReply> bReList = session.selectList("BoardMapper.selectAllReReply", map);
			return bReList;
		}

}

















