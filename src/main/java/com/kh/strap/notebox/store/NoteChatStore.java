package com.kh.strap.notebox.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.domain.NoteChat;

public interface NoteChatStore {
	public List<NoteChat> selectNoteChatList(SqlSession session, Integer noteNo);
	public int updateNoteBox(SqlSession session, Integer noteNo);
	public int insertNoteChat(SqlSession session, NoteBox noteBox);
}
