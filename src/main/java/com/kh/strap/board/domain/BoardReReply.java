package com.kh.strap.board.domain;

import java.sql.Date;

public class BoardReReply {
	private int reReplyNo;
	private int replyNo;
	private int BoardNo;
	private String reReplyContents;
	private String MemberNick;
	private Date reReplyDate;
	
	public int getReReplyNo() {
		return reReplyNo;
	}
	public void setReReplyNo(int reReplyNo) {
		this.reReplyNo = reReplyNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return BoardNo;
	}
	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
	}
	public String getReReplyContents() {
		return reReplyContents;
	}
	public void setReReplyContents(String reReplyContents) {
		this.reReplyContents = reReplyContents;
	}
	public String getMemberNick() {
		return MemberNick;
	}
	public void setMemberNick(String memberNick) {
		MemberNick = memberNick;
	}
	public Date getReReplyDate() {
		return reReplyDate;
	}
	public void setReReplyDate(Date reReplyDate) {
		this.reReplyDate = reReplyDate;
	}
	
	@Override
	public String toString() {
		return "BoardReReply [reReplyNo=" + reReplyNo + ", replyNo=" + replyNo + ", BoardNo=" + BoardNo
				+ ", reReplyContents=" + reReplyContents + ", MemberNick=" + MemberNick + ", reReplyDate=" + reReplyDate
				+ "]";
	} 
}
