package com.kh.strap.admin.domain;

import java.util.Date;

public class Notice {
	private int noticeNo;				//1.공지사항 넘버
	private String noticeTitle;			//2.공지사항 제목
	private String noticeContents;		//3.공지사항 내용
	private String noticeWriter;		//4.공지사항 작성자
	private String noticeFilename;		//5.공지사항 파일 이름
	private String noticeFileRename;	//6.공지사항 파일 리네임
	private String noticeFilepath;		//7.공지사항 파일 경로
	private int noticeCount;			//8.공지사항 조회수
	private Date nCreateDate;			//9.공지사항 생성일
	private Date nUpdateDate;			//10.공지사항 수정일
	private String nStatus;				//11.공지사항 상태
	private int fix;					//12.공지사항 고정
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeFilename() {
		return noticeFilename;
	}
	public void setNoticeFilename(String noticeFilename) {
		this.noticeFilename = noticeFilename;
	}
	public String getNoticeFileRename() {
		return noticeFileRename;
	}
	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}
	public String getNoticeFilepath() {
		return noticeFilepath;
	}
	public void setNoticeFilepath(String noticeFilepath) {
		this.noticeFilepath = noticeFilepath;
	}
	public int getNoticeCount() {
		return noticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}
	public Date getnCreateDate() {
		return nCreateDate;
	}
	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}
	public Date getnUpdateDate() {
		return nUpdateDate;
	}
	public void setnUpdateDate(Date nUpdateDate) {
		this.nUpdateDate = nUpdateDate;
	}
	public String getnStatus() {
		return nStatus;
	}
	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}
	public int getFix() {
		return fix;
	}
	public void setFix(int fix) {
		this.fix = fix;
	}
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContents=" + noticeContents
				+ ", noticeWriter=" + noticeWriter + ", noticeFilename=" + noticeFilename + ", noticeFileRename="
				+ noticeFileRename + ", noticeFilepath=" + noticeFilepath + ", noticeCount=" + noticeCount
				+ ", nCreateDate=" + nCreateDate + ", nUpdateDate=" + nUpdateDate + ", nStatus=" + nStatus + ", fix="
				+ fix + "]";
	}
	
}
