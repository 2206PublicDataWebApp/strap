package com.kh.strap.notebox.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;

public interface NoteBoxStore {
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue, String memberId);
	public List<NoteBox> selectAllNoteBox(SqlSession session, String memberId, int currentPage, int noticeLimit);
	public NoteBox selectOneByNo(SqlSession session, NoteBox noteBox);
	public Member selectOneByName(SqlSession session, String senderNick);
	public int selectCountNoteBox(SqlSession session, String memberId);
	public List<NoteBox> selectAllByValue(SqlSession session, String searchCondition, String searchValue, String memberId, int currentPage, int noticeLimit);
	public int updateCheckNote(SqlSession session, NoteBox noteBox);
	public int deleteNote(SqlSession session, int noteNo);
}
