package com.kh.strap.board.domain;

import java.sql.Date;

public class BoardReply {
	private int replyNo;	
	private int BoardNo;   	 
	private String replyContents;	
	private String memberNick;		
	private Date replyDate;  	
	private int replyDepth; 		
	private String replyGroup;
	
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
	public String getReplyContents() {
		return replyContents;
	}
	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public int getReplyDepth() {
		return replyDepth;
	}
	public void setReplyDepth(int replyDepth) {
		this.replyDepth = replyDepth;
	}
	public String getReplyGroup() {
		return replyGroup;
	}
	public void setReplyGroup(String replyGroup) {
		this.replyGroup = replyGroup;
	}
	
	@Override
	public String toString() {
		return "BoardReply [replyNo=" + replyNo + ", BoardNo=" + BoardNo + ", replyContents=" + replyContents
				+ ", memberNick=" + memberNick + ", replyDate=" + replyDate + ", replyDepth=" + replyDepth
				+ ", replyGroup=" + replyGroup + "]";
	}
}
