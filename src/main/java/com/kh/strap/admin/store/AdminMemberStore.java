package com.kh.strap.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;

public interface AdminMemberStore {

	int getTotalCount(SqlSession session, String searchCondition, String searchValue, String memberType);

	List<Member> printAllAdminMeberList(SqlSession session, int currentPage, int adminMemberLimit);

	List<Member> printAllByValue(SqlSession session, String searchCondition, String searchValue, String memberType, int currentPage,
			int memberLimit);

	List<Member> printAllBySort(SqlSession session, String memberType, int currentPage, int memberLimit);

	Member memberById(SqlSession session, String memberId);

	int adminMemberModify(SqlSession session, Member member);

	int adminMemberDelete(SqlSession session, String memberId);

}
