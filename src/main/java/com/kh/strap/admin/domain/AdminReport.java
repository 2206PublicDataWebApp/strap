package com.kh.strap.admin.domain;

import java.util.Date;

public class AdminReport {
	private int reportNo;					//1.신고 번호
	private int contentsNo;					//2.컨텐츠 번호
	private String contentsCode;			//3.컨텐츠 코드
	private String reportType;				//4.신고 타입
	private String reportMember;			//5.신고당한 멤버
	private String reportContents;			//6.신고당한 컨텐츠
	private Date reportDate;				//7.신고 날짜
	private String reportProcess;			//8.신고 처리
	private String contentsProcess;			//9.게시물 처리
	private String memberProcess;			//10.멤버 처리
	private String memberId;				//11.신고한 멤버 아이디
	private String memberNick;				//12.신고한 멤버 닉네임
	private String reportMemberNick;		//13.신고당한 멤버 닉네임
	private String joinReportType;			//14.문의 타입
	private String reportName;			//15.문의 타입명
	private String joinContentsCode;		//16.문의 코드
	private String contentsName;		//17.문의 코드명
	
	
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
		return contentsProcess;
	}
	public void setContentsProcess(String contentsProcess) {
		this.contentsProcess = contentsProcess;
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
	public String getJoinReportType() {
		return joinReportType;
	}
	public void setJoinReportType(String joinReportType) {
		this.joinReportType = joinReportType;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public String getJoinContentsCode() {
		return joinContentsCode;
	}
	public void setJoinContentsCode(String joinContentsCode) {
		this.joinContentsCode = joinContentsCode;
	}
	public String getContentsName() {
		return contentsName;
	}
	public void setContentsName(String contentsName) {
		this.contentsName = contentsName;
	}
	
	
	@Override
	public String toString() {
		return "AdminReport [reportNo=" + reportNo + ", contentsNo=" + contentsNo + ", contentsCode=" + contentsCode
				+ ", reportType=" + reportType + ", reportMember=" + reportMember + ", reportContents=" + reportContents
				+ ", reportDate=" + reportDate + ", reportProcess=" + reportProcess + ", contentsProcess="
				+ contentsProcess + ", memberProcess=" + memberProcess + ", memberId=" + memberId + ", memberNick="
				+ memberNick + ", reportMemberNick=" + reportMemberNick + ", joinReportType=" + joinReportType
				+ ", reportName=" + reportName + ", joinContentsCode=" + joinContentsCode + ", contentsName="
				+ contentsName + "]";
	}
}
