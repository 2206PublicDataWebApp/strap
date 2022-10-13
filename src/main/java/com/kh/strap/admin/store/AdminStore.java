package com.kh.strap.admin.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.admin.domain.Admin;

public interface AdminStore {
	public Admin selectLoginAdmin(SqlSession session, Admin admin);
}
