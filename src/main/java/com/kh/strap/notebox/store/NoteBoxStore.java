package com.kh.strap.notebox.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.notebox.domain.NoteBox;

public interface NoteBoxStore {
	public int selectTotalCount(SqlSession session, String searchCondition, String searchValue);
	public List<NoteBox> selectAllNoteBox(SqlSession session, int currentPage, int noticeLimit);
}
