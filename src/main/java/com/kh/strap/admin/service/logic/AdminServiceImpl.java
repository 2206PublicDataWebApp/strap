package com.kh.strap.admin.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.service.AdminService;
import com.kh.strap.admin.store.AdminStore;
import com.kh.strap.member.domain.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private AdminStore aStore;
	
	@Override
	public String adminPwdById(String memberId) {
		String aOne = aStore.selectAdminPwdById(session, memberId);
		return aOne;
	}

	@Override
	public Member adminById(String memberId) {
		Member mOne = aStore.selectAdminById(session, memberId);
		return mOne;
	}

	@Override
	public int printAllTotalQna() {
		int totalQna = aStore.selectAllTotalQna(session);
		return totalQna;
	}

	@Override
	public int printAllqnaCount() {
		int qnaCount = aStore.selectAllqnaCount(session);
		return qnaCount;
	}

	@Override
	public int printAllqnaAnswer() {
		int qnaAnswer = aStore.selectAllqnaAnswer(session);
		return qnaAnswer;
	}

	@Override
	public int printTodayAnswer() {
		int todayQnaAnswer = aStore.selectTodayAnswer(session);
		return todayQnaAnswer;
	}

	@Override
	public int printAllTotalReport() {
		int totalReport = aStore.selectAllTotalReport(session);
		return totalReport;
	}

	@Override
	public int printAllReportCount() {
		int ReportCount = aStore.selectAllReportCount(session);
		return ReportCount;
	}

	@Override
	public int printAllReportProcess() {
		int ReportProcess = aStore.selectAllReportProcess(session);
		return ReportProcess;
	}

	@Override
	public int printTodayProcess() {
		int todayReportProcess = aStore.selectTodayProcess(session);
		return todayReportProcess;
	}
	
	
	
}
