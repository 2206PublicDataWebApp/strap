package com.kh.strap.shop.product.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.kh.strap.member.domain.Member;

public class Order {
	
	private List<Product> buyProducts;  	//주문 상품 정보
	private List<OrderProduct> orderProducts; //주문 상품리스트
	private Member member;					//주문에 멤버가 있음
	private String orderNo;					//주문번호
	private String payNo;						//결제번호
	private int deliveryFee;				//배송료
	private int discountAmount;			//할인액
	private int finalCost;					//최종결제금액
	private String memberId;				//회원아이디
	private String address;					//주소
	private String contactPhone;			//배송연락처
	private String deliveryRequest;			//배송요청
	private String agreeYn;					//동의여부
	private String paymentMethod;			//결제수단
	private String cardKind;				//카드종류
	private String payComplete;				//결제완료여부
	private String orderCancel;				//결제취소여부
	private String deliveryStart;			//배송시작여부
	private String deliveryComplete;		//배송완료여부
	private String deliveryNo;				//운송장번호
	private Date orderDate;					//주문일
	private String memberNick;				//회원 닉네임
	private Timestamp vBankDueDate;        //가상계좌 입금기한
	private String vBankHolder;				//가상 계좌 예금주
	private String vBankName;				//가상계좌 은행이름
	private String vBankNum;				//가상계좌번호
	private String orderStatus;				//주문상태: ordered(주문상태), paid(결제상태), ready(가상계좌발급상태) , canceled(취소상태)
	private int couponNo;					//사용한 쿠폰 번호
	
	public Order() {}

	public Order(List<Product> buyProducts, List<OrderProduct> orderProducts, Member member, String orderNo,
			String payNo, int deliveryFee, int discountAmount, int finalCost, String memberId, String address,
			String contactPhone, String deliveryRequest, String agreeYn, String paymentMethod, String cardKind,
			String payComplete, String orderCancel, String deliveryStart, String deliveryComplete, String deliveryNo,
			Date orderDate, String memberNick, Timestamp vBankDueDate, String vBankHolder, String vBankName,
			String vBankNum, String orderStatus, int couponNo) {
		super();
		this.buyProducts = buyProducts;
		this.orderProducts = orderProducts;
		this.member = member;
		this.orderNo = orderNo;
		this.payNo = payNo;
		this.deliveryFee = deliveryFee;
		this.discountAmount = discountAmount;
		this.finalCost = finalCost;
		this.memberId = memberId;
		this.address = address;
		this.contactPhone = contactPhone;
		this.deliveryRequest = deliveryRequest;
		this.agreeYn = agreeYn;
		this.paymentMethod = paymentMethod;
		this.cardKind = cardKind;
		this.payComplete = payComplete;
		this.orderCancel = orderCancel;
		this.deliveryStart = deliveryStart;
		this.deliveryComplete = deliveryComplete;
		this.deliveryNo = deliveryNo;
		this.orderDate = orderDate;
		this.memberNick = memberNick;
		this.vBankDueDate = vBankDueDate;
		this.vBankHolder = vBankHolder;
		this.vBankName = vBankName;
		this.vBankNum = vBankNum;
		this.orderStatus = orderStatus;
		this.couponNo = couponNo;
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

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
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

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public Timestamp getvBankDueDate() {
		return vBankDueDate;
	}

	public void setvBankDueDate(Timestamp vBankDueDate) {
		this.vBankDueDate = vBankDueDate;
	}

	public String getvBankHolder() {
		return vBankHolder;
	}

	public void setvBankHolder(String vBankHolder) {
		this.vBankHolder = vBankHolder;
	}

	public String getvBankName() {
		return vBankName;
	}

	public void setvBankName(String vBankName) {
		this.vBankName = vBankName;
	}

	public String getvBankNum() {
		return vBankNum;
	}

	public void setvBankNum(String vBankNum) {
		this.vBankNum = vBankNum;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	@Override
	public String toString() {
		return "Order [buyProducts=" + buyProducts + ", orderProducts=" + orderProducts + ", member=" + member
				+ ", orderNo=" + orderNo + ", payNo=" + payNo + ", deliveryFee=" + deliveryFee + ", discountAmount="
				+ discountAmount + ", finalCost=" + finalCost + ", memberId=" + memberId + ", address=" + address
				+ ", contactPhone=" + contactPhone + ", deliveryRequest=" + deliveryRequest + ", agreeYn=" + agreeYn
				+ ", paymentMethod=" + paymentMethod + ", cardKind=" + cardKind + ", payComplete=" + payComplete
				+ ", orderCancel=" + orderCancel + ", deliveryStart=" + deliveryStart + ", deliveryComplete="
				+ deliveryComplete + ", deliveryNo=" + deliveryNo + ", orderDate=" + orderDate + ", memberNick="
				+ memberNick + ", vBankDueDate=" + vBankDueDate + ", vBankHolder=" + vBankHolder + ", vBankName="
				+ vBankName + ", vBankNum=" + vBankNum + ", orderStatus=" + orderStatus + ", couponNo=" + couponNo
				+ "]";
	}
}
