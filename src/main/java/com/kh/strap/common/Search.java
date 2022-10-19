package com.kh.strap.common;

import java.sql.Date;

public class Search {

// 검색 값 파라미터 용 

	
	private String searchVal;			    // 검색 값
	private String searchColumn; 		    // 칼럼명
	private String searchCondition;		 	// 검색 조건
	private String orderCondition;			// ASC, DESC
	private int dayBefore; 				// 날짜 필터용SYSDATE - #{dayBefore}
	private Date startDate; 				// 날짜 필터용: 시작날짜
	private Date endDate; 					// 날짜 필터용: 종료날짜
	private String memberId; 				// 회원아이디
	private int productNo;					// 상품 번호
	
	public Search() {
	}

	public Search(String searchVal, String searchColumn, String searchCondition, String orderCondition, int dayBefore,
			Date startDate, Date endDate, String memberId, int productNo) {
		super();
		this.searchVal = searchVal;
		this.searchColumn = searchColumn;
		this.searchCondition = searchCondition;
		this.orderCondition = orderCondition;
		this.dayBefore = dayBefore;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memberId = memberId;
		this.productNo = productNo;
	}

	public String getSearchVal() {
		return searchVal;
	}

	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}

	public String getSearchColumn() {
		return searchColumn;
	}

	public void setSearchColumn(String searchColumn) {
		
		if(searchColumn.equals("aver")) {
			searchColumn = "GRADE_AVER";
		}else if(searchColumn.equals("review")) {
			searchColumn = "REVIEW_COUNT";
		}else if(searchColumn.equals("sales")) {
			searchColumn = "PRODUCT_SALES";
		}else if(searchColumn.equals("price")) {
			searchColumn = "PRODUCT_PRICE";
		}
		this.searchColumn = searchColumn;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getOrderCondition() {
		return orderCondition;
	}

	public void setOrderCondition(String orderCondition) {
		if(orderCondition.equals("desc")) {
			orderCondition = "DESC";
		}else if(orderCondition.equals("asc")) {
			orderCondition = "ASC";
		}
		
		this.orderCondition = orderCondition;
	}

	public int getDayBefore() {
		return dayBefore;
	}

	public void setDayBefore(int dayBefore) {
		this.dayBefore = dayBefore;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	@Override
	public String toString() {
		return "Search [searchVal=" + searchVal + ", searchColumn=" + searchColumn + ", searchCondition="
				+ searchCondition + ", orderCondition=" + orderCondition + ", dayBefore=" + dayBefore + ", startDate="
				+ startDate + ", endDate=" + endDate + ", memberId=" + memberId + ", productNo=" + productNo + "]";
	}

	

	
}
