package com.kh.strap.admin.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.strap.admin.store.AdminQnaStore;


public class AdminQnaServiceImpl {
	@Autowired
	private SqlSession session;
	@Autowired
	private AdminQnaStore aqStore;
}
