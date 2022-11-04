package com.kh.strap.shop.product.domain;

import java.sql.Date;

public class OrderCancel {
	
	private String orderNo;
	private Date cancelledAt ; 
	private String buyer_name ; 
	private String emb_pg_provider ; 
	private String reason ; 
	private Integer amount ; 
	private String status ; 
	private String buyer_tel ;
	
	public OrderCancel() {}
	
	public OrderCancel(String orderNo, String buyer_name, String emb_pg_provider, String reason, Integer amount,
			String status, String buyer_tel) {
		super();
		this.orderNo = orderNo;
		this.buyer_name = buyer_name;
		this.emb_pg_provider = emb_pg_provider;
		this.reason = reason;
		this.amount = amount;
		this.status = status;
		this.buyer_tel = buyer_tel;
	}
	
	public OrderCancel(String buyer_name, String emb_pg_provider, String reason, Integer amount, String status,
			String buyer_tel) {
		super();
		this.buyer_name = buyer_name;
		this.emb_pg_provider = emb_pg_provider;
		this.reason = reason;
		this.amount = amount;
		this.status = status;
		this.buyer_tel = buyer_tel;
	}

	public OrderCancel(Date cancelledAt, String buyer_name, String emb_pg_provider, String reason, Integer amount,
			String status, String buyer_tel) {
		super();
		this.cancelledAt = cancelledAt;
		this.buyer_name = buyer_name;
		this.emb_pg_provider = emb_pg_provider;
		this.reason = reason;
		this.amount = amount;
		this.status = status;
		this.buyer_tel = buyer_tel;
	}
	public Date getCancelledAt() {
		return cancelledAt;
	}
	public void setCancelledAt(Date cancelledAt) {
		this.cancelledAt = cancelledAt;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getEmb_pg_provider() {
		return emb_pg_provider;
	}
	public void setEmb_pg_provider(String emb_pg_provider) {
		this.emb_pg_provider = emb_pg_provider;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	@Override
	public String toString() {
		return "OrderCancel [cancelledAt=" + cancelledAt + ", buyer_name=" + buyer_name + ", emb_pg_provider="
				+ emb_pg_provider + ", reason=" + reason + ", amount=" + amount + ", status=" + status + ", buyer_tel="
				+ buyer_tel + "]";
	} 
	
	
    
}
