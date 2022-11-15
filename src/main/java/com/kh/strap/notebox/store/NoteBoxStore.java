package com.kh.strap.notebox.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.domain.NoteChat;

public interface NoteBoxStore {
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String memberId);
	public List<NoteBox> selectAllNoteBox(SqlSession session, String memberId, int currentPage, int noticeLimit);
	public NoteBox selectOneByNo(SqlSession session, NoteBox noteBox);
	public Member selectOneByName(SqlSession session, String senderNick);
	public int selectCountNoteBox(SqlSession session, String memberId);
	public List<NoteBox> selectAllByValue(SqlSession session, String searchCondition, String searchValue, String memberId, int currentPage, int noticeLimit);
	public int updateCheckNote(SqlSession session, NoteBox noteBox);
	public int deleteNote(SqlSession session, int noteNo);
	public int getCountNoteChat(SqlSession session, String memberId);
	public List<Map<Object, Object>> countNoteBoxList(SqlSession session, String memberId);
	public void checkChat(SqlSession session, Map<String, Object> map);
}
