package com.kh.strap.admin.domain;

import java.util.Date;

public class AdminQna {
	private int qnaNo;				//1.문의 번호
	private int productNo;			//2.상품 번호
	private String qnaCode;			//3.문의 코드
	private String qnaType;			//4.문의 타입
	private String qnaTitle;		//5.문의 제목
	private String qnaContents;		//6.문의 제목
	private Date qEnrollDate;		//7.문의 등록일
	private Date aEnrollDate;		//8.답변 수정일
	private String answerStatus;	//9.답변 상태
	private String answerContents;	//10.답변 내용
	private String secretStatus;	//11.비밀 상태
	private String memberId;		//12.문의 작성자 아이디
	private String memberNick;		//13.문의 작성자 닉네임
	private String reportType;		//14.문의 타입 
	private String reportName;		//15.문의 타입명
	private String contentsCode;	//16.문의 코드
	private String contentsName;	//17.문의 코드명
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getQnaCode() {
		return qnaCode;
	}
	public void setQnaCode(String qnaCode) {
		this.qnaCode = qnaCode;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public Date getqEnrollDate() {
		return qEnrollDate;
	}
	public void setqEnrollDate(Date qEnrollDate) {
		this.qEnrollDate = qEnrollDate;
	}
	public Date getaEnrollDate() {
		return aEnrollDate;
	}
	public void setaEnrollDate(Date aEnrollDate) {
		this.aEnrollDate = aEnrollDate;
	}
	public String getAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
	public String getAnswerContents() {
		return answerContents;
	}
	public void setAnswerContents(String answerContents) {
		this.answerContents = answerContents;
	}
	public String getSecretStatus() {
		return secretStatus;
	}
	public void setSecretStatus(String secretStatus) {
		this.secretStatus = secretStatus;
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
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	public String getContentsCode() {
		return contentsCode;
	}
	public void setContentsCode(String contentsCode) {
		this.contentsCode = contentsCode;
	}
	public String getContentsName() {
		return contentsName;
	}
	public void setContentsName(String contentsName) {
		this.contentsName = contentsName;
	}
	
	@Override
	public String toString() {
		return "AdminQna [qnaNo=" + qnaNo + ", productNo=" + productNo + ", qnaCode=" + qnaCode + ", qnaType=" + qnaType
				+ ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", qEnrollDate=" + qEnrollDate
				+ ", aEnrollDate=" + aEnrollDate + ", answerStatus=" + answerStatus + ", answerContents="
				+ answerContents + ", secretStatus=" + secretStatus + ", memberId=" + memberId + ", memberNick="
				+ memberNick + ", reportType=" + reportType + ", reportName=" + reportName + ", contentsCode="
				+ contentsCode + ", contentsName=" + contentsName + "]";
	}
	
}
