package com.kh.strap.schedule.domain;

public class Schedule {
	private int matchNo;
	private String matchMemberId;
	private String matchMemberNick;
	private String memberId;
	private String memberNick;
	private String matchDetail;
	private String matchDate;
	private String meetDate;
	
	
	public int getMatchNo() {
		return matchNo;
	}
	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}
	public String getMatchMemberId() {
		return matchMemberId;
	}
	public void setMatchMemberId(String matchMemberId) {
		this.matchMemberId = matchMemberId;
	}
	public String getMatchMemberNick() {
		return matchMemberNick;
	}
	public void setMatchMemberNick(String matchMemberNick) {
		this.matchMemberNick = matchMemberNick;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMatchDetail() {
		return matchDetail;
	}
	public void setMatchDetail(String matchDetail) {
		this.matchDetail = matchDetail;
	}
	public String getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}
	public String getMeetDate() {
		return meetDate;
	}
	public void setMeetDate(String meetDate) {
		this.meetDate = meetDate;
	}
	
	
	@Override
	public String toString() {
		return "Schedule [matchNo=" + matchNo + ", matchMemberId=" + matchMemberId + ", matchMemberNick="
				+ matchMemberNick + ", memberId=" + memberId + ", memberNick=" + memberNick + ", matchDetail="
				+ matchDetail + ", matchDate=" + matchDate + ", meetDate=" + meetDate + "]";
	}
}
