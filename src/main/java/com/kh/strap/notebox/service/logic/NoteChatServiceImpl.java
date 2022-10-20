package com.kh.strap.notebox.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.strap.notebox.domain.NoteChat;
import com.kh.strap.notebox.service.NoteChatService;
import com.kh.strap.notebox.store.logic.NoteChatStoreLogic;


public class NoteChatServiceImpl implements NoteChatService{
	@Autowired
	private SqlSession session;
	@Autowired
	private NoteChatStoreLogic ncStore;
	
	@Override
	public List<NoteChat> printNoteChatList(Integer noteNo) {
		List<NoteChat> nList = ncStore.selectNoteChatList(session, noteNo);
		return nList;
	}
}
