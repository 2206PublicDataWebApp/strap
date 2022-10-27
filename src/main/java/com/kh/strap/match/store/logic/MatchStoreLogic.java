package com.kh.strap.match.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.match.store.MatchStore;
import com.kh.strap.member.domain.Member;



@Repository
public class MatchStoreLogic implements MatchStore{

	public List<Member> sameMember(SqlSession session, Member member) {
		List<Member> mList= session.selectList("MatchMapper.sameMember", member);
		return mList;
	}

	@Override
	public List<Member> localMember(SqlSession session, Member member) {
		List<Member> mList= session.selectList("MatchMapper.localMember", member);
		return mList;
	}

}
