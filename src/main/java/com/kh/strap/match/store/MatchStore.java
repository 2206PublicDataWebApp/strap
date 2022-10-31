package com.kh.strap.match.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;

public interface MatchStore {

	List<Member> sameMember(SqlSession session, Member member);

	List<Member> localMember(SqlSession session, Member member);

	String findIdByNick(SqlSession session, String recipientNick);

	int insertNoteBox(SqlSession session, NoteBox nb);

	int inserLocalRecord(SqlSession session, Map<String, Object> map);

	List<Member> localRefresh(SqlSession session, Member mOne);

	int updateLocalRecord(SqlSession session, Map<String, Object> map);

	void minusCount(SqlSession session, Member mOne);

	void resetLocalRecord(SqlSession session, String memberId);

	int getCountNum(SqlSession session, String memberId);

	List<Member> mannerMember(SqlSession session, Member mOne);

	List<Member> mannerRefresh(SqlSession session, Member mOne);

	int updateMannerRecord(SqlSession session, Map<String, Object> map);

	int inserMannerRecord(SqlSession session, Map<String, Object> map);

	void resetMannerRecord(SqlSession session, String memberId);

}
