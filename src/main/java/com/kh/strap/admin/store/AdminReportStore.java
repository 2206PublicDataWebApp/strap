package com.kh.strap.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.admin.domain.AdminReport;

public interface AdminReportStore {
	public List<AdminReport> selectAllAdminReportList(SqlSession session, int currentPage, int noticeLimit);
	public List<AdminReport> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage, int ReportLimit);
	public List<AdminReport> selectAllBySort(SqlSession session, String sortCondition, String  sortValue, String  contentsCode, int currentPage, int ReportSortLimit);
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String contentsCode);
	public AdminReport selectOneByNo(SqlSession session, Integer ReportNo);
	
}
