package com.kh.strap.shop.cart.domain;

public class Cart {

	private int productNo;
	private String memberId;
	private String productName;
	private int price;
	private int productAmount;

	public Cart() {
	}

	public Cart(int productNo, String memberId, String productName, int price, int productAmount) {
		super();
		this.productNo = productNo;
		this.memberId = memberId;
		this.productName = productName;
		this.price = price;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	@Override
	public String toString() {
		return "Cart [productNo=" + productNo + ", memberId=" + memberId + ", productName=" + productName + ", price="
				+ price + ", productAmount=" + productAmount + "]";
	}

}
