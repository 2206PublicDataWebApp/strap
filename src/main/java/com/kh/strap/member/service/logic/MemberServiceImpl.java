package com.kh.strap.member.service.logic;

import java.util.List;
import java.util.Map;

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

	@Override
	public int memberNickCheck(String memberNick) {
		int result = mStore.memberNickCheck(session, memberNick);
		return result;
	}

	@Override
	public int changePwd(Member member) {
		int result = mStore.changePwd(session, member);
		return result;
	}
	
	@Override
	public int changeNick(Member member) {
		int result = mStore.changeNick(session, member);
		return result;
	}

	@Override
	public int changeEmail(Member member) {
		int result = mStore.changeEmail(session, member);
		return result;
	}

	@Override
	public int changeCareer(Member member) {
		int result = mStore.changeCareer(session, member);
		return result;
	}

	@Override
	public int changeSBD(Member member) {
		int result = mStore.changeSBD(session, member);
		return result;
	}

	@Override
	public int changeJym(Member member) {
		int result = mStore.changeJym(session, member);
		return result;
	}

	@Override
	public int changeImg(Member member) {
		int result = mStore.changeImg(session, member);
		return result;
	}

	@Override
	public int changeIntroduce(Member member) {
		int result = mStore.changeIntroduce(session, member);
		return result;
	}

	@Override
	public void updateLastDate(String memberId) {
		mStore.updateLastDate(session, memberId);
		
	}

	@Override
	public int inserAnswer(Map<String, String> map) {
		int result = mStore.inserAnswer(session, map);
		return result;
	}

	
	
}
