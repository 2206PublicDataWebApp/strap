package com.kh.strap.shop.qna.domain;

import java.sql.Date;

public class ShopQna {

	private int qnaNo;				//문의번호
	private int productNo;			//상품번호
	private String qnaCode;			//문의코드
	private String qnaType;			//문의타입
	private String qnaTitle;		//문의제목
	private String qnaContents;		//문의내용
	private Date qEnrollDate;		//문의등록일
	private Date aEnrollDate;		//문의수정일
	private String answerStatus;	//문의 답변상태
	private String answerContents; //문의 답변
	private String secretStatus;   //비밀 여부
	private String memberId;		//회원 아이디

	public ShopQna() {
	}

	public ShopQna(int qnaNo, int productNo, String qnaCode, String qnaType, String qnaTitle, String qnaContents,
			Date qEnrollDate, String answerStatus, String answerContents, Date aEnrollDate, String secretStatus,
			String memberId) {
		super();
		this.qnaNo = qnaNo;
		this.productNo = productNo;
		this.qnaCode = qnaCode;
		this.qnaType = qnaType;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.qEnrollDate = qEnrollDate;
		this.answerStatus = answerStatus;
		this.answerContents = answerContents;
		this.aEnrollDate = aEnrollDate;
		this.secretStatus = secretStatus;
		this.memberId = memberId;
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

	public Date getaEnrollDate() {
		return aEnrollDate;
	}

	public void setaEnrollDate(Date aEnrollDate) {
		this.aEnrollDate = aEnrollDate;
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

	@Override
	public String toString() {
		return "ShopQna [qnaNo=" + qnaNo + ", productNo=" + productNo + ", qnaCode=" + qnaCode + ", qnaType=" + qnaType
				+ ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", qEnrollDate=" + qEnrollDate
				+ ", answerStatus=" + answerStatus + ", answerContents=" + answerContents + ", aEnrollDate="
				+ aEnrollDate + ", secretStatus=" + secretStatus + ", memberId=" + memberId + "]";
	}
	
	

	
}
