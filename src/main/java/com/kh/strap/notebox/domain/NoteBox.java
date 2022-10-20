package com.kh.strap.notebox.domain;

import java.util.Date;

public class NoteBox {
	private int noteNo;
	private String recipientId;
	private String senderId;
	private Date senderTime;
	private String noteTitle;
	private String noteContents;
	private String noteAccept;
	private Date matchDate;
	private Date matchTime;
	private String noteStatus;
	private String recipientNick;
	private String senderNick;
	
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


	public String getNoteTitle() {
		return noteTitle;
	}


	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
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


	public Date getMatchDate() {
		return matchDate;
	}


	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}


	public Date getMatchTime() {
		return matchTime;
	}


	public void setMatchTime(Date matchTime) {
		this.matchTime = matchTime;
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


	@Override
	public String toString() {
		return "NoteBox [noteNo=" + noteNo + ", recipientId=" + recipientId + ", senderId=" + senderId + ", senderTime="
				+ senderTime + ", noteTitle=" + noteTitle + ", noteContents=" + noteContents + ", noteAccept="
				+ noteAccept + ", matchDate=" + matchDate + ", matchTime=" + matchTime + ", noteStatus=" + noteStatus
				+ ", recipientNick=" + recipientNick + ", senderNick=" + senderNick + "]";
	}
}
