package com.kh.strap.match.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;

public interface MatchService {

	List<Member> sameMember(Member member);

	List<Member> localMember(Member member);

	String findIdByNick(String recipientNick);

	int insertNoteBox(NoteBox nb);

	int inserLocalRecord(Map<String, Object> map);

}
