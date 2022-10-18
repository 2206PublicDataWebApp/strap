package com.kh.strap.member.domain;

import java.sql.Date;

public class SocialMember {
	
	private Long memberId; 			//카카오 회원 번호
	private String memberGender;	//성별
	private String memberNick;		//카카오 닉네임
	private String memberJYM;		//마이짐
	private String memberCareer;	//구력
	private int memberSBD;			//3대 기록
	private String mProfilePath;	//카카오 프로필 이미지
	private Date mRegisterDate;		//소셜 로그인 가입일
	private String memberStatus;	//회원 상태
	private int memberManner;	//회원 상태
	
	
	public int getMemberManner() {
		return memberManner;
	}
	public void setMemberManner(int memberManner) {
		this.memberManner = memberManner;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberJYM() {
		return memberJYM;
	}
	public void setMemberJYM(String memberJYM) {
		this.memberJYM = memberJYM;
	}
	public String getMemberCareer() {
		return memberCareer;
	}
	public void setMemberCareer(String memberCareer) {
		this.memberCareer = memberCareer;
	}
	public int getMemberSBD() {
		return memberSBD;
	}
	public void setMemberSBD(int memberSBD) {
		this.memberSBD = memberSBD;
	}
	public String getmProfilePath() {
		return mProfilePath;
	}
	public void setmProfilePath(String mProfilePath) {
		this.mProfilePath = mProfilePath;
	}
	public Date getmRegisterDate() {
		return mRegisterDate;
	}
	public void setmRegisterDate(Date mRegisterDate) {
		this.mRegisterDate = mRegisterDate;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	
	@Override
	public String toString() {
		return "SocialMember [memberId=" + memberId + ", memberGender=" + memberGender + ", memberNick=" + memberNick
				+ ", memberJYM=" + memberJYM + ", memberCareer=" + memberCareer + ", memberSBD=" + memberSBD
				+ ", mProfilePath=" + mProfilePath + ", mRegisterDate=" + mRegisterDate + ", memberStatus="
				+ memberStatus + ", memberManner=" + memberManner + "]";
	}
	
	
	
	
}
