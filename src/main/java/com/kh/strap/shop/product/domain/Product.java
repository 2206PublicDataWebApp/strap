package com.kh.strap.shop.product.domain;

import java.sql.Date;

public class Product {

	private int productNo;					//상품번호
	private String productName;				//상품이름
	private String productBrand;			//상품브랜드
	private int productPrice;				//상품가격
	private String productDesc;				//상품설명
	private int gradeSum;					//상품 평점 합계
	private Date productRegiDate;			//상품 등록일
	private Date productModiDate;			//상품 수정일
	private int productSales;				//상품 판매량
	private String mainImgName;				//메인이미지 이름
	private String firstSubImgName;			//첫번째 서브이미지 이름
	private String secondSubImgName;		//두번째 서브이미지 이름
	private String thirdSubImgName;			//세번째 서브이미지 이름
	private String fourthSubImgName;		//네번째 서브이미지 이름
	private String infoImgName;				//긴 이미지 이름
	private String mainImgReName;			//메인이미지 저장이름
	private String firstSubImgReName;		//첫번째 서브이미지 저장이름
	private String secondSubImgReName;		//두번째 서브이미지 저장이름
	private String thirdSubImgReName;		//세번째 서브이미지 저장이름
	private String fourthSubImgReName;		//네번째 서브이미지 저장이름
	private String infoImgReName;			//긴 이미지 저장이름
	private String mainImgRoot;				//메인이미지 경로
	private String firstSubImgRoot;			//첫번째 서브이미지 경로
	private String secondSubImgRoot;		//두번째 서브이미지 경로
	private String thirdSubImgRoot;			//세번째 서브이미지 경로
	private String fourthSubImgRoot;		//네번째 서브이미지 경로
	private String infoImgRoot;				//메인이미지 경로
	private String couponList;				//쿠폰 리스트
	private String productDelete;  			//상품 삭제여부

	public Product() {
	}

	public Product(int productNo, String productName, String productBrand, int productPrice, String productDesc,
			int gradeSum, Date productRegiDate, Date productModiDate, int productSales, String mainImgName,
			String firstSubImgName, String secondSubImgName, String thirdSubImgName, String fourthSubImgName,
			String infoImgName, String mainImgReName, String firstSubImgReName, String secondSubImgReName,
			String thirdSubImgReName, String fourthSubImgReName, String infoImgReName, String mainImgRoot,
			String firstSubImgRoot, String secondSubImgRoot, String thirdSubImgRoot, String fourthSubImgRoot,
			String infoImgRoot, String couponList, String productDelete) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productBrand = productBrand;
		this.productPrice = productPrice;
		this.productDesc = productDesc;
		this.gradeSum = gradeSum;
		this.productRegiDate = productRegiDate;
		this.productModiDate = productModiDate;
		this.productSales = productSales;
		this.mainImgName = mainImgName;
		this.firstSubImgName = firstSubImgName;
		this.secondSubImgName = secondSubImgName;
		this.thirdSubImgName = thirdSubImgName;
		this.fourthSubImgName = fourthSubImgName;
		this.infoImgName = infoImgName;
		this.mainImgReName = mainImgReName;
		this.firstSubImgReName = firstSubImgReName;
		this.secondSubImgReName = secondSubImgReName;
		this.thirdSubImgReName = thirdSubImgReName;
		this.fourthSubImgReName = fourthSubImgReName;
		this.infoImgReName = infoImgReName;
		this.mainImgRoot = mainImgRoot;
		this.firstSubImgRoot = firstSubImgRoot;
		this.secondSubImgRoot = secondSubImgRoot;
		this.thirdSubImgRoot = thirdSubImgRoot;
		this.fourthSubImgRoot = fourthSubImgRoot;
		this.infoImgRoot = infoImgRoot;
		this.couponList = couponList;
		this.productDelete = productDelete;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductBrand() {
		return productBrand;
	}

	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public int getGradeSum() {
		return gradeSum;
	}

	public void setGradeSum(int gradeSum) {
		this.gradeSum = gradeSum;
	}

	public Date getProductRegiDate() {
		return productRegiDate;
	}

	public void setProductRegiDate(Date productRegiDate) {
		this.productRegiDate = productRegiDate;
	}

	public Date getProductModiDate() {
		return productModiDate;
	}

	public void setProductModiDate(Date productModiDate) {
		this.productModiDate = productModiDate;
	}

	public int getProductSales() {
		return productSales;
	}

	public void setProductSales(int productSales) {
		this.productSales = productSales;
	}

	public String getMainImgName() {
		return mainImgName;
	}

	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}

	public String getFirstSubImgName() {
		return firstSubImgName;
	}

	public void setFirstSubImgName(String firstSubImgName) {
		this.firstSubImgName = firstSubImgName;
	}

	public String getSecondSubImgName() {
		return secondSubImgName;
	}

	public void setSecondSubImgName(String secondSubImgName) {
		this.secondSubImgName = secondSubImgName;
	}

	public String getThirdSubImgName() {
		return thirdSubImgName;
	}

	public void setThirdSubImgName(String thirdSubImgName) {
		this.thirdSubImgName = thirdSubImgName;
	}

	public String getFourthSubImgName() {
		return fourthSubImgName;
	}

	public void setFourthSubImgName(String fourthSubImgName) {
		this.fourthSubImgName = fourthSubImgName;
	}

	public String getInfoImgName() {
		return infoImgName;
	}

	public void setInfoImgName(String infoImgName) {
		this.infoImgName = infoImgName;
	}

	public String getMainImgReName() {
		return mainImgReName;
	}

	public void setMainImgReName(String mainImgReName) {
		this.mainImgReName = mainImgReName;
	}

	public String getFirstSubImgReName() {
		return firstSubImgReName;
	}

	public void setFirstSubImgReName(String firstSubImgReName) {
		this.firstSubImgReName = firstSubImgReName;
	}

	public String getSecondSubImgReName() {
		return secondSubImgReName;
	}

	public void setSecondSubImgReName(String secondSubImgReName) {
		this.secondSubImgReName = secondSubImgReName;
	}

	public String getThirdSubImgReName() {
		return thirdSubImgReName;
	}

	public void setThirdSubImgReName(String thirdSubImgReName) {
		this.thirdSubImgReName = thirdSubImgReName;
	}

	public String getFourthSubImgReName() {
		return fourthSubImgReName;
	}

	public void setFourthSubImgReName(String fourthSubImgReName) {
		this.fourthSubImgReName = fourthSubImgReName;
	}

	public String getInfoImgReName() {
		return infoImgReName;
	}

	public void setInfoImgReName(String infoImgReName) {
		this.infoImgReName = infoImgReName;
	}

	public String getMainImgRoot() {
		return mainImgRoot;
	}

	public void setMainImgRoot(String mainImgRoot) {
		this.mainImgRoot = mainImgRoot;
	}

	public String getFirstSubImgRoot() {
		return firstSubImgRoot;
	}

	public void setFirstSubImgRoot(String firstSubImgRoot) {
		this.firstSubImgRoot = firstSubImgRoot;
	}

	public String getSecondSubImgRoot() {
		return secondSubImgRoot;
	}

	public void setSecondSubImgRoot(String secondSubImgRoot) {
		this.secondSubImgRoot = secondSubImgRoot;
	}

	public String getThirdSubImgRoot() {
		return thirdSubImgRoot;
	}

	public void setThirdSubImgRoot(String thirdSubImgRoot) {
		this.thirdSubImgRoot = thirdSubImgRoot;
	}

	public String getFourthSubImgRoot() {
		return fourthSubImgRoot;
	}

	public void setFourthSubImgRoot(String fourthSubImgRoot) {
		this.fourthSubImgRoot = fourthSubImgRoot;
	}

	public String getInfoImgRoot() {
		return infoImgRoot;
	}

	public void setInfoImgRoot(String infoImgRoot) {
		this.infoImgRoot = infoImgRoot;
	}

	public String getCouponList() {
		return couponList;
	}

	public void setCouponList(String couponList) {
		this.couponList = couponList;
	}

	public String getProductDelete() {
		return productDelete;
	}

	public void setProductDelete(String productDelete) {
		this.productDelete = productDelete;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productBrand=" + productBrand
				+ ", productPrice=" + productPrice + ", productDesc=" + productDesc + ", gradeSum=" + gradeSum
				+ ", productRegiDate=" + productRegiDate + ", productModiDate=" + productModiDate + ", productSales="
				+ productSales + ", mainImgName=" + mainImgName + ", firstSubImgName=" + firstSubImgName
				+ ", secondSubImgName=" + secondSubImgName + ", thirdSubImgName=" + thirdSubImgName
				+ ", fourthSubImgName=" + fourthSubImgName + ", infoImgName=" + infoImgName + ", mainImgReName="
				+ mainImgReName + ", firstSubImgReName=" + firstSubImgReName + ", secondSubImgReName="
				+ secondSubImgReName + ", thirdSubImgReName=" + thirdSubImgReName + ", fourthSubImgReName="
				+ fourthSubImgReName + ", infoImgReName=" + infoImgReName + ", mainImgRoot=" + mainImgRoot
				+ ", firstSubImgRoot=" + firstSubImgRoot + ", secondSubImgRoot=" + secondSubImgRoot
				+ ", thirdSubImgRoot=" + thirdSubImgRoot + ", fourthSubImgRoot=" + fourthSubImgRoot + ", infoImgRoot="
				+ infoImgRoot + ", couponList=" + couponList + ", productDelete=" + productDelete + "]";
	}

}
