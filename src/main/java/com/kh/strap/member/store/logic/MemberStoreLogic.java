package com.kh.strap.member.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;
import com.kh.strap.member.store.MemberStore;


@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public int memberIdCheck(SqlSession session, String memberId) {
		int result = session.selectOne("MemberMapper.memberIdCheck", memberId);
		return result;
	}

	@Override
	public int inserMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.inserMember", member);
		return result;
	}

	@Override
	public int memberLogin(SqlSession session, Member member) {
		int result = session.selectOne("MemberMapper.memberLogin", member);
		return result;
	}

	@Override
	public int IdCheckByEmail(SqlSession session, String memberEmail) {
		int result = session.selectOne("MemberMapper.IdCheckByEmail", memberEmail);
		return result;
	}

	@Override
	public List<Member> findIdByEmail(SqlSession session, String memberEmail) {
		List<Member> sList = session.selectList("MemberMapper.findIdByEmail", memberEmail);
		return sList;
	}

	@Override
	public int idEmailCheck(SqlSession session, Member member) {
		int result = session.selectOne("MemberMapper.idEmailCheck", member);
		return result;
	}

	@Override
	public int changePwd(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changePwd", member);
		return result;
	}


	@Override
	public int kakaoMembercheck(SqlSession session, String memberId) {
		int result = session.selectOne("MemberMapper.kakaoMemberCheck", memberId);
		return result;
	}

	@Override
	public Member memberById(SqlSession session, String memberId) {
		Member member = session.selectOne("MemberMapper.memberById", memberId);
		return member;
	}

	@Override
	public int insertSocialMember(SqlSession session, Member member) {
		int result = session.insert("MemberMapper.insertSocialMember", member);
		return result;
	}

	@Override
	public String memberPwdById(SqlSession session, String memberId) {
		String encodePwd = session.selectOne("MemberMapper.memberPwdById", memberId);
		return encodePwd;
	}

	@Override
	public int memberNickCheck(SqlSession session, String memberNick) {
		int result = session.selectOne("MemberMapper.memberNickCheck", memberNick);
		return result;
	}

	@Override
	public int changeNick(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeNick",member);
		return result;
	}

	@Override
	public int changeEmail(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeEmail",member);
		return result;
	}

	@Override
	public int changeCareer(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeCareer",member);
		return result;
	}

	@Override
	public int changeSBD(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeSBD",member);
		return result;
	}

	@Override
	public int changeJym(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeJym",member);
		return result;
	}

	@Override
	public int changeImg(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeImg",member);
		return result;
	}

	@Override
	public int changeIntroduce(SqlSession session, Member member) {
		int result = session.update("MemberMapper.changeIntroduce",member);
		return result;
	}

	@Override
	public void updateLastDate(SqlSession session, String memberId) {
		session.update("MemberMapper.updateLastDate",memberId);
		
	}

	@Override
	public int inserAnswer(SqlSession session, Map<String, String> map) {
		int result = session.insert("MemberMapper.inserAnswer", map);
		return result;
	}

	@Override
	public List<SimpleQnA> simpleQnA(SqlSession session, String memberId) {
		List<SimpleQnA> sList  = session.selectList("MemberMapper.simpleQnA", memberId);
		return sList;
	}

}
