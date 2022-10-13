package com.kh.strap.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.MemberService;
import com.kh.strap.member.store.MemberStore;
import com.kh.strap.member.store.logic.MemberStoreLogic;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MemberStore mStore;
	
	public int memberIdCheck(String memberId) {
		int result = mStore.memberIdCheck(session, memberId);
		return result;
	}

	@Override
	public int inserMember(Member member) {
		int result = mStore.inserMember(session, member);
		return result;
	}

	@Override
	public int memberLogin(Member member) {
		int result = mStore.memberLogin(session, member);
		return result;
	}

	@Override
	public int IdCheckByEmail(String memberEmail) {
		int reulst = mStore.IdCheckByEmail(session, memberEmail);
		return reulst;
	}

//	@Override
//	public List<String> findIdByEmail(String memberEmail) {
//		List<String> sList = mStore.findIdByEmail(session, memberEmail);
//		return sList;
//	}
	@Override
	public List<Member> findIdByEmail(String memberEmail) {
		List<Member> sList = mStore.findIdByEmail(session, memberEmail);
		return sList;
	}

	@Override
	public int idEmailCheck(Member member) {
		int result = mStore.idEmailCheck(session, member);
		return result;
	}
	
	
}
