package com.kh.strap.report.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.report.domain.Report;
import com.kh.strap.report.service.ReportService;
import com.kh.strap.report.store.ReportStore;

@Service("ReportServiceImpl")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private ReportStore rStore;
	
	@Override
	public int registReport(Report report) {
		int result = rStore.insertReport(session, report);
		return result;
	}

	@Override
	public int registReport2(Report report) {
		int result = rStore.insertReport2(session, report);
		return result;
	}
}