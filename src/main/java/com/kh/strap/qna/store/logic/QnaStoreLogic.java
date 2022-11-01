package com.kh.strap.qna.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.qna.domain.Qna;
import com.kh.strap.qna.store.QnaStore;

@Repository("QnaStoreLogic")
public class QnaStoreLogic implements QnaStore{

	@Override
	public int insertQna(SqlSession session, Qna qna) {
		int result = session.insert("QnaMapper.insertQna",qna);
		return result;
	}

}
