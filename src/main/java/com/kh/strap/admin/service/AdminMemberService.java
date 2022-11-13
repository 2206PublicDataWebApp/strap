package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.member.domain.Member;

public interface AdminMemberService {

	int getTotalCount(String searchCondition, String searchValue, String memberType);

	List<Member> printAllAdminMeberList(int currentPage, int adminqnaLimit);

	List<Member> printAllByValue(String searchCondition, String searchValue, String memberType, int currentPage, int qnaLimit);

	List<Member> printAllBySort(String memberType, int currentPage, int memberLimit);

	Member memberById(String memberId);

	int adminMemberModify(Member member);

	int adminMemberDelete(String memberId);

}
