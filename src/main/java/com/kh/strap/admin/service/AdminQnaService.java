package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.admin.domain.AdminQna;

public interface AdminQnaService {
	public List<AdminQna> printAllAdminQnaList(int currentPage, int noticeLimit);
	public List<AdminQna> printAllByValue(String searchCondition, String searchValue, int currentPage, int qnaLimit);
	public List<AdminQna> printAllBySort(String sortCondition, String sortValue, String qnaCode, int currentPage, int qnaSortLimit);
	public List<AdminQna> printAllByUnsolvedQna(String searchCondition, String searchValue, int currentPage, int  unsolvedQnaLimit);
	public List<AdminQna> printAllByUnsolvedQna(int currentPage,int unsolvedQnaLimit);
	public int getTotalCount(String searchCondition, String searchValue, String qnaCode);
	public int printAllqnaCount(String searchCondition, String searchValue);
	public AdminQna printOneByNo(Integer qnaNo);
	public int registAdminQna(AdminQna adminQna);
}
