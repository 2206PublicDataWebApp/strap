package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.admin.domain.AdminReport;

public interface AdminReportService {
	public List<AdminReport> printAllAdminReportList(int currentPage, int noticeLimit);
	public List<AdminReport> printAllByValue(String searchCondition, String searchValue, int currentPage, int reportLimit);
	public List<AdminReport> printAllBySort(String sortCondition, String  sortValue, String  contentsCode, int currentPage, int reportSortLimit);
	public int getTotalCount(String searchCondition, String searchValue, String contentsCode);
	public int registReportProcess(AdminReport adminReport);
	public AdminReport printOneByNo(Integer reportNo);
	
}
