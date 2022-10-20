package com.kh.strap.notebox.domain;

import java.util.Date;

public class NoteChat {
	private int chatNo;
	private String recipientId;
	private String recipientNick;
	private String senderId;
	private String senderNick;
	private String chatContents;
	private Date senderDate;
	
	
	
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public String getRecipientId() {
		return recipientId;
	}
	public void setRecipientId(String recipientId) {
		this.recipientId = recipientId;
	}
	public String getRecipientNick() {
		return recipientNick;
	}
	public void setRecipientNick(String recipientNick) {
		this.recipientNick = recipientNick;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getSenderNick() {
		return senderNick;
	}
	public void setSenderNick(String senderNick) {
		this.senderNick = senderNick;
	}
	public String getChatContents() {
		return chatContents;
	}
	public void setChatContents(String chatContents) {
		this.chatContents = chatContents;
	}
	public Date getSenderDate() {
		return senderDate;
	}
	public void setSenderDate(Date senderDate) {
		this.senderDate = senderDate;
	}
	
	
	@Override
	public String toString() {
		return "NoteChat [chatNo=" + chatNo + ", recipientId=" + recipientId + ", recipientNick=" + recipientNick
				+ ", senderId=" + senderId + ", senderNick=" + senderNick + ", chatContents=" + chatContents
				+ ", senderDate=" + senderDate + "]";
	}
}
