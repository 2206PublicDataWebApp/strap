package com.kh.strap.match.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.match.store.MatchStore;
import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;
import com.kh.strap.notebox.domain.NoteBox;

@Repository
public class MatchStoreLogic implements MatchStore{
	

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

	@Override
	public List<Member> careerMember(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.careerMember", mOne);
		return mList;
	}

	@Override
	public List<Member> careerRefresh(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.careerRefresh", mOne);
		return mList;
	}

	@Override
	public int updateCareerRecord(SqlSession session, Map<String, Object> map) {
		int result1 = session.delete("MatchMapper.deleteCareerRecord", map);
		int result2 = session.update("MatchMapper.updateCareerRecord", map);
		int result = 0;
		if(result1 != 0 && result2 != 0 ) {
			result = 1;
		}
		return result;
	}

	@Override
	public int inserCareerRecord(SqlSession session, Map<String, Object> map) {
		int result = session.update("MatchMapper.inserCareerRecord", map);
		return result;
	}

	@Override
	public void resetCareerRecord(SqlSession session, String memberId) {
		session.delete("MatchMapper.resetCareerRecord",memberId);
	}

	@Override
	public List<Member> SBDMember(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.SBDMember", mOne);
		return mList;
	}

	@Override
	public List<Member> SBDRefresh(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.SBDRefresh", mOne);
		return mList;
	}

	@Override
	public int updateSBDRecord(SqlSession session, Map<String, Object> map) {
		int result1 = session.delete("MatchMapper.deleteSBDRecord", map);
		int result2 = session.update("MatchMapper.updateSBDRecord", map);
		int result = 0;
		if(result1 != 0 && result2 != 0 ) {
			result = 1;
		}
		return result;
	}

	@Override
	public int insertSBDRecord(SqlSession session, Map<String, Object> map) {
		int result = session.update("MatchMapper.insertSBDRecord", map);
		return result;
	}

	@Override
	public void resetSBDRecord(SqlSession session, String memberId) {
		session.delete("MatchMapper.resetSBDRecord",memberId);
	}

	@Override
	public List<Member> genderMember(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.genderMember", mOne);
		return mList;
	}

	@Override
	public List<Member> genderRefresh(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.genderRefresh", mOne);
		return mList;
	}

	@Override
	public void updateGenderRecord(SqlSession session, Map<String, Object> map) {
		session.delete("MatchMapper.deleteGenderRecord", map);
		session.update("MatchMapper.updateGenderRecord", map);
	}

	@Override
	public void insertGenderRecord(SqlSession session, Map<String, Object> map) {
		session.update("MatchMapper.insertGenderRecord", map);
	}

	@Override
	public void resetGenderRecord(SqlSession session, String memberId) {
		session.delete("MatchMapper.resetGenderRecord",memberId);
	}
	
	@Override
	public List<Member> sameMember(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.sameMember", mOne);
		return mList;
	}
	@Override
	public List<Member> sameRefresh(SqlSession session, Member mOne) {
		List<Member> mList= session.selectList("MatchMapper.sameRefresh", mOne);
		return mList;
	}
	@Override
	public void updateSameRecord(SqlSession session, Map<String, Object> map) {
		session.delete("MatchMapper.deleteSameRecord", map);
		session.update("MatchMapper.updateSameRecord", map);
	}
	@Override
	public void insertSameRecord(SqlSession session, Map<String, Object> map) {
		session.update("MatchMapper.insertSameRecord", map);
	}
	@Override
	public void resetSameRecord(SqlSession session, String memberId) {
		session.delete("MatchMapper.resetSameRecord",memberId);
	}

	@Override
	public List<SimpleQnA> selectMemberQnA(SqlSession session, String memberId) {
		List<SimpleQnA> qList = session.selectList("MatchMapper.selectMemberQnA",memberId);
		return qList;
	}

}
