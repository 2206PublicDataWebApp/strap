package com.kh.strap.match.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;

public interface MatchStore {

	List<Member> sameMember(SqlSession session, Member member);

	List<Member> localMember(SqlSession session, Member member);

}
