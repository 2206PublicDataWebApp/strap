package com.kh.strap.admin.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.service.AdminService;
import com.kh.strap.admin.store.logic.AdminStoreLogic;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private AdminStoreLogic aStore;
	
	
}
