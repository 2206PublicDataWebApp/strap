package com.kh.strap.member.domain;

public class SimpleAnswer {
	private String memberId;
	private int qnaNo;
	private String qnaAnswer;
	
	//조인용으로 가져올 Title을 위해 필드 추가
	private String qnaTitle;
	
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	@Override
	public String toString() {
		return "SimpleAnswer [memberId=" + memberId + ", qnaNo=" + qnaNo + ", qnaAnswer=" + qnaAnswer + ", qnaTitle="
				+ qnaTitle + "]";
	}
	
	
	
}
