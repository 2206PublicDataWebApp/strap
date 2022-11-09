package com.kh.strap.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.admin.domain.AdminQna;

public interface AdminQnaStore {
	public List<AdminQna> selectAllAdminQnaList(SqlSession session, int currentPage, int noticeLimit);
	public List<AdminQna> selectAllByValue(SqlSession session, String searchCondition, String searchValue, int currentPage, int qnaLimit);
	public List<AdminQna> selectAllBySort(SqlSession session, String sortCondition, String  sortValue, String  qnaCode, int currentPage, int qnaSortLimit);
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String qnaCode);
	public AdminQna selectOneByNo(SqlSession session, Integer qnaNo);
}
