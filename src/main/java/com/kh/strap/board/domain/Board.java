package com.kh.strap.board.domain;

import java.sql.Date;

public class Board {
	private int boardNo; 			// 게시글 번호
	private String memberNick;	 	// 회원 닉네임
	private String boardTitle; 		// 게시글 제목
	private String boardContents;	// 게시글 내용
	private String boardCategory; 	// 게시글 카테고리
	private Date boardDate; 		// 작성 날짜
	private int boardCount; 		// 게시글 조회수
	private int boardLikeIt; 		// 게시글 추천
	private int fix;				// 공지사항과 커뮤니티 글을 구분하기위한 컬럼
	private String memberId; 		// 회원 아이디
	private int bRownum;
	
	public Board() {}

	public Board(int boardNo, String memberNick, String boardTitle, String boardContents, String boardCategory,
			Date boardDate, int boardCount, int boardLikeIt, int fix, String memberId, int bRownum) {
		super();
		this.boardNo = boardNo;
		this.memberNick = memberNick;
		this.boardTitle = boardTitle;
		this.boardContents = boardContents;
		this.boardCategory = boardCategory;
		this.boardDate = boardDate;
		this.boardCount = boardCount;
		this.boardLikeIt = boardLikeIt;
		this.fix = fix;
		this.memberId = memberId;
		this.bRownum = bRownum;
	}

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

	public int getFix() {
		return fix;
	}

	public void setFix(int fix) {
		this.fix = fix;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getbRownum() {
		return bRownum;
	}

	public void setbRownum(int bRownum) {
		this.bRownum = bRownum;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", memberNick=" + memberNick + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", boardCategory=" + boardCategory + ", boardDate=" + boardDate
				+ ", boardCount=" + boardCount + ", boardLikeIt=" + boardLikeIt + ", fix=" + fix + ", memberId="
				+ memberId + ", bRownum=" + bRownum + "]";
	}
}
