package com.kh.strap.shop.product.domain;

public class ProductLike {

	private int productNo;		//상품번호
	private String memberId;	//회원아이디
	
	public ProductLike() {}
	
	public ProductLike(int productNo, String memberId) {
		super();
		this.productNo = productNo;
		this.memberId = memberId;
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
	@Override
	public String toString() {
		return "ProductLike [productNo=" + productNo + ", memberId=" + memberId + "]";
	}
	
	
	
}
