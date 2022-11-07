package com.kh.strap.board.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardReply {
	private int rReplyNo;
	private int boardNo;
	private int rRefReplyNo;
	private String rReplyWriter;
	private String rReplyContents;
	private Timestamp rrCreateDate;
	private Timestamp rrUpdateDate;
	private String rrStatus;
	private String reReplyYn;
	
	public BoardReply() {}

	public BoardReply(int rReplyNo, int boardNo, int rRefReplyNo, String rReplyWriter, String rReplyContents,
			Timestamp rrCreateDate, Timestamp rrUpdateDate, String rrStatus, String reReplyYn) {
		super();
		this.rReplyNo = rReplyNo;
		this.boardNo = boardNo;
		this.rRefReplyNo = rRefReplyNo;
		this.rReplyWriter = rReplyWriter;
		this.rReplyContents = rReplyContents;
		this.rrCreateDate = rrCreateDate;
		this.rrUpdateDate = rrUpdateDate;
		this.rrStatus = rrStatus;
		this.reReplyYn = reReplyYn;
	}

	public int getrReplyNo() {
		return rReplyNo;
	}

	public void setrReplyNo(int rReplyNo) {
		this.rReplyNo = rReplyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getrRefReplyNo() {
		return rRefReplyNo;
	}

	public void setrRefReplyNo(int rRefReplyNo) {
		this.rRefReplyNo = rRefReplyNo;
	}

	public String getrReplyWriter() {
		return rReplyWriter;
	}

	public void setrReplyWriter(String rReplyWriter) {
		this.rReplyWriter = rReplyWriter;
	}

	public String getrReplyContents() {
		return rReplyContents;
	}

	public void setrReplyContents(String rReplyContents) {
		this.rReplyContents = rReplyContents;
	}

	public Timestamp getRrCreateDate() {
		return rrCreateDate;
	}

	public void setRrCreateDate(Timestamp rrCreateDate) {
		this.rrCreateDate = rrCreateDate;
	}

	public Timestamp getRrUpdateDate() {
		return rrUpdateDate;
	}

	public void setRrUpdateDate(Timestamp rrUpdateDate) {
		this.rrUpdateDate = rrUpdateDate;
	}

	public String getRrStatus() {
		return rrStatus;
	}

	public void setRrStatus(String rrStatus) {
		this.rrStatus = rrStatus;
	}

	public String getReReplyYn() {
		return reReplyYn;
	}

	public void setReReplyYn(String reReplyYn) {
		this.reReplyYn = reReplyYn;
	}

	@Override
	public String toString() {
		return "ReviewReply [rReplyNo=" + rReplyNo + ", boardNo=" + boardNo + ", rRefReplyNo=" + rRefReplyNo
				+ ", rReplyWriter=" + rReplyWriter + ", rReplyContents=" + rReplyContents + ", rrCreateDate="
				+ rrCreateDate + ", rrUpdateDate=" + rrUpdateDate + ", rrStatus=" + rrStatus + ", reReplyYn="
				+ reReplyYn + "]";
	}
}
