package com.kh.strap.shop.product.domain;

public class ProductSubImg {
	private int imgNo;
	private int productNo;
	private String subName;
	private String subReName;
	private String subRoot;

	public ProductSubImg() {}
	
	public ProductSubImg(String subName, String subReName, String subRoot) {
		super();
		this.subName = subName;
		this.subReName = subReName;
		this.subRoot = subRoot;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubReName() {
		return subReName;
	}

	public void setSubReName(String subReName) {
		this.subReName = subReName;
	}

	public String getSubRoot() {
		return subRoot;
	}

	public void setSubRoot(String subRoot) {
		this.subRoot = subRoot;
	}

	@Override
	public String toString() {
		return "ProductSubImg [imgNo=" + imgNo + ", productNo=" + productNo + ", subName=" + subName + ", subReName="
				+ subReName + ", subRoot=" + subRoot + "]";
	}

}
