package com.kh.strap.board.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.strap.board.domain.Board;
import com.kh.strap.board.domain.BoardReply;

public interface BoardStore {
	// 게시글 등록
	public int insertBoard(SqlSessionTemplate session, Board board);
	// 댓글 등록
	public int insertBoardReply(SqlSessionTemplate session, BoardReply bReply);
	// 추천 테이블  삽입
	public void insertLike(SqlSession session, Integer boardNo, String memberNick) throws Exception;
	// 모든 게시글 카운트
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	// 전체 게시글 리스트 조회
	public List<Board> selectAllBoard(SqlSession session, int currentPage, int boardLimit);
	// 게시글 검색
	public List<Board> selectSearchBoard(SqlSession session, String searchCondition, String searchValue, int currentPage, int boardLimit);
	// 게시글 상세페이지
	public Board selectOneByNo(SqlSession session, Integer boardNo);
	// 게시글 추천 중복 방지
	public int likeCheck(SqlSession session, Integer boardNo, String memberNick) throws Exception;
	// 자유글 리스트 조회
	public List<Board> selectFreeBoard(SqlSession session, int currentPage, int boardLimit);
	// 후기글 리스트 조회
	public List<Board> selectReviewBoard(SqlSession session, int currentPage, int boardLimit);
	// 자유글 총 개수
	public int selectFreeTotalCount(SqlSession session, String searchCondition, String searchValue);
	// 후기글 총 개수
	public int selectReviewTotalCount(SqlSession session, String searchCondition, String searchValue);
	// 댓글 리스트
	public List<BoardReply> selectBoardReplyByNo(SqlSessionTemplate session,int boardNo);
	// 후기글 추천수 TOP3
	public List<Board> selectBestRankBoard(SqlSession session);
	// 게시글 조회수 카운트
	public int updateBoardCount(SqlSessionTemplate session, Integer boardNo);
	// 게시글 테이블 추천 +1
	public void updateLike(SqlSession session, Integer boardNo) throws Exception;
	// 게시글 테이블 추천 -1
	public void updateLikeCancel(SqlSession session, Integer boardNo) throws Exception;
	// 추천 테이블 구분자 1
	public void updateLikeCheck(SqlSession session, Integer boardNo, String memberNick) throws Exception;
	// 추천 테이블 구분자 0
	public void updateLikeCheckCancel(SqlSession session, Integer boardNo, String memberNick) throws Exception;
	// 게시글 수정
	public int updateOneByNo(SqlSessionTemplate session,Board board);
	// 댓글 삭제
	public int deleteBoardReply(SqlSessionTemplate session,BoardReply bReply);
	// 게시글 삭제
	public int deleteOneByNo(SqlSession session, int boardNo);
	// 추천 테이블 삭제
	public void deleteLike(SqlSession session, Integer boardNo, String memberNick) throws Exception;
}















