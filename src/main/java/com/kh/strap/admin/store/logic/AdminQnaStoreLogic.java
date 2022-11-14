package com.kh.strap.admin.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.domain.AdminQna;
import com.kh.strap.admin.store.AdminQnaStore;


@Repository
public class AdminQnaStoreLogic implements AdminQnaStore{

	@Override
	public List<AdminQna> selectAllAdminQnaList(SqlSession session, int currentPage, int noticeLimit) {
		int offset = (currentPage-1)*noticeLimit;
		RowBounds rowBounds = new RowBounds(offset, noticeLimit);
		List<AdminQna> aqList = session.selectList("AdminQnaMapper.selectAllAdminQnaList", null, rowBounds);
		return aqList;
	}

	@Override
	public List<AdminQna> selectAllByValue(SqlSession session, String searchCondition, String searchValue,
			int currentPage, int qnaLimit) {
		int offset = (currentPage-1) * qnaLimit;
		RowBounds rowBounds = new RowBounds(offset, qnaLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<AdminQna> aqList = session.selectList("AdminQnaMapper.selectAllByValue", paramMap, rowBounds);
		return aqList;
	}

	@Override
	public List<AdminQna> selectAllBySort(SqlSession session, String sortCondition, String sortValue, String qnaCode,
			int currentPage, int qnaSortLimit) {
		int offset = (currentPage-1) * qnaSortLimit;
		RowBounds rowBounds = new RowBounds(offset, qnaSortLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("sortCondition", sortCondition);
		paramMap.put("sortValue", sortValue);
		paramMap.put("qnaCode", qnaCode);
		List<AdminQna> aqList = session.selectList("AdminQnaMapper.selectAllBySort", paramMap, rowBounds);
		return aqList;
	}

	@Override
	public List<AdminQna> selectAllByUnsolvedQna(SqlSession session, String searchCondition, String searchValue, int currentPage,
			int unsolvedQnaLimit) {
		int offset = (currentPage-1) * unsolvedQnaLimit;
		RowBounds rowBounds = new RowBounds(offset, unsolvedQnaLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		List<AdminQna> aqList = session.selectList("AdminQnaMapper.selectAllByUnsolvedQna", paramMap, rowBounds);
		return aqList;
	}

	@Override
	public List<AdminQna> selectAllByUnsolvedQna(SqlSession session, int currentPage, int unsolvedQnaLimit) {
		int offset = (currentPage-1)*unsolvedQnaLimit;
		RowBounds rowBounds = new RowBounds(offset, unsolvedQnaLimit);
		List<AdminQna> aqList = session.selectList("AdminQnaMapper.selectAllByUnsolvedQna", null, rowBounds);
		return aqList;
	}

	@Override
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String qnaCode) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		paramMap.put("qnaCode", qnaCode);
		int totalCount = session.selectOne("AdminQnaMapper.selectTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public int selectAllqnaCount(SqlSession session, String searchCondition, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("AdminQnaMapper.selectAllqnaCount", paramMap);
		return totalCount;
	}

	@Override
	public AdminQna selectOneByNo(SqlSession session, Integer qnaNo) {
		AdminQna adminQna = session.selectOne("AdminQnaMapper.selectOneByNo", qnaNo); 
		return adminQna;
	}

	@Override
	public int updateAdminQna(SqlSession session, AdminQna adminQna) {
		int result = session.update("AdminQnaMapper.updateAdminQna", adminQna);
		return result;
	}

}
