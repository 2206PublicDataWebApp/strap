package com.kh.strap.shop.product.domain;

public class Order {
	
	private int orderNo;					//주문번호
	private int productNo;					//상품번호
	private int deliveryFee;				//배송료
	private int couponNo;					//쿠폰번호
	private int discountAmount;			//할인액
	private int finalCost;					//최종결제금액
	private String memberId;				//회원아이디
	private String memberName;				//회원이름
	private String memberEmail;				//회원이메일
	private String memberPhone;				//회원휴대폰번호
	private String address;					//주소
	private String addressDetail;			//상세주소
	private String postNo;					//우편번호
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
	
	public Order() {}

	public Order(int orderNo, int productNo, int deliveryFee, int couponNo, int discountAmount, int finalCost,
			String memberId, String memberName, String memberEmail, String memberPhone, String address,
			String addressDetail, String postNo, String contactPhone, String deliveryRequest, String agreeYn,
			String paymentMethod, String cardKind, int monthlyPay, String bankKind, String bankPayerName,
			String payComplete, String orderCancel, String orderBack, String deliveryStart, String deliveryComplete,
			String deliveryNo) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.deliveryFee = deliveryFee;
		this.couponNo = couponNo;
		this.discountAmount = discountAmount;
		this.finalCost = finalCost;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.address = address;
		this.addressDetail = addressDetail;
		this.postNo = postNo;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
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

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", productNo=" + productNo + ", deliveryFee=" + deliveryFee + ", couponNo="
				+ couponNo + ", discountAmount=" + discountAmount + ", finalCost=" + finalCost + ", memberId="
				+ memberId + ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", memberPhone="
				+ memberPhone + ", address=" + address + ", addressDetail=" + addressDetail + ", postNo=" + postNo
				+ ", contactPhone=" + contactPhone + ", deliveryRequest=" + deliveryRequest + ", agreeYn=" + agreeYn
				+ ", paymentMethod=" + paymentMethod + ", cardKind=" + cardKind + ", monthlyPay=" + monthlyPay
				+ ", bankKind=" + bankKind + ", bankPayerName=" + bankPayerName + ", payComplete=" + payComplete
				+ ", orderCancel=" + orderCancel + ", orderBack=" + orderBack + ", deliveryStart=" + deliveryStart
				+ ", deliveryComplete=" + deliveryComplete + ", deliveryNo=" + deliveryNo + "]";
	}
	
	
}
