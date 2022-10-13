package com.kh.strap.admin.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.domain.Admin;
import com.kh.strap.admin.store.AdminStore;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public Admin selectLoginAdmin(SqlSession session, Admin admin) {
		Admin aOne = session.selectOne("AdminMapper.selectLoginAdmin", admin);
		return aOne;
	}

	

}
