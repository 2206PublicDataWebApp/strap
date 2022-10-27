package com.kh.strap.match.service;

import java.util.List;

import com.kh.strap.member.domain.Member;

public interface MatchService {

	List<Member> sameMember(Member member);

	List<Member> localMember(Member member);

}
