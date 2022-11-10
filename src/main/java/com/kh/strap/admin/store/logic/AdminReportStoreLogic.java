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
		List<AdminReport> aqList = session.selectList("AdminReportMapper.selectAllAdminReportList", null, rowBounds);
		return aqList;
	}

	@Override
	public List<AdminReport> selectAllByValue(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int ReportLimit) {
		int offset = (currentPage-1) * ReportLimit;
		RowBounds rowBounds = new RowBounds(offset, ReportLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<AdminReport> aqList = session.selectList("AdminReportMapper.selectAllByValue", paramMap, rowBounds);
		return aqList;
	}

	@Override
	public List<AdminReport> selectAllBySort(SqlSession session, String sortCondition, String sortValue, String contentsCode,
			int currentPage, int ReportSortLimit) {
		int offset = (currentPage-1) * ReportSortLimit;
		RowBounds rowBounds = new RowBounds(offset, ReportSortLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("sortCondition", sortCondition);
		paramMap.put("sortValue", sortValue);
		paramMap.put("contentsCode", contentsCode);
		List<AdminReport> aqList = session.selectList("AdminReportMapper.selectAllBySort", paramMap, rowBounds);
		return aqList;
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
	public AdminReport selectOneByNo(SqlSession session, Integer ReportNo) {
		AdminReport adminReport = session.selectOne("AdminReportMapper.selectOneByNo", ReportNo); 
		return adminReport;
	}

	

}
