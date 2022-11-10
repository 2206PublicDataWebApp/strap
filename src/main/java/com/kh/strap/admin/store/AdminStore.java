package com.kh.strap.admin.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;

public interface AdminStore {
	public String selectAdminPwdById(SqlSession session, String memberId);
	public Member selectAdminById(SqlSession session, String memberId);
	public int selectAllTotalQna(SqlSession session);
	public int selectAllqnaCount(SqlSession session);
	public int selectAllqnaAnswer(SqlSession session);
	public int selectTodayAnswer(SqlSession session);
	public int selectAllTotalReport(SqlSession session);
	public int selectAllReportCount(SqlSession session);
	public int selectAllReportProcess(SqlSession session);
	public int selectTodayProcess(SqlSession session);
}
