package com.kh.strap.qna.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.qna.service.QnaService;
import com.kh.strap.qna.store.logic.QnaStoreLogic;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private QnaStoreLogic qStore;
	
	
}
