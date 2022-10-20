package com.kh.strap.notebox.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.notebox.domain.NoteChat;
import com.kh.strap.notebox.store.NoteChatStore;


@Repository
public class NoteChatStoreLogic implements NoteChatStore{

	@Override
	public List<NoteChat> selectNoteChatList(SqlSession session, Integer noteNo) {
		List<NoteChat> nList = session.selectList("NoteChatMapper.selectAllNoteChat", noteNo);
		return nList;
	}

}
