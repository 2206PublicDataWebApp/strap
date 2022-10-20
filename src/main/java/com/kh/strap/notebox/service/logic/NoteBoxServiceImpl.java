package com.kh.strap.notebox.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.service.NoteBoxService;
import com.kh.strap.notebox.store.logic.NoteBoxStoreLogic;

@Service
public class NoteBoxServiceImpl implements NoteBoxService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private NoteBoxStoreLogic nStore;
	
	@Override
	public int getTotalCount(String searchCondition, String searchValue) {
		int totalCount = nStore.selectTotalCount(session, searchCondition, searchValue);
		return totalCount;
	}

	@Override
	public List<NoteBox> printNoteBoxList(String memberId, int currentPage, int noticeLimit) {
		List<NoteBox> nList = nStore.selectAllNoteBox(session, memberId, currentPage, noticeLimit);
		return nList;
	}

	@Override
	public NoteBox printOneByNo(Integer noteNo) {
		NoteBox noteBox = nStore.selectOneByNo(session, noteNo);
		return noteBox;
	}
	
}
