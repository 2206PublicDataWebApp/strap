package com.kh.strap.admin.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.domain.AdminReport;
import com.kh.strap.admin.service.AdminReportService;
import com.kh.strap.admin.store.AdminReportStore;

@Service
public class AdminReportServiceImpl implements AdminReportService{
	@Autowired
	private SqlSession session;
	@Autowired
	private AdminReportStore arStore;
	
	
	@Override
	public List<AdminReport> printAllAdminReportList(int currentPage, int noticeLimit) {
		List<AdminReport> arList = arStore.selectAllAdminReportList(session, currentPage, noticeLimit);
		return arList;
	}


	@Override
	public List<AdminReport> printAllByValue(String searchCondition, String searchValue, int currentPage,
			int reportLimit) {
		List<AdminReport> arList = arStore.selectAllByValue(session, searchCondition, searchValue, currentPage, reportLimit);
		return arList;
	}


	@Override
	public List<AdminReport> printAllBySort(String sortCondition, String sortValue, String contentsCode, int currentPage,
			int reportSortLimit) {
		List<AdminReport> arList = arStore.selectAllBySort(session, sortCondition, sortValue, contentsCode, currentPage, reportSortLimit);
		return arList;
	}


	@Override
	public List<AdminReport> printAllByUnsolvedReport(int currentPage, int unsolvedQnaLimit) {
		List<AdminReport> arList = arStore.selectAllByUnsolvedReport(session, currentPage, unsolvedQnaLimit);
		return arList;
	}


	@Override
	public int getTotalCount(String searchCondition, String searchValue, String contentsCode) {
		int result = arStore.selectTotalCount(session, searchCondition, searchValue, contentsCode);
		return result;
	}


	@Override
	public int registReportProcess(AdminReport adminReport) {
		int result = arStore.updateReportProcess(session, adminReport);
		return result;
	}


	@Override
	public int printAllReportCount(String searchCondition, String searchValue) {
		int result = arStore.selectAllReportCount(session, searchCondition, searchValue);
		return result;
	}


	@Override
	public AdminReport printOneByNo(Integer reportNo) {
		AdminReport adminReport = arStore.selectOneByNo(session, reportNo);
		return adminReport;
	}


	
	
}
