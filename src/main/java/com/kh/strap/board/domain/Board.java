package com.kh.strap.board.domain;

import java.sql.Date;

public class Board {
	private int boardNo;
	private String memberId;
	private String boardTitle;
	private String boardContents;
	private String boardCategory;
	private Date boardDate;
	private int boardCount;
	private int boardLike;
	private String bFileName;
	private String bFileRename;
	private String bFilePath;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContents() {
		return boardContents;
	}
	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}
	public String getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public String getbFileName() {
		return bFileName;
	}
	public void setbFileName(String bFileName) {
		this.bFileName = bFileName;
	}
	public String getbFileRename() {
		return bFileRename;
	}
	public void setbFileRename(String bFileRename) {
		this.bFileRename = bFileRename;
	}
	public String getbFilePath() {
		return bFilePath;
	}
	public void setbFilePath(String bFilePath) {
		this.bFilePath = bFilePath;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberId=" + memberId + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", boardCategory=" + boardCategory + ", boardDate=" + boardDate
				+ ", boardCount=" + boardCount + ", boardLike=" + boardLike + ", bFileName=" + bFileName
				+ ", bFileRename=" + bFileRename + ", bFilePath=" + bFilePath + "]";
	}
}
