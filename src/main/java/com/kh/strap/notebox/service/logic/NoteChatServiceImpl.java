package com.kh.strap.notebox.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.domain.NoteChat;
import com.kh.strap.notebox.service.NoteChatService;
import com.kh.strap.notebox.store.NoteChatStore;

@Service
public class NoteChatServiceImpl implements NoteChatService{
	@Autowired
	private SqlSession session;
	@Autowired
	private NoteChatStore ncStore;
	
	@Override
	public List<NoteChat> printNoteChatList(Integer noteNo) {
		List<NoteChat> nList = ncStore.selectNoteChatList(session, noteNo);
		return nList;
	}

	@Override
	public int modifyNoteBox(Integer noteNo) {
		int result = ncStore.updateNoteBox(session, noteNo);
		return result;
	}

	@Override
	public int registNoteChat(NoteBox noteBox) {
		int result = ncStore.insertNoteChat(session, noteBox);
		return result;
	}
}
