package com.kh.strap.qna.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.qna.domain.Qna;
import com.kh.strap.qna.service.QnaService;
import com.kh.strap.qna.store.logic.QnaStoreLogic;

@Service("QnaServiceImpl")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private QnaStoreLogic qStore;
	
	@Override
	public int registerQna(Qna qna) {
		int result = qStore.insertQna(session, qna);
		return result;
	}

	@Override
	public List<Qna> printAllQna(String memberId) {
		List<Qna> qList = qStore.selectAllQna(session, memberId);
		return qList;
	}

	@Override
	public int modifyQna(Qna qna) {
		int result = qStore.updateQna(session, qna);
		return result;
	}

	@Override
	public Qna printOneById(Qna qna) {
		qna = qStore.selectOneById(session, qna);
		return qna;
	}

	@Override
	public int removeQna(Integer qnaNo) {
		int result = qStore.deleteQna(session, qnaNo);
		return result;
	}
	
	
}
