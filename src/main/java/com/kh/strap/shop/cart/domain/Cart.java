package com.kh.strap.shop.cart.domain;

import com.kh.strap.shop.product.domain.Product;

public class Cart {

	private Product product;
	private int productNo;
	private String memberId;
	private int productAmount;
	private String cartCheck;

	public Cart() {
	}

	public Cart(Product product, int productNo, String memberId, int productAmount, String cartCheck) {
		super();
		this.product = product;
		this.productNo = productNo;
		this.memberId = memberId;
		this.productAmount = productAmount;
		this.cartCheck = cartCheck;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

	public String getCartCheck() {
		return cartCheck;
	}

	public void setCartCheck(String cartCheck) {
		this.cartCheck = cartCheck;
	}

	@Override
	public String toString() {
		return "Cart [product=" + product + ", productNo=" + productNo + ", memberId=" + memberId + ", productAmount="
				+ productAmount + ", cartCheck=" + cartCheck + "]";
	}
}
