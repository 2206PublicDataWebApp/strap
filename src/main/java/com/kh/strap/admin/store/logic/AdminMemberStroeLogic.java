package com.kh.strap.admin.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.store.AdminMemberStore;
import com.kh.strap.member.domain.Member;

@Repository
public class AdminMemberStroeLogic implements AdminMemberStore {

	@Override
	public int getTotalCount(SqlSession session, String searchCondition, String searchValue, String memberType) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		paramMap.put("memberType", memberType);
		int result = session.selectOne("AdminMemberMapper.getTotalCount", paramMap);
		return result;
	}

	@Override
	public List<Member> printAllAdminMeberList(SqlSession session, int currentPage, int adminMemberLimit) {
		int offset = (currentPage-1)*adminMemberLimit;
		RowBounds rowBounds = new RowBounds(offset, adminMemberLimit);
		List<Member> mList = session.selectList("AdminMemberMapper.printAllAdminMeberList", null, rowBounds);
		return mList;
	}

	@Override
	public List<Member> printAllByValue(SqlSession session, String searchCondition, String searchValue, String memberType, int currentPage,
			int adminMemberLimit) {
		int offset = (currentPage-1)*adminMemberLimit;
		RowBounds rowBounds = new RowBounds(offset, adminMemberLimit);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchValue", searchValue);
		paramMap.put("memberType", memberType);
		List<Member> mList = session.selectList("AdminMemberMapper.printAllByValue", paramMap, rowBounds);
		return mList;
	}

	@Override
	public List<Member> printAllBySort(SqlSession session, String memberType, int currentPage, int adminMemberLimit) {
		int offset = (currentPage-1)*adminMemberLimit;
		RowBounds rowBounds = new RowBounds(offset, adminMemberLimit);
		List<Member> mList = session.selectList("AdminMemberMapper.printAllBySort", memberType, rowBounds);
		return mList;
	}

}
