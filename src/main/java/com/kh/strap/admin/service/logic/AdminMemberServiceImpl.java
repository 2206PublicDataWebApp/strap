package com.kh.strap.admin.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.domain.AdminQna;
import com.kh.strap.admin.service.AdminMemberService;
import com.kh.strap.admin.store.AdminMemberStore;
import com.kh.strap.member.domain.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{

	@Autowired
	private AdminMemberStore aStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount(String searchCondition, String searchValue, String memberType) {
		int result = aStore.getTotalCount(session, searchCondition, searchValue, memberType); 
		return result;
	}

	@Override
	public List<Member> printAllAdminMeberList(int currentPage, int adminMemberLimit) {
		List<Member> mList = aStore.printAllAdminMeberList(session, currentPage, adminMemberLimit);
		return mList;
	}

	@Override
	public List<Member> printAllByValue(String searchCondition, String searchValue, String memberType, int currentPage, int memberLimit) {
		List<Member> mList = aStore.printAllByValue(session, searchCondition, searchValue, memberType, currentPage, memberLimit);
		return mList;
	}

	@Override
	public List<Member> printAllBySort(String memberType, int currentPage,
			int memberLimit) {
		List<Member> mList = aStore.printAllBySort(session, memberType, currentPage, memberLimit);
		return mList;
	}

	@Override
	public Member memberById(String memberId) {
		Member member = aStore.memberById(session, memberId);
		return member;
	}

	@Override
	public int adminMemberModify(Member member) {
		int result = aStore.adminMemberModify(session, member);
		return result;
	}

	@Override
	public int adminMemberDelete(String memberId) {
		int result = aStore.adminMemberDelete(session, memberId);
		return result;
	}

}
