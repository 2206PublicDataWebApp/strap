package com.kh.strap.member.domain;

import java.sql.Date;

public class Member {
	
	private String memberId;		//1.아이디
	private String memberPwd;		//2.비번
	private String memberName;		//3.이름
	private String memberEmail;		//4.메일
	private String memberGender;	//5.성별
	private String memberNick;		//6.닉네임
	private String memberJym;		//7.마이짐
	private String memberCareer;	//8.구력
	private int memberSBD;			//9.3대
	private String mProfileName;	//10.프로필 사진 이름
	private String mProfileRename;	//11.프로필 사진 리네임
	private String mProfilePath;	//12.프로필 사진경로
	private Date mRegisterDate;		//13.가입일
	private String memberStatus;	//14.회원 상태
	private String adminStatus;		//15.관리자 상태
	private int memberManner;		//16.매너 점수
	private String memberType;		//17.회원 종류
	
	

	public Member() {}
	
	public Member(String memberId, String MemberPwd) {
		this.memberId = memberId;
		this.memberPwd = MemberPwd;
	}

	
	public String getMemberType() {
		return memberType;
	}
	
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	
	
	public int getMemberManner() {
		return memberManner;
	}

	public void setMemberManner(int memberManner) {
		this.memberManner = memberManner;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
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
	public String getMemberJym() {
		return memberJym;
	}
	public void setMemberJym(String memberJym) {
		this.memberJym = memberJym;
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
	public String getmProfileName() {
		return mProfileName;
	}
	public void setmProfileName(String mProfileName) {
		this.mProfileName = mProfileName;
	}
	public String getmProfileRename() {
		return mProfileRename;
	}
	public void setmProfileRename(String mProfileRename) {
		this.mProfileRename = mProfileRename;
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
	
	
	public String getAdminStatus() {
		return adminStatus;
	}

	public void setAdminStatus(String adminStatus) {
		this.adminStatus = adminStatus;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberGender=" + memberGender + ", memberNick=" + memberNick
				+ ", memberJym=" + memberJym + ", memberCareer=" + memberCareer + ", memberSBD=" + memberSBD
				+ ", mProfileName=" + mProfileName + ", mProfileRename=" + mProfileRename + ", mProfilePath="
				+ mProfilePath + ", mRegisterDate=" + mRegisterDate + ", memberStatus=" + memberStatus
				+ ", adminStatus=" + adminStatus + ", memberManner=" + memberManner + ", memberType=" + memberType
				+ "]";
	}





	
	
}
