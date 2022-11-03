package com.kh.strap.report.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.report.domain.Report;

public interface ReportStore {
	public int insertReport(SqlSession session, Report report);
	public int insertReport2(SqlSession session, Report report);
}
