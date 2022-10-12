package com.kh.strap.member.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;

public interface MemberStore {

	int memberIdCheck(SqlSession session, String memberId);

	int inserMember(SqlSession session, Member member);

	int memberLogin(SqlSession session, Member member);

}
