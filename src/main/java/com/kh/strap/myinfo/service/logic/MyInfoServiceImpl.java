package com.kh.strap.myinfo.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.myinfo.service.MyInfoService;
import com.kh.strap.myinfo.store.logic.MyInfoStoreLogic;


@Service
public class MyInfoServiceImpl implements MyInfoService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MyInfoStoreLogic miStore;
	
	
}
