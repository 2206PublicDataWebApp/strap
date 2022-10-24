package com.kh.strap.shop.cart.domain;

public class Cart {

	private int productNo;
	private String memberId;
	private int productAmount;

	public Cart() {
	}

	public Cart(int productNo, String memberId, int productAmount) {
		super();
		this.productNo = productNo;
		this.memberId = memberId;
		this.productAmount = productAmount;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	@Override
	public String toString() {
		return "Cart [productNo=" + productNo + ", memberId=" + memberId + ", productAmount=" + productAmount + "]";
	}

	
	
}
