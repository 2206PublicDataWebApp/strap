package com.kh.strap.shop.coupon.domain;

import java.sql.Date;

public class Coupon {
	
	private int couponNo; 				//쿠폰번호
	private String couponName;			//쿠폰이름
	private String couponDesc;			//쿠폰설명
	private int discountAmount;		//할인금액
	private int discountRatio;			//할인율
	private int priceCondition;		//쿠폰조건:최저구매금액
	private String brandCondition;		//쿠폰조건:브랜드
	private String firstCondition;		//쿠폰조건:첫구매
	private int couponPeriod;			//쿠폰유효기간(일 단위)
    private Date couponRegiDate;		//쿠폰 등록날짜
    private String productCondition;	//쿠폰조건:상품명
    private String couponRunYn;			//쿠폰운영여부
    private String memberId;           //멤버아이디,파라미터편의,setter로 추가
    private String couponImgRoot;		//쿠폰이미지 경로
    private String couponImgName;		//쿠폰이미지 이름
    private String couponImgRename;		//쿠폰이미지 
    
	private Date getCouponDate;
	private Date endCounponDate;
	private String useYn;
	

    
    
    public Coupon() {}




	public Coupon(int couponNo, String couponName, String couponDesc, int discountAmount, int discountRatio,
			int priceCondition, String brandCondition, String firstCondition, int couponPeriod, Date couponRegiDate,
			String productCondition, String couponRunYn, String memberId, String couponImgRoot, String couponImgName,
			String couponImgRename, Date getCouponDate, Date endCounponDate, String useYn) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.couponDesc = couponDesc;
		this.discountAmount = discountAmount;
		this.discountRatio = discountRatio;
		this.priceCondition = priceCondition;
		this.brandCondition = brandCondition;
		this.firstCondition = firstCondition;
		this.couponPeriod = couponPeriod;
		this.couponRegiDate = couponRegiDate;
		this.productCondition = productCondition;
		this.couponRunYn = couponRunYn;
		this.memberId = memberId;
		this.couponImgRoot = couponImgRoot;
		this.couponImgName = couponImgName;
		this.couponImgRename = couponImgRename;
		this.getCouponDate = getCouponDate;
		this.endCounponDate = endCounponDate;
		this.useYn = useYn;
	}




	public int getCouponNo() {
		return couponNo;
	}




	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}




	public String getCouponName() {
		return couponName;
	}




	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}




	public String getCouponDesc() {
		return couponDesc;
	}




	public void setCouponDesc(String couponDesc) {
		this.couponDesc = couponDesc;
	}




	public int getDiscountAmount() {
		return discountAmount;
	}




	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}




	public int getDiscountRatio() {
		return discountRatio;
	}




	public void setDiscountRatio(int discountRatio) {
		this.discountRatio = discountRatio;
	}




	public int getPriceCondition() {
		return priceCondition;
	}




	public void setPriceCondition(int priceCondition) {
		this.priceCondition = priceCondition;
	}




	public String getBrandCondition() {
		return brandCondition;
	}




	public void setBrandCondition(String brandCondition) {
		this.brandCondition = brandCondition;
	}




	public String getFirstCondition() {
		return firstCondition;
	}




	public void setFirstCondition(String firstCondition) {
		this.firstCondition = firstCondition;
	}




	public int getCouponPeriod() {
		return couponPeriod;
	}




	public void setCouponPeriod(int couponPeriod) {
		this.couponPeriod = couponPeriod;
	}




	public Date getCouponRegiDate() {
		return couponRegiDate;
	}




	public void setCouponRegiDate(Date couponRegiDate) {
		this.couponRegiDate = couponRegiDate;
	}




	public String getProductCondition() {
		return productCondition;
	}




	public void setProductCondition(String productCondition) {
		this.productCondition = productCondition;
	}




	public String getCouponRunYn() {
		return couponRunYn;
	}




	public void setCouponRunYn(String couponRunYn) {
		this.couponRunYn = couponRunYn;
	}




	public String getMemberId() {
		return memberId;
	}




	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}




	public String getCouponImgRoot() {
		return couponImgRoot;
	}




	public void setCouponImgRoot(String couponImgRoot) {
		this.couponImgRoot = couponImgRoot;
	}




	public String getCouponImgName() {
		return couponImgName;
	}




	public void setCouponImgName(String couponImgName) {
		this.couponImgName = couponImgName;
	}




	public String getCouponImgRename() {
		return couponImgRename;
	}




	public void setCouponImgRename(String couponImgRename) {
		this.couponImgRename = couponImgRename;
	}




	public Date getGetCouponDate() {
		return getCouponDate;
	}




	public void setGetCouponDate(Date getCouponDate) {
		this.getCouponDate = getCouponDate;
	}




	public Date getEndCounponDate() {
		return endCounponDate;
	}




	public void setEndCounponDate(Date endCounponDate) {
		this.endCounponDate = endCounponDate;
	}




	public String getUseYn() {
		return useYn;
	}




	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}




	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", couponName=" + couponName + ", couponDesc=" + couponDesc
				+ ", discountAmount=" + discountAmount + ", discountRatio=" + discountRatio + ", priceCondition="
				+ priceCondition + ", brandCondition=" + brandCondition + ", firstCondition=" + firstCondition
				+ ", couponPeriod=" + couponPeriod + ", couponRegiDate=" + couponRegiDate + ", productCondition="
				+ productCondition + ", couponRunYn=" + couponRunYn + ", memberId=" + memberId + ", couponImgRoot="
				+ couponImgRoot + ", couponImgName=" + couponImgName + ", couponImgRename=" + couponImgRename
				+ ", getCouponDate=" + getCouponDate + ", endCounponDate=" + endCounponDate + ", useYn=" + useYn + "]";
	}

    
	
    
	
}

