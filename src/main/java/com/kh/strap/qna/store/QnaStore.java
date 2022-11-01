package com.kh.strap.qna.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.qna.domain.Qna;

public interface QnaStore {
	public int insertQna(SqlSession session, Qna qna);
}
