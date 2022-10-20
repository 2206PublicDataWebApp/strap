package com.kh.strap.board.domain;

import java.sql.Date;

public class Board {
	private int boardNo; 			// 게시글 번호
	private String memberNick;	 	// 작성자
	private String boardTitle; 		// 게시글 제목
	private String boardContents;	// 게시글 내용
	private String boardCategory; 	// 게시글 카테고리
	private String bFileName; 		// 파일 이름
	private String bFileRename; 	// 변경된 파일 이름
	private String bFilePath; 		// 파일 경로
	private Date boardDate; 		// 작성 날짜
	private int boardCount; 		// 게시글 조회수
	private int boardLikeIt; 			// 게시글 추천
	// private int boardBad; 			// 게시글 추천
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
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
	public int getBoardLikeIt() {
		return boardLikeIt;
	}
	public void setBoardLikeIt(int boardLikeIt) {
		this.boardLikeIt = boardLikeIt;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNick=" + memberNick + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", boardCategory=" + boardCategory + ", bFileName=" + bFileName
				+ ", bFileRename=" + bFileRename + ", bFilePath=" + bFilePath + ", boardDate=" + boardDate
				+ ", boardCount=" + boardCount + ", boardLikeIt=" + boardLikeIt + "]";
	}
}
