package com.kh.strap.admin.service;

import com.kh.strap.member.domain.Member;

public interface AdminService {
	public String adminPwdById(String memberId);
	public Member adminById(String memberId);
	public int printAllTotalQna();
	public int printAllqnaCount();
	public int printAllqnaAnswer();
	public int printTodayAnswer();
	public int printAllTotalReport();
	public int printAllReportCount();
	public int printAllReportProcess();
	public int printTodayProcess();
}
