package com.kh.strap.board.domain;

import java.sql.Timestamp;

public class BoardReply {
	private int replyNo; 			// 댓글 번호
	private int boardNo; 			// 게시글 번호
	private int refReplyNo; 		// 답글 번호
	private String replyWriter; 	// 댓글 작성자
	private String replyContents; 	// 댓글 내용
	private Timestamp rCreateDate;	// 댓글, 답글 작성 날짜
	private Timestamp rUpdateDate;	// 작성된 댓글, 답글 수정 날짜
	private String rStatus; 		// N 삭제된 댓글에 답글X, Y 댓글에 답글O (DEFAULT)
	private String reReplyYn; 		// N 댓글 (DEFULT), Y 대댓글 구분
	
	public BoardReply() {}

	public BoardReply(int replyNo, int boardNo, int refReplyNo, String replyWriter, String replyContents,
			Timestamp rCreateDate, Timestamp rUpdateDate, String rStatus, String reReplyYn) {
		super();
		this.replyNo = replyNo;
		this.boardNo = boardNo;
		this.refReplyNo = refReplyNo;
		this.replyWriter = replyWriter;
		this.replyContents = replyContents;
		this.rCreateDate = rCreateDate;
		this.rUpdateDate = rUpdateDate;
		this.rStatus = rStatus;
		this.reReplyYn = reReplyYn;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getRefReplyNo() {
		return refReplyNo;
	}

	public void setRefReplyNo(int refReplyNo) {
		this.refReplyNo = refReplyNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public Timestamp getrCreateDate() {
		return rCreateDate;
	}

	public void setrCreateDate(Timestamp rCreateDate) {
		this.rCreateDate = rCreateDate;
	}

	public Timestamp getrUpdateDate() {
		return rUpdateDate;
	}

	public void setrUpdateDate(Timestamp rUpdateDate) {
		this.rUpdateDate = rUpdateDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getReReplyYn() {
		return reReplyYn;
	}

	public void setReReplyYn(String reReplyYn) {
		this.reReplyYn = reReplyYn;
	}

	@Override
	public String toString() {
		return "BoardReply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", refReplyNo=" + refReplyNo
				+ ", replyWriter=" + replyWriter + ", replyContents=" + replyContents + ", rCreateDate=" + rCreateDate
				+ ", rUpdateDate=" + rUpdateDate + ", rStatus=" + rStatus + ", reReplyYn=" + reReplyYn + "]";
	}
}
