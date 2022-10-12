package com.kh.strap.member.service;

import com.kh.strap.member.domain.Member;

public interface MemberService {

	int memberIdCheck(String memberId);

	int inserMember(Member member);

	int memberLogin(Member member);

}
