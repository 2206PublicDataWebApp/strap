package com.kh.strap.board.store.logic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReply;
import com.kh.strap.board.store.BoardStore;


@Repository
public class BoardStoreLogic implements BoardStore{
	// 게시글 등록
	@Override
	public int insertBoard(SqlSessionTemplate session, Board board) {
		int result = session.insert("BoardMapper.insertBoard", board);
		return result;
	}
	// 댓글 등록
	@Override
	public int insertBoardReply(SqlSessionTemplate session, BoardReply bReply) {
		int result = session.insert("BoardReplyMapper.insertBoardReply", bReply);
		return result;
	}
	// 추천 테이블  삽입
	@Override
	public void insertLike(SqlSession session, Integer boardNo,String memberNick) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberNick", memberNick);
		map.put("boardNo", boardNo);
		session.insert("BoardMapper.insertLike", map);
	}
	// 모든 게시글 카운트
	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("BoardMapper.selectTotalCount", paramMap);
		return totalCount;
	}
	// 전체 게시글 리스트 조회
	@Override
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Board> bList = session.selectList("BoardMapper.selectAllBoard",null,rowBounds);
		return bList;
	}
	// 게시글 검색
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
	// 게시글 상세페이지
	@Override
	public Board selectOneByNo(SqlSession session, Integer boardNo) {
		Board board = session.selectOne("BoardMapper.selectOneByNo", boardNo);
		return board;
	}
	// 게시글 추천 중복 방지
	@Override
	public int likeCheck(SqlSession session, Integer boardNo,String memberNick) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberNick", memberNick);
		map.put("boardNo", boardNo);
		return session.selectOne("BoardMapper.likeCheck", map);
	}
	// 자유글 리스트 조회
	@Override
	public List<Board> selectFreeBoard(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Board> bList = session.selectList("BoardMapper.selectFreeBoard",null,rowBounds);
		return bList;
	}
	// 후기글 리스트 조회
	@Override
	public List<Board> selectReviewBoard(SqlSession session, int currentPage, int boardLimit) {
		int offset = (currentPage - 1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Board> bList = session.selectList("BoardMapper.selectReviewBoard",null,rowBounds);
		return bList;
	}
	// 자유글 총 개수
	@Override
	public int selectFreeTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("BoardMapper.selectFreeTotalCount", paramMap);
		return totalCount;
	}
	// 후기글 총 개수
	@Override
	public int selectReviewTotalCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("BoardMapper.selectReviewTotalCount", paramMap);
		return totalCount;
	}
	// 댓글 리스트
	@Override
	public List<BoardReply> selectBoardReplyByNo(SqlSessionTemplate session, int boardNo) {
		List<BoardReply> bReplyList = session.selectList("BoardReplyMapper.selectBoardReply", boardNo);
		return bReplyList;
	}
	// 후기글 추천수 TOP3
	@Override
	public List<Board> selectBestRankBoard(SqlSession session) {
		return session.selectList("BoardMapper.selectBestRankBoard");
	}
	// 게시글 조회수 카운트
	 @Override 
	 public int updateBoardCount(SqlSessionTemplate session, Integer boardNo) { 
		 return session.update("BoardMapper.updateBoardCount", boardNo);
	}
	// 게시글 테이블 추천 +1
	@Override
	public void updateLike(SqlSession session, Integer boardNo) throws Exception{
		session.update("BoardMapper.updateLike", boardNo);
	}
	// 게시글 테이블 추천 -1	
	@Override
	public void updateLikeCancel(SqlSession session, Integer boardNo) throws Exception{
		session.update("BoardMapper.updateLikeCancel", boardNo);
	}
	// 추천 테이블 구분자 1
	@Override
	public void updateLikeCheck(SqlSession session, Integer boardNo,String memberNick) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberNick", memberNick);
		map.put("boardNo", boardNo);
		session.update("BoardMapper.updateLikeCheck", map);
	}
	// 추천 테이블 구분자 0		
	@Override
	public void updateLikeCheckCancel(SqlSession session, Integer boardNo,String memberNick) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberNick", memberNick);
		map.put("boardNo", boardNo);
		session.update("BoardMapper.updateLikeCheckCancel", map);
	}
	// 게시글 수정
	@Override
	public int updateOneByNo(SqlSessionTemplate session, Board board) {
		int result = session.update("BoardMapper.updateBoard", board);
		return result;
	}
	// 댓글 삭제
	@Override
	public int deleteBoardReply(SqlSessionTemplate session, BoardReply bReply) {
		return session.update("BoardReplyMapper.deleteBoardReply", bReply);
	}
	// 게시글 삭제
	@Override
	public int deleteOneByNo(SqlSession session, int boardNo) {
		int result = session.delete("BoardMapper.deleteBoard", boardNo);
		return result;
	}
	// 추천 테이블 삭제
	@Override
	public void deleteLike(SqlSession session, Integer boardNo,String memberNick)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberNick", memberNick);
		map.put("boardNo", boardNo);
		session.delete("BoardMapper.deleteLike", map);
	}
}

















