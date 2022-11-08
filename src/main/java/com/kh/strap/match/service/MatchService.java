package com.kh.strap.match.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.strap.member.domain.Member;
import com.kh.strap.member.domain.SimpleQnA;
import com.kh.strap.notebox.domain.NoteBox;

public interface MatchService {


	List<Member> localMember(Member member);

	String findIdByNick(String recipientNick);

	int insertNoteBox(NoteBox nb);

	int inserLocalRecord(Map<String, Object> map);

	List<Member> localRefresh(Member mOne);

	int updateLocalRecord(Map<String, Object> map);

	void minusCount(Member mOne);

	void resetLocalRecord(String memberId);

	int getCountNumber(String memberId);

	List<Member> mannerMember(Member mOne);

	List<Member> mannerRefresh(Member mOne);

	int updateMannerRecord(Map<String, Object> map);

	int inserMannerRecord(Map<String, Object> map);

	void resetMannerRecord(String memberId);

	List<Member> careerMember(Member mOne);

	List<Member> careerRefresh(Member mOne);

	int updateCareerRecord(Map<String, Object> map);

	int inserCareerRecord(Map<String, Object> map);

	void resetCareerRecord(String memberId);

	List<Member> SBDRefresh(Member mOne);

	int updateSBDRecord(Map<String, Object> map);

	int insertSBDRecord(Map<String, Object> map);

	void resetSBDRecord(String memberId);

	List<Member> SBDMember(Member mOne);

	List<Member> genderMember(Member mOne);

	List<Member> genderRefresh(Member mOne);

	void updateGenderRecord(Map<String, Object> map);

	void insertGenderRecord(Map<String, Object> map);

	void resetGenderRecord(String memberId);

	List<Member> sameMember(Member member);

	List<Member> sameRefresh(Member mOne);

	void updateSameRecord(Map<String, Object> map);

	void insertSameRecord(Map<String, Object> map);

	void resetSameRecord(String memberId);

	List<SimpleQnA> selectMemberQnA(String memberId);

	int noteSendCheck(Map<String, Object> map);

}
