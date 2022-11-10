package com.kh.strap.notebox.service;

import java.util.List;

import com.kh.strap.member.domain.Member;
import com.kh.strap.notebox.domain.NoteBox;


public interface NoteBoxService {
	public int getTotalCount(String searchCondition, String searchValue, String memberId);
	public List<NoteBox> printNoteBoxList(String memberId, int currentPage, int noticeLimit);
	public NoteBox printOneByNo(NoteBox noteBox);
	public Member printOneByName(String senderNick);
	public int getCountNoteBox(String memberId);
	public List<NoteBox> printAllByValue(String searchCondition, String searchValue, String memberId, int currentPage, int noticeLimit);
	public int checkNote(NoteBox noteBox);
	public int removeNote(int noteNo);
}
