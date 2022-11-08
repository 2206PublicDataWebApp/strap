package com.kh.strap.notebox.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.service.NoteBoxService;
import com.kh.strap.notebox.store.NoteBoxStore;

@Service
public class NoteBoxServiceImpl implements NoteBoxService {
	
	@Autowired
	private SqlSession session;
	@Autowired
	private NoteBoxStore nbStore;
	
	@Override
	public int getTotalCount(String searchCondition, String searchValue, String memberId) {
		int totalCount = nbStore.selectTotalCount(session, searchCondition, searchValue, memberId);
		return totalCount;
	}

	@Override
	public List<NoteBox> printNoteBoxList(String memberId, int currentPage, int noticeLimit) {
		List<NoteBox> nList = nbStore.selectAllNoteBox(session, memberId, currentPage, noticeLimit);
		return nList;
	}

	@Override
	public NoteBox printOneByNo(NoteBox noteBox) {
		NoteBox nOne = nbStore.selectOneByNo(session, noteBox);
		return nOne;
	}

	@Override
	public int getCountNoteBox(String memberId) {
		int result = nbStore.selectCountNoteBox(session, memberId);
		return result;
	}

	@Override
	public List<NoteBox> printAllByValue(String searchCondition, String searchValue, String memberId, int currentPage, int noticeLimit) {
		List<NoteBox> nlist = nbStore.selectAllByValue(session,searchCondition, searchValue, memberId, currentPage, noticeLimit);
		return nlist;
	}

	@Override
	public int checkNote(NoteBox noteBox) {
		int result = nbStore.updateCheckNote(session, noteBox);
		return result;
	}

	@Override
	public int removeNote(int noteNo) {
		int result = nbStore.deleteNote(session, noteNo);
		return result;
	}
	
}
