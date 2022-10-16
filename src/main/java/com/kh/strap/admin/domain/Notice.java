package com.kh.strap.admin.domain;

import java.util.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContents;
	private String noticeWriter;
	private String noticeFilename;
	private String noticeFileRename;
	private String noticeFilepath;
	private int noticeCount;
	private Date nCreateDate;
	private Date nUpdateDate;
	private String nStatus;
	
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
	
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContents=" + noticeContents
				+ ", noticeWriter=" + noticeWriter + ", noticeFilename=" + noticeFilename + ", noticeFileRename="
				+ noticeFileRename + ", noticeFilepath=" + noticeFilepath + ", noticeCount=" + noticeCount
				+ ", nCreateDate=" + nCreateDate + ", nUpdateDate=" + nUpdateDate + ", nStatus=" + nStatus + "]";
	}
	
}
