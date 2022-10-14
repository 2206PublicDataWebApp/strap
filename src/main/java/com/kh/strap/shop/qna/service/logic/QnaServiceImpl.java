package com.kh.strap.shop.qna.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.shop.qna.service.QnaService;
import com.kh.strap.shop.qna.store.QnaStore;

@Service("ShopQnaServiceImpl")
public class QnaServiceImpl implements QnaService {
	@Autowired
	QnaStore qStore;
	@Autowired
	SqlSession session;
}
