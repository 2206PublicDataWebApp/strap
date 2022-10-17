package com.kh.strap.member.service;

import java.util.List;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SocialMember;

public interface MemberService {

	int memberIdCheck(String memberId);

	int inserMember(Member member);

	int memberLogin(Member member);

	int IdCheckByEmail(String memberEmail);

//	List<String> findIdByEmail(String memberId);
	List<Member> findIdByEmail(String memberId);

	int idEmailCheck(Member member);

	int changeTempPwd(Member member);

	int kakaoMembercheck(String memberId);

	Member memberById(String memberId);

	int insertSocialMember(SocialMember socialMember);


}
