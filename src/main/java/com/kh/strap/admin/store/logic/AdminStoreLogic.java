package com.kh.strap.admin.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.store.AdminStore;
import com.kh.strap.member.domain.Member;

@Repository
public class AdminStoreLogic implements AdminStore{

	@Override
	public String selectAdminPwdById(SqlSession session, String memberId) {
		String aOne = session.selectOne("AdminMapper.selectAdminPwdById", memberId);
		return aOne;
	}

	@Override
	public Member selectAdminById(SqlSession session, String memberId) {
		Member mOne = session.selectOne("AdminMapper.selectAdminById", memberId);
		return mOne;
	}

	

}
