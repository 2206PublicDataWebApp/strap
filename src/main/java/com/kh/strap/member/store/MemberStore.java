package com.kh.strap.member.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;

public interface MemberStore {

	int memberIdCheck(SqlSession session, String memberId);

	int inserMember(SqlSession session, Member member);

	int memberLogin(SqlSession session, Member member);

	int IdCheckByEmail(SqlSession session, String memberEmail);

//	List<String> findIdByEmail(SqlSession session, String memberEmail);
	List<Member> findIdByEmail(SqlSession session, String memberEmail);

	int idEmailCheck(SqlSession session, Member member);

	int changePwd(SqlSession session, Member member);

	int kakaoMembercheck(SqlSession session, String memberId);

	Member memberById(SqlSession session, String memberId);

	int insertSocialMember(SqlSession session, Member member);

	String memberPwdById(SqlSession session, String memberId);

	int memberNickCheck(SqlSession session, String memberNick);

	int changeNick(SqlSession session, Member member);

	int changeEmail(SqlSession session, Member member);

	int changeCareer(SqlSession session, Member member);

	int changeSBD(SqlSession session, Member member);

	int changeJym(SqlSession session, Member member);

	int changeImg(SqlSession session, Member member);

	int changeIntroduce(SqlSession session, Member member);

	void updateLastDate(SqlSession session, String memberId);

	int inserAnswer(SqlSession session, Map<String, Object> map);

	List<SimpleQnA> simpleQnA(SqlSession session, String memberId);

	SimpleQnA qnaOne(SqlSession session, String memberId);

	int withdrawal(SqlSession session, String memberId);

	int mannerPercent(SqlSession session, String memberId);

	int changeAddr(SqlSession session, Member member);

	int inserSurveyAnswer(SqlSession session, Map<String, Object> map);

	int mannerUpdate(SqlSession session, Map<String, Object> map);

}
