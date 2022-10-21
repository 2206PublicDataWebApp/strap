package com.kh.strap.shop.review.domain;

import java.sql.Date;

import com.kh.strap.shop.product.domain.Product;

public class Review {

	private Product product;
	private int reviewNo;
	private String memberId;
	private String memberNick;
	private String reviewContents;
	private String reviewImgName;
	private String reviewImgRename;
	private String reviewImgRoot;
	private Date reviewTime;
	private int reviewGrade;
	private int productNo;
	
	
	public Review() {}


	public Review(Product product, int reviewNo, String memberId, String memberNick, String reviewContents,
			String reviewImgName, String reviewImgRename, String reviewImgRoot, Date reviewTime, int reviewGrade,
			int productNo) {
		super();
		this.product = product;
		this.reviewNo = reviewNo;
		this.memberId = memberId;
		this.memberNick = memberNick;
		this.reviewContents = reviewContents;
		this.reviewImgName = reviewImgName;
		this.reviewImgRename = reviewImgRename;
		this.reviewImgRoot = reviewImgRoot;
		this.reviewTime = reviewTime;
		this.reviewGrade = reviewGrade;
		this.productNo = productNo;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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


	public String getReviewContents() {
		return reviewContents;
	}


	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}


	public String getReviewImgName() {
		return reviewImgName;
	}


	public void setReviewImgName(String reviewImgName) {
		this.reviewImgName = reviewImgName;
	}


	public String getReviewImgRename() {
		return reviewImgRename;
	}


	public void setReviewImgRename(String reviewImgRename) {
		this.reviewImgRename = reviewImgRename;
	}


	public String getReviewImgRoot() {
		return reviewImgRoot;
	}


	public void setReviewImgRoot(String reviewImgRoot) {
		this.reviewImgRoot = reviewImgRoot;
	}


	public Date getReviewTime() {
		return reviewTime;
	}


	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}


	public int getReviewGrade() {
		return reviewGrade;
	}


	public void setReviewGrade(int reviewGrade) {
		this.reviewGrade = reviewGrade;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	@Override
	public String toString() {
		return "Review [product=" + product + ", reviewNo=" + reviewNo + ", memberId=" + memberId + ", memberNick="
				+ memberNick + ", reviewContents=" + reviewContents + ", reviewImgName=" + reviewImgName
				+ ", reviewImgRename=" + reviewImgRename + ", reviewImgRoot=" + reviewImgRoot + ", reviewTime="
				+ reviewTime + ", reviewGrade=" + reviewGrade + ", productNo=" + productNo + "]";
	}
	
}
