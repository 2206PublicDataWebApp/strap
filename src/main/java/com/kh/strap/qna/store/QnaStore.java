package com.kh.strap.qna.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.qna.domain.Qna;

public interface QnaStore {
	public int insertQna(SqlSession session, Qna qna);
	public List<Qna> selectAllQna(SqlSession session, String memberId);
	public int updateQna(SqlSession session, Qna qna);
	public Qna selectOneById(SqlSession session, Qna qna);
	public int deleteQna(SqlSession session, Integer qnaNo);
}
