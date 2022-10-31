package com.kh.strap.match.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.match.store.MatchStore;
import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;

@Repository
public class MatchStoreLogic implements MatchStore{

	public List<Member> sameMember(SqlSession session, Member member) {
		List<Member> mList= session.selectList("MatchMapper.sameMember", member);
		return mList;
	}

	@Override
	public List<Member> localMember(SqlSession session, Member member) {
		List<Member> mList= session.selectList("MatchMapper.localMember", member);
		return mList;
	}

	@Override
	public String findIdByNick(SqlSession session, String memberNick) {
		String recipientId = session.selectOne("MatchMapper.findIdByNick", memberNick);
		return recipientId;
	}

	@Override
	public int insertNoteBox(SqlSession session, NoteBox nb) {
		int result = session.insert("MatchMapper.insertNoteBox", nb);
		return result;
	}

	@Override
	public int inserLocalRecord(SqlSession session, Map<String, Object> map) {
		int result = session.update("MatchMapper.inserLocalRecord", map);
		return result;
	}

}
