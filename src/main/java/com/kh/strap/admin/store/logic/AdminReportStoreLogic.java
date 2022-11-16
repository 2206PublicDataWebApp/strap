package com.kh.strap.admin.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.domain.AdminReport;
import com.kh.strap.admin.store.AdminReportStore;


@Repository
public class AdminReportStoreLogic implements AdminReportStore{

	@Override
	public List<AdminReport> selectAllAdminReportList(SqlSession session, int currentPage, int noticeLimit) {
		int offset = (currentPage-1)*noticeLimit;
		RowBounds rowBounds = new RowBounds(offset, noticeLimit);
		List<AdminReport> arList = session.selectList("AdminReportMapper.selectAllAdminReportList", null, rowBounds);
		return arList;
	}

	@Override
	public List<AdminReport> selectAllByValue(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int reportLimit) {
		int offset = (currentPage-1) * reportLimit;
		RowBounds rowBounds = new RowBounds(offset, reportLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<AdminReport> arList = session.selectList("AdminReportMapper.selectAllByValue", paramMap, rowBounds);
		return arList;
	}

	@Override
	public List<AdminReport> selectAllBySort(SqlSession session, String sortCondition, String sortValue, String contentsCode,
			int currentPage, int reportSortLimit) {
		int offset = (currentPage-1) * reportSortLimit;
		RowBounds rowBounds = new RowBounds(offset, reportSortLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("sortCondition", sortCondition);
		paramMap.put("sortValue", sortValue);
		paramMap.put("contentsCode", contentsCode);
		List<AdminReport> arList = session.selectList("AdminReportMapper.selectAllBySort", paramMap, rowBounds);
		return arList;
	}

	@Override
	public List<AdminReport> selectAllByUnsolvedReport(SqlSession session, int currentPage, int unsolvedQnaLimit) {
		int offset = (currentPage-1)*unsolvedQnaLimit;
		RowBounds rowBounds = new RowBounds(offset, unsolvedQnaLimit);
		List<AdminReport> arList = session.selectList("AdminReportMapper.selectAllByUnsolvedReport", null, rowBounds);
		return arList;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String contentsCode) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		paramMap.put("contentsCode", contentsCode);
		int totalCount = session.selectOne("AdminReportMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public int updateReportProcess(SqlSession session, AdminReport adminReport) {
		int result = session.update("AdminReportMapper.updateReportProcess", adminReport);
		return result;
	}

	@Override
	public int selectAllReportCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("AdminReportMapper.selectAllReportCount", paramMap);
		return totalCount;
	}

	@Override
	public AdminReport selectOneByNo(SqlSession session, Integer reportNo) {
		AdminReport adminReport = session.selectOne("AdminReportMapper.selectOneByNo", reportNo); 
		return adminReport;
	}

	

}
