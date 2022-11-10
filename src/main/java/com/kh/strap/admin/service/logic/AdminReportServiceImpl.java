package com.kh.strap.admin.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.domain.AdminQna;
import com.kh.strap.admin.service.AdminQnaService;
import com.kh.strap.admin.service.AdminReportService;
import com.kh.strap.admin.store.AdminQnaStore;

@Service
public class AdminReportServiceImpl implements AdminReportService{
	@Autowired
	private SqlSession session;
	@Autowired
	private AdminQnaStore aqStore;
	
	
	@Override
	public List<AdminQna> printAllAdminQnaList(int currentPage, int noticeLimit) {
		List<AdminQna> aqList = aqStore.selectAllAdminQnaList(session, currentPage, noticeLimit);
		return aqList;
	}


	@Override
	public List<AdminQna> printAllByValue(String searchCondition, String searchValue, int currentPage,
			int qnaLimit) {
		List<AdminQna> aqList = aqStore.selectAllByValue(session, searchCondition, searchValue, currentPage, qnaLimit);
		return aqList;
	}


	@Override
	public List<AdminQna> printAllBySort(String sortCondition, String sortValue, String qnaCode, int currentPage,
			int qnaSortLimit) {
		List<AdminQna> aqList = aqStore.selectAllBySort(session, sortCondition, sortValue, qnaCode, currentPage, qnaSortLimit);
		return aqList;
	}


	@Override
	public int getTotalCount(String searchCondition, String searchValue, String qnaCode) {
		int result = aqStore.selectTotalCount(session, searchCondition, searchValue, qnaCode);
		return result;
	}


	@Override
	public AdminQna printOneByNo(Integer qnaNo) {
		AdminQna adminQna = aqStore.selectOneByNo(session, qnaNo);
		return adminQna;
	}


	@Override
	public int registAdminQna(AdminQna adminQna) {
		int result = aqStore.updateAdminQna(session, adminQna);
		return result;
	}
	
}
