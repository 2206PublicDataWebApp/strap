package com.kh.strap.notebox.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.notebox.service.NoteBoxService;
import com.kh.strap.notebox.store.logic.NoteBoxStoreLogic;

@Service
public class NoteBoxServiceImpl implements NoteBoxService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private NoteBoxStoreLogic nStore;
	
	
}
