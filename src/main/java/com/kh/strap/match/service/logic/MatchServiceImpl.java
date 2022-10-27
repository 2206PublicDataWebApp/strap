package com.kh.strap.match.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.match.service.MatchService;
import com.kh.strap.match.store.MatchStore;
import com.kh.strap.match.store.logic.MatchStoreLogic;
import com.kh.strap.member.domain.Member;



@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MatchStore mStore;
	@Override
	public List<Member> sameMember(Member member) {
		List<Member> mList = mStore.sameMember(session, member);
		return mList;
	}
	@Override
	public List<Member> localMember(Member member) {
		List<Member> mList = mStore.localMember(session, member);
		return mList;
	}
	
	
}
