package com.kh.strap.report.domain;

import java.util.Date;

public class Report {
	private int reportNo;
	private int contentsNo;
	private String contentsCode;
	private String reportType;
	private String reportMember;
	private String reportContents;
	private Date reportDate;
	private String reportProcess;
	private String ContentsProcess;
	private String memberProcess;
	private String memberId;
	private String memberNick;
	private String reportMemberNick;
	
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}
	public String getContentsCode() {
		return contentsCode;
	}
	public void setContentsCode(String contentsCode) {
		this.contentsCode = contentsCode;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportMember() {
		return reportMember;
	}
	public void setReportMember(String reportMember) {
		this.reportMember = reportMember;
	}
	public String getReportContents() {
		return reportContents;
	}
	public void setReportContents(String reportContents) {
		this.reportContents = reportContents;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportProcess() {
		return reportProcess;
	}
	public void setReportProcess(String reportProcess) {
		this.reportProcess = reportProcess;
	}
	public String getContentsProcess() {
		return ContentsProcess;
	}
	public void setContentsProcess(String contentsProcess) {
		ContentsProcess = contentsProcess;
	}
	public String getMemberProcess() {
		return memberProcess;
	}
	public void setMemberProcess(String memberProcess) {
		this.memberProcess = memberProcess;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getReportMemberNick() {
		return reportMemberNick;
	}
	public void setReportMemberNick(String reportMemberNick) {
		this.reportMemberNick = reportMemberNick;
	}
	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", contentsNo=" + contentsNo + ", contentsCode=" + contentsCode
				+ ", reportType=" + reportType + ", reportMember=" + reportMember + ", reportContents=" + reportContents
				+ ", reportDate=" + reportDate + ", reportProcess=" + reportProcess + ", ContentsProcess="
				+ ContentsProcess + ", memberProcess=" + memberProcess + ", memberId=" + memberId + ", memberNick="
				+ memberNick + ", reportMemberNick=" + reportMemberNick + "]";
	}
}
