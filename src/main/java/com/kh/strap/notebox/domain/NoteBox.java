package com.kh.strap.notebox.domain;

import java.util.Date;

public class NoteBox {
	private int noteNo;
	private String recipientId;
	private String senderId;
	private Date senderTime;
	private String noteContents;
	private String noteAccept;
	private String noteStatus;
	private String recipientNick;
	private String senderNick;
	private String noteCheck;
	
	
	public NoteBox() {}

	public NoteBox(String recipientId, String senderId, String noteContents, String recipientNick,
			String senderNick) {
		super();
		this.recipientId = recipientId;
		this.senderId = senderId;
		this.noteContents = noteContents;
		this.recipientNick = recipientNick;
		this.senderNick = senderNick;
	}

	public int getNoteNo() {
		return noteNo;
	}


	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}


	public String getRecipientId() {
		return recipientId;
	}


	public void setRecipientId(String recipientId) {
		this.recipientId = recipientId;
	}


	public String getSenderId() {
		return senderId;
	}


	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}


	public Date getSenderTime() {
		return senderTime;
	}


	public void setSenderTime(Date senderTime) {
		this.senderTime = senderTime;
	}



	public String getNoteContents() {
		return noteContents;
	}


	public void setNoteContents(String noteContents) {
		this.noteContents = noteContents;
	}


	public String getNoteAccept() {
		return noteAccept;
	}


	public void setNoteAccept(String noteAccept) {
		this.noteAccept = noteAccept;
	}


	public String getNoteStatus() {
		return noteStatus;
	}


	public void setNoteStatus(String noteStatus) {
		this.noteStatus = noteStatus;
	}

	public String getRecipientNick() {
		return recipientNick;
	}

	public void setRecipientNick(String recipientNick) {
		this.recipientNick = recipientNick;
	}

	public String getSenderNick() {
		return senderNick;
	}

	public void setSenderNick(String senderNick) {
		this.senderNick = senderNick;
	}

	public String getNoteCheck() {
		return noteCheck;
	}

	public void setNoteCheck(String noteCheck) {
		this.noteCheck = noteCheck;
	}

	@Override
	public String toString() {
		return "NoteBox [noteNo=" + noteNo + ", recipientId=" + recipientId + ", senderId=" + senderId + ", senderTime="
				+ senderTime + ", noteContents=" + noteContents + ", noteAccept=" + noteAccept + ", noteStatus="
				+ noteStatus + ", recipientNick=" + recipientNick + ", senderNick=" + senderNick + ", noteCheck="
				+ noteCheck + "]";
	}

	
	
}
