package com.kh.strap.match.service.logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.kh.strap.match.service.MatchService;
import com.kh.strap.match.store.MatchStore;
import com.kh.strap.match.store.logic.MatchStoreLogic;
import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;
import com.kh.strap.notebox.domain.NoteBox;

@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private MatchStore mStore;
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
	@Override
	public List<Member> localRefresh(Member mOne) {
		List<Member> mList = mStore.localRefresh(session, mOne);
		return mList;
	}
	@Override
	public int updateLocalRecord(Map<String, Object> map) {
		int result = mStore.updateLocalRecord(session, map);
		return result;
	}
	@Override
	public void minusCount(Member mOne) {
		mStore.minusCount(session,mOne);
	}
	@Override
	public void resetLocalRecord(String memberId) {
		mStore.resetLocalRecord(session, memberId);	
	}

	@Override
	public int getCountNumber(String memberId) {
		int result = mStore.getCountNum(session, memberId);
		return result;
	}
	@Override
	public List<Member> mannerMember(Member mOne) {
		List<Member> mList = mStore.mannerMember(session, mOne);
		return mList;
	}
	@Override
	public List<Member> mannerRefresh(Member mOne) {
		List<Member> mList = mStore.mannerRefresh(session, mOne);
		return mList;
	}
	@Override
	public int updateMannerRecord(Map<String, Object> map) {
		int result = mStore.updateMannerRecord(session, map);
		return result;
	}
	@Override
	public int inserMannerRecord(Map<String, Object> map) {
		int result = mStore.inserMannerRecord(session, map);
		return result;
	}
	@Override
	public void resetMannerRecord(String memberId) {
		mStore.resetMannerRecord(session, memberId);
		
	}
	@Override
	public List<Member> careerMember(Member mOne) {
		List<Member> mList = mStore.careerMember(session, mOne);
		return mList;
	}
	@Override
	public List<Member> careerRefresh(Member mOne) {
		List<Member> mList = mStore.careerRefresh(session, mOne);
		return mList;
	}
	@Override
	public int updateCareerRecord(Map<String, Object> map) {
		int result = mStore.updateCareerRecord(session, map);
		return result;
	}
	@Override
	public int inserCareerRecord(Map<String, Object> map) {
		int result = mStore.inserCareerRecord(session, map);
		return result;
	}
	@Override
	public void resetCareerRecord(String memberId) {
		mStore.resetCareerRecord(session,memberId);
	}
	@Override
	public List<Member> SBDMember(Member mOne) {
		List<Member> mList = mStore.SBDMember(session, mOne);
		return mList;
	}
	@Override
	public List<Member> SBDRefresh(Member mOne) {
		List<Member> mList = mStore.SBDRefresh(session, mOne);
		return mList;
	}
	@Override
	public int updateSBDRecord(Map<String, Object> map) {
		int result = mStore.updateSBDRecord(session, map);
		return result;
	}
	@Override
	public int insertSBDRecord(Map<String, Object> map) {
		int result = mStore.insertSBDRecord(session, map);
		return result;
	}
	@Override
	public void resetSBDRecord(String memberId) {
		mStore.resetSBDRecord(session,memberId);
	}
	@Override
	public List<Member> genderMember(Member mOne) {
		List<Member> mList = mStore.genderMember(session, mOne);
		return mList;
	}
	@Override
	public List<Member> genderRefresh(Member mOne) {
		List<Member> mList = mStore.genderRefresh(session, mOne);
		return mList;
	}
	@Override
	public void updateGenderRecord(Map<String, Object> map) {
		mStore.updateGenderRecord(session, map);
		
	}
	@Override
	public void insertGenderRecord(Map<String, Object> map) {
		mStore.insertGenderRecord(session, map);
		
	}
	@Override
	public void resetGenderRecord(String memberId) {
		mStore.resetGenderRecord(session, memberId);
		
	}
	@Override
	public List<Member> sameMember(Member member) {
		List<Member> mList = mStore.sameMember(session, member);
		return mList;
	}
	@Override
	public List<Member> sameRefresh(Member mOne) {
		List<Member> mList = mStore.sameRefresh(session, mOne);
		return mList;
	}
	@Override
	public void updateSameRecord(Map<String, Object> map) {
		mStore.updateSameRecord(session, map);
		
	}
	@Override
	public void insertSameRecord(Map<String, Object> map) {
		mStore.insertSameRecord(session, map);
		
	}
	@Override
	public void resetSameRecord(String memberId) {
		mStore.resetSameRecord(session, memberId);
	}
	@Override
	public List<SimpleQnA> selectMemberQnA(String memberId) {
		List<SimpleQnA> qList = mStore.selectMemberQnA(session, memberId);
		return qList;
	}
	@Override
	public int noteSendCheck(Map<String, Object> map) {
		int result = mStore.noteSendCheck(session, map);
		return result;
	}
	
	
}
