package com.kh.strap.member.domain;

public class SimpleQnA {
	private int qnaNo;
	private String qnaTitle;
	private String ex1;
	private String ex2;
	private String ex3;
	private String ex4;
	private String ex5;
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getEx1() {
		return ex1;
	}
	public void setEx1(String ex1) {
		this.ex1 = ex1;
	}
	public String getEx2() {
		return ex2;
	}
	public void setEx2(String ex2) {
		this.ex2 = ex2;
	}
	public String getEx3() {
		return ex3;
	}
	public void setEx3(String ex3) {
		this.ex3 = ex3;
	}
	public String getEx4() {
		return ex4;
	}
	public void setEx4(String ex4) {
		this.ex4 = ex4;
	}
	public String getEx5() {
		return ex5;
	}
	public void setEx5(String ex5) {
		this.ex5 = ex5;
	}
	@Override
	public String toString() {
		return "SimpleQnA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", ex1=" + ex1 + ", ex2=" + ex2 + ", ex3=" + ex3
				+ ", ex4=" + ex4 + ", ex5=" + ex5 + "]";
	}
	
	
	
}
