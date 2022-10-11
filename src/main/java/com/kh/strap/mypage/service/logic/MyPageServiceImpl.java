package com.kh.strap.mypage.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.mypage.service.MyPageService;
import com.kh.strap.mypage.store.logic.MyPageStoreLogic;


@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MyPageStoreLogic mpStore;
	
	
}
