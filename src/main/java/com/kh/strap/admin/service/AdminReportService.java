package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.admin.domain.AdminReport;

public interface AdminReportService {
	public List<AdminReport> printAllAdminReportList(int currentPage, int noticeLimit);
	public List<AdminReport> printAllByValue(String searchCondition, String searchValue, int currentPage, int ReportLimit);
	public List<AdminReport> printAllBySort(String sortCondition, String  sortValue, String  contentsCode, int currentPage, int ReportSortLimit);
	public int getTotalCount(String searchCondition, String searchValue, String contentsCode);
	public AdminReport printOneByNo(Integer ReportNo);
	
}
