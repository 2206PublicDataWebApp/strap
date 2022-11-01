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

	@Override
	public List<Member> localRefresh(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.localRefresh", mOne);
		return mList;
	}

	@Override
	public int updateLocalRecord(SqlSession session, Map<String, Object> map) {
		int result1 = session.delete("MatchMapper.deleteLocalRecord", map);
		int result2 = session.update("MatchMapper.updateLocalRecord", map);
		int result = 0;
		if(result1 != 0 && result2 != 0 ) {
			result = 1;
		}
		return result;
	}

	@Override
	public void minusCount(SqlSession session, Member mOne) {
		session.update("MatchMapper.minusCount",mOne);
	}

	@Override
	public void resetLocalRecord(SqlSession session, String memberId) {
		session.delete("MatchMapper.resetLocalRecord",memberId);
		
	}

	@Override
	public int getCountNum(SqlSession session, String memberId) {
		int num = session.selectOne("MatchMapper.getCountNum",memberId);
		return num;
	}

	@Override
	public List<Member> mannerMember(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.mannerMember", mOne);
		return mList;
	}

	@Override
	public List<Member> mannerRefresh(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.mannerRefresh", mOne);
		return mList;
	}

	@Override
	public int updateMannerRecord(SqlSession session, Map<String, Object> map) {
		int result1 = session.delete("MatchMapper.deleteMannerRecord", map);
		int result2 = session.update("MatchMapper.updateMannerRecord", map);
		int result = 0;
		if(result1 != 0 && result2 != 0 ) {
			result = 1;
		}
		return result;
	}

	@Override
	public int inserMannerRecord(SqlSession session, Map<String, Object> map) {
		int result = session.update("MatchMapper.inserMannerRecord", map);
		return result;
	}

	@Override
	public void resetMannerRecord(SqlSession session, String memberId) {
		session.delete("MatchMapper.resetMannerRecord",memberId);
		
	}

}
