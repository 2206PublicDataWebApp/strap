package com.kh.strap.notebox.service;

import java.util.List;

import com.kh.strap.notebox.domain.NoteBox;


public interface NoteBoxService {
	public int getTotalCount(String searchCondition, String searchValue);
	public List<NoteBox> printNoteBoxList(String memberId, int currentPage, int noticeLimit);
	public NoteBox printOneByNo(NoteBox noteBox);
	public int getCountNoteBox(String memberId);
	public int checkNote(NoteBox noteBox);
}
