package com.kh.strap.shop.product.domain;

import java.sql.Date;
import java.util.List;

import com.kh.strap.member.domain.Member;

public class Order {
	
	private List<Product> buyProducts;  	//주문 상품 정보
	private List<OrderProduct> orderProducts; //주문 상품리스트
	private Member member;					//주문에 멤버가 있음
	private int orderNo;					//주문번호
	private int payNo;						//결제번호
	private int productNo;					//상품번호
	private int deliveryFee;				//배송료
	private int couponNo;					//쿠폰번호
	private int discountAmount;			//할인액
	private int finalCost;					//최종결제금액
	private String memberId;				//회원아이디
	private String address;					//주소
	private String contactPhone;			//배송연락처
	private String deliveryRequest;			//배송요청
	private String agreeYn;					//동의여부
	private String paymentMethod;			//결제수단
	private String cardKind;				//카드종류
	private int monthlyPay;				//할부
	private String bankKind;				//은행종류
	private String bankPayerName;			//입금자명
	private String payComplete;				//결제완료여부
	private String orderCancel;				//주문취소여부
	private String orderBack;				//주문환불여부
	private String deliveryStart;			//배송시작여부
	private String deliveryComplete;		//배송완료여부
	private String deliveryNo;				//운송장번호
	private Date orderDate;					//주문일
	
	public Order() {}

	public Order(List<Product> buyProducts, List<OrderProduct> orderProducts, Member member, int orderNo, int payNo,
			int productNo, int deliveryFee, int couponNo, int discountAmount, int finalCost, String memberId,
			String address, String contactPhone, String deliveryRequest, String agreeYn, String paymentMethod,
			String cardKind, int monthlyPay, String bankKind, String bankPayerName, String payComplete,
			String orderCancel, String orderBack, String deliveryStart, String deliveryComplete, String deliveryNo,
			Date orderDate) {
		super();
		this.buyProducts = buyProducts;
		this.orderProducts = orderProducts;
		this.member = member;
		this.orderNo = orderNo;
		this.payNo = payNo;
		this.productNo = productNo;
		this.deliveryFee = deliveryFee;
		this.couponNo = couponNo;
		this.discountAmount = discountAmount;
		this.finalCost = finalCost;
		this.memberId = memberId;
		this.address = address;
		this.contactPhone = contactPhone;
		this.deliveryRequest = deliveryRequest;
		this.agreeYn = agreeYn;
		this.paymentMethod = paymentMethod;
		this.cardKind = cardKind;
		this.monthlyPay = monthlyPay;
		this.bankKind = bankKind;
		this.bankPayerName = bankPayerName;
		this.payComplete = payComplete;
		this.orderCancel = orderCancel;
		this.orderBack = orderBack;
		this.deliveryStart = deliveryStart;
		this.deliveryComplete = deliveryComplete;
		this.deliveryNo = deliveryNo;
		this.orderDate = orderDate;
	}

	public List<Product> getBuyProducts() {
		return buyProducts;
	}

	public void setBuyProducts(List<Product> buyProducts) {
		this.buyProducts = buyProducts;
	}

	public List<OrderProduct> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(List<OrderProduct> orderProducts) {
		this.orderProducts = orderProducts;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public int getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(int discountAmount) {
		this.discountAmount = discountAmount;
	}

	public int getFinalCost() {
		return finalCost;
	}

	public void setFinalCost(int finalCost) {
		this.finalCost = finalCost;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getDeliveryRequest() {
		return deliveryRequest;
	}

	public void setDeliveryRequest(String deliveryRequest) {
		this.deliveryRequest = deliveryRequest;
	}

	public String getAgreeYn() {
		return agreeYn;
	}

	public void setAgreeYn(String agreeYn) {
		this.agreeYn = agreeYn;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getCardKind() {
		return cardKind;
	}

	public void setCardKind(String cardKind) {
		this.cardKind = cardKind;
	}

	public int getMonthlyPay() {
		return monthlyPay;
	}

	public void setMonthlyPay(int monthlyPay) {
		this.monthlyPay = monthlyPay;
	}

	public String getBankKind() {
		return bankKind;
	}

	public void setBankKind(String bankKind) {
		this.bankKind = bankKind;
	}

	public String getBankPayerName() {
		return bankPayerName;
	}

	public void setBankPayerName(String bankPayerName) {
		this.bankPayerName = bankPayerName;
	}

	public String getPayComplete() {
		return payComplete;
	}

	public void setPayComplete(String payComplete) {
		this.payComplete = payComplete;
	}

	public String getOrderCancel() {
		return orderCancel;
	}

	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}

	public String getOrderBack() {
		return orderBack;
	}

	public void setOrderBack(String orderBack) {
		this.orderBack = orderBack;
	}

	public String getDeliveryStart() {
		return deliveryStart;
	}

	public void setDeliveryStart(String deliveryStart) {
		this.deliveryStart = deliveryStart;
	}

	public String getDeliveryComplete() {
		return deliveryComplete;
	}

	public void setDeliveryComplete(String deliveryComplete) {
		this.deliveryComplete = deliveryComplete;
	}

	public String getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [buyProducts=" + buyProducts + ", orderProducts=" + orderProducts + ", member=" + member
				+ ", orderNo=" + orderNo + ", payNo=" + payNo + ", productNo=" + productNo + ", deliveryFee="
				+ deliveryFee + ", couponNo=" + couponNo + ", discountAmount=" + discountAmount + ", finalCost="
				+ finalCost + ", memberId=" + memberId + ", address=" + address + ", contactPhone=" + contactPhone
				+ ", deliveryRequest=" + deliveryRequest + ", agreeYn=" + agreeYn + ", paymentMethod=" + paymentMethod
				+ ", cardKind=" + cardKind + ", monthlyPay=" + monthlyPay + ", bankKind=" + bankKind
				+ ", bankPayerName=" + bankPayerName + ", payComplete=" + payComplete + ", orderCancel=" + orderCancel
				+ ", orderBack=" + orderBack + ", deliveryStart=" + deliveryStart + ", deliveryComplete="
				+ deliveryComplete + ", deliveryNo=" + deliveryNo + ", orderDate=" + orderDate + "]";
	}

	
}
