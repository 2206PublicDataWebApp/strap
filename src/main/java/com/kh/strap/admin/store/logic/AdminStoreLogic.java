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

	@Override
	public int selectAllTotalQna(SqlSession session) {
		int totalQna = session.selectOne("AdminMapper.selectAllTotalQna");
		return totalQna;
	}

	@Override
	public int selectAllqnaCount(SqlSession session) {
		int qnaCount = session.selectOne("AdminMapper.selectAllqnaCount");
		return qnaCount;
	}

	@Override
	public int selectAllqnaAnswer(SqlSession session) {
		int qnaAnswer = session.selectOne("AdminMapper.selectAllqnaAnswer");
		return qnaAnswer;
	}

	@Override
	public int selectTodayAnswer(SqlSession session) {
		int todayQnaAnswer = session.selectOne("AdminMapper.selectTodayAnswer");
		return todayQnaAnswer;
	}

	

}
