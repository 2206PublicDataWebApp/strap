package com.kh.strap.notebox.service;

import java.util.List;

import com.kh.strap.notebox.domain.NoteBox;
import com.kh.strap.notebox.domain.NoteChat;

public interface NoteChatService {
	public List<NoteChat> printNoteChatList(Integer noteNo);
	public int modifyNoteBox(Integer noteNo);
	public int registNoteChat(NoteBox noteBox);
}
