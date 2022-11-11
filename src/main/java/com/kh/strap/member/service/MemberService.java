package com.kh.strap.member.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;

public interface MemberService {

	int memberIdCheck(String memberId);

	int inserMember(Member member);

	int memberLogin(Member member);

	int IdCheckByEmail(String memberEmail);

//	List<String> findIdByEmail(String memberId);
	List<Member> findIdByEmail(String memberId);

	int idEmailCheck(Member member);

	int changePwd(Member member);

	int kakaoMembercheck(String memberId);

	Member memberById(String memberId);

	int insertSocialMember(Member Member);

	String memberPwdById(String memberId);

	int memberNickCheck(String memberNick);

	int changeNick(Member member);

	int changeEmail(Member member);

	int changeCareer(Member member);

	int changeSBD(Member member);

	int changeJym(Member member);

	int changeImg(Member member);

	int changeIntroduce(Member member);

	void updateLastDate(String memberId);

	int inserAnswer(Map<String, Object> map);

	List<SimpleQnA> simpleQnA(String memberId);

	SimpleQnA qnaOne(String memberId);

	int withdrawal(String memberId);

	int mannerPercent(String memberId);

	int changeAddr(Member member);

	int inserSurveyAnswer(Map<String, Object> map);

	int mannerUpdate(Map<String, Object> map);


}
