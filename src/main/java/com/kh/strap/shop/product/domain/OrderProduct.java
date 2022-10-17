package com.kh.strap.shop.product.domain;

public class OrderProduct {

	private int orderNo;
	private int productNo;
	private int orderQty;
	
	public OrderProduct () {}

	public OrderProduct(int orderNo, int productNo, int orderQty) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.orderQty = orderQty;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	@Override
	public String toString() {
		return "OrderProduct [orderNo=" + orderNo + ", productNo=" + productNo + ", orderQty=" + orderQty + "]";
	}
	
	
}
