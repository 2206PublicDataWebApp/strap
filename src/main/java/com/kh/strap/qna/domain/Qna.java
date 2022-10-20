package com.kh.strap.qna.domain;

import java.sql.Date;

public class Qna {

	private int qnaNo;
	private int productNo;
	private String qnaCode;
	private String qnaType;
	private String qnaTitle;
	private String qnaContents;
	private Date qEnrollDate;
	private Date aEnrollDate;
	private String answerStatus;
	private String answerContents;
	private String secretStatus;
	private String memberId;
	private String memberNick;
	
	public Qna() {}
	
	public Qna(int qnaNo, int productNo, String qnaCode, String qnaType, String qnaTitle, String qnaContents,
			Date qEnrollDate, Date aEnrollDate, String answerStatus, String answerContents, String secretStatus,
			String memberId, String memberNick) {
		super();
		this.qnaNo = qnaNo;
		this.productNo = productNo;
		this.qnaCode = qnaCode;
		this.qnaType = qnaType;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.qEnrollDate = qEnrollDate;
		this.aEnrollDate = aEnrollDate;
		this.answerStatus = answerStatus;
		this.answerContents = answerContents;
		this.secretStatus = secretStatus;
		this.memberId = memberId;
		this.memberNick = memberNick;
	}
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
	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", productNo=" + productNo + ", qnaCode=" + qnaCode + ", qnaType=" + qnaType
				+ ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", qEnrollDate=" + qEnrollDate
				+ ", aEnrollDate=" + aEnrollDate + ", answerStatus=" + answerStatus + ", answerContents="
				+ answerContents + ", secretStatus=" + secretStatus + ", memberId=" + memberId + ", memberNick="
				+ memberNick + "]";
	}

	
}
