package com.kh.strap.match.service.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.match.service.MatchService;
import com.kh.strap.match.store.MatchStore;
import com.kh.strap.match.store.logic.MatchStoreLogic;
import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;

@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MatchStore mStore;
	@Override
	public List<Member> sameMember(Member member) {
		List<Member> mList = mStore.sameMember(session, member);
		return mList;
	}
	@Override
	public List<Member> localMember(Member member) {
		List<Member> mList = mStore.localMember(session, member);
		return mList;
	}
	@Override
	public String findIdByNick(String recipientNick) {
		// TODO Auto-generated method stub
		String recipientId = mStore.findIdByNick(session, recipientNick);
		return recipientId;
	}
	@Override
	public int insertNoteBox(NoteBox nb) {
		int result = mStore.insertNoteBox(session, nb);
		return result;
	}
	@Override
	public int inserLocalRecord(Map<String, Object> map) {
		int result = mStore.inserLocalRecord(session, map);
		return result;
	}
	
	
}
