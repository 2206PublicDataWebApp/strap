package com.kh.strap.shop.qna.domain;

import java.sql.Date;

import com.kh.strap.shop.product.domain.Product;

public class ShopQna {
	
	private Product product; 		//문의달린상품
	private int qnaNo;				//문의번호 시퀀스
	private int productNo;			//상품번호 
	private String qnaCode;			//문의코드 QC2QT1(주문/결제)QC2QT2(배송)QC2QT3(취소/반품/교환)QC2QT4(기타)
	private String qnaType;			//문의타입
	private String qnaTitle;		//문의제목
	private String qnaContents;		//문의내용
	private Date qEnrollDate;		//문의등록일 디폴트
	private Date aEnrollDate;		//문의수정일 디폴트
	private String answerStatus;	//문의 답변상태 디폴트
	private String answerContents; //문의 답변 
	private String secretStatus;   //비밀 여부 디폴트
	private String memberId;		//회원 아이디
	private String memberNick;     //회원 닉네임
	public ShopQna() {
	}
	public ShopQna(Product product, int qnaNo, int productNo, String qnaCode, String qnaType, String qnaTitle,
			String qnaContents, Date qEnrollDate, Date aEnrollDate, String answerStatus, String answerContents,
			String secretStatus, String memberId, String memberNick) {
		super();
		this.product = product;
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
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
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
		return "ShopQna [product=" + product + ", qnaNo=" + qnaNo + ", productNo=" + productNo + ", qnaCode=" + qnaCode
				+ ", qnaType=" + qnaType + ", qnaTitle=" + qnaTitle + ", qnaContents=" + qnaContents + ", qEnrollDate="
				+ qEnrollDate + ", aEnrollDate=" + aEnrollDate + ", answerStatus=" + answerStatus + ", answerContents="
				+ answerContents + ", secretStatus=" + secretStatus + ", memberId=" + memberId + ", memberNick="
				+ memberNick + "]";
	}
	
	
	
}
