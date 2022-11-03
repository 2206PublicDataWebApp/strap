package com.kh.strap.report.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.report.domain.Report;
import com.kh.strap.report.store.ReportStore;

@Repository("ReportStoreLogic")
public class ReportStoreLogic implements ReportStore{

	@Override
	public int insertReport(SqlSession session, Report report) {
		int result = session.insert("ReportMapper.insertReport", report);
		return result;
	}

	@Override
	public int insertReport2(SqlSession session, Report report) {
		int result = session.insert("ReportMapper.insertReport2", report);
		return result;
	}

}
