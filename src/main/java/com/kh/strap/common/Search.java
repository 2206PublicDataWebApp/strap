package com.kh.strap.common;

import java.sql.Date;

public class Search {

// 검색 값 파라미터 용 

	private String searchVal;			    // 검색 값
	private String searchColumn; 		    // 검색 칼럼
	private String searchCondition;		 	// 검색 조건
	private int dayBefore; 				// 날짜 필터용SYSDATE - #{dayBefore}
	private Date startDate; 				// 날짜 필터용: 시작날짜
	private Date endDate; 					// 날짜 필터용: 종료날짜
	private String memberId; 				// 회원아이디

	public Search() {
	}

	public Search(String searchVal, String searchColumn, String searchCondition, int dayBefore, Date startDate,
			Date endDate, String memberId) {
		super();
		this.searchVal = searchVal;
		this.searchColumn = searchColumn;
		this.searchCondition = searchCondition;
		this.dayBefore = dayBefore;
		this.startDate = startDate;
		this.endDate = endDate;
		this.memberId = memberId;
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
		this.searchColumn = searchColumn;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
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

	@Override
	public String toString() {
		return "Search [searchVal=" + searchVal + ", searchColumn=" + searchColumn + ", searchCondition="
				+ searchCondition + ", dayBefore=" + dayBefore + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", memberId=" + memberId + "]";
	}
	
	

	
}
