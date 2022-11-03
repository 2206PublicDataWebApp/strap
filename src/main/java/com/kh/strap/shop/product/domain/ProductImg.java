package com.kh.strap.shop.product.domain;

public class ProductImg {
	private int imgNo;
	private int productNo;
	private String imgName;
	private String imgReName;
	private String imgRoot;

	public ProductImg() {
	}

	public ProductImg(String imgName, String imgReName, String imgRoot) {
		super();
		this.imgName = imgName;
		this.imgReName = imgReName;
		this.imgRoot = imgRoot;
	}

	
	
	public ProductImg(int productNo, String imgName, String imgReName, String imgRoot) {
		super();
		this.productNo = productNo;
		this.imgName = imgName;
		this.imgReName = imgReName;
		this.imgRoot = imgRoot;
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

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgReName() {
		return imgReName;
	}

	public void setImgReName(String imgReName) {
		this.imgReName = imgReName;
	}

	public String getImgRoot() {
		return imgRoot;
	}

	public void setImgRoot(String imgRoot) {
		this.imgRoot = imgRoot;
	}

	@Override
	public String toString() {
		return "ProductSubImg [imgNo=" + imgNo + ", productNo=" + productNo + ", imgName=" + imgName + ", imgReName="
				+ imgReName + ", imgRoot=" + imgRoot + "]";
	}
}
