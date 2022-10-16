package com.kh.strap.shop.coupon.domain;

import java.sql.Date;

public class MemberCoupon {

	private int couponNo;
	private String memberId;
	private Date getCouponDate;
	private Date endCounponDate;
	private String useYn;

	public MemberCoupon() {
	}

	public MemberCoupon(int couponNo, String memberId, Date getCouponDate, Date endCounponDate, String useYn) {
		super();
		this.couponNo = couponNo;
		this.memberId = memberId;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		return "MemberCoupon [couponNo=" + couponNo + ", memberId=" + memberId + ", getCouponDate=" + getCouponDate
				+ ", endCounponDate=" + endCounponDate + ", useYn=" + useYn + "]";
	}

}
