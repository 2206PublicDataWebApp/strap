package com.kh.strap.qna.store.logic;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<Qna> selectAllQna(SqlSession session, String memberId) {
		List<Qna> qList = session.selectList("QnaMapper.selectAllQna", memberId);
		return qList;
	}

	@Override
	public int updateQna(SqlSession session, Qna qna) {
		int result = session.update("QnaMapper.updateQna", qna);
		return result;
	}

	@Override
	public Qna selectOneById(SqlSession session, Qna qna) {
		qna = session.selectOne("QnaMapper.selectOneQna", qna);
		return qna;
	}

}
