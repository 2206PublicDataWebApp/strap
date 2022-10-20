package com.kh.strap.member.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.service.MemberService;
import com.kh.strap.member.store.MemberStore;


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

	@Override
	public int changeTempPwd(Member member) {
		int result = mStore.changeTempPwd(session, member);
		return result;
	}

	@Override
	public int kakaoMembercheck(String memberId) {
		int result = mStore.kakaoMembercheck(session, memberId);
		return result;
	}

	@Override
	public Member memberById(String memberId) {
		Member member = mStore.memberById(session, memberId);
		return member;
	}

	@Override
	public int insertSocialMember(Member member) {
		int result = mStore.insertSocialMember(session, member);
		return result;
	}

	@Override
	public String memberPwdById(String memberId) {
		String encodePwd = mStore.memberPwdById(session, memberId);
		return encodePwd;
	}

	
	
}
