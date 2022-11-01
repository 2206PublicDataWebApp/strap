package com.kh.strap.qna.service.logic;

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
	
	
}
