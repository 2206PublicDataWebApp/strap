package com.kh.strap.match.domain;

import java.sql.Date;

public class MemberRecordJoin {

	//MEMBER_TBL
	private String memberId;		//1.아이디
	private String memberPwd;		//2.비번
	private String memberName;		//3.이름
	private String memberEmail;		//4.메일
	private String memberGender;	//5.성별
	private String memberNick;		//6.닉네임
	private String memberJym;		//7.마이짐
	private String memberCareer;	//8.구력
	private String memberSBD;		//9.3대
	private String mProfileName;	//10.프로필 사진 이름
	private String mProfileRename;	//11.프로필 사진 리네임
	private String mProfilePath;	//12.프로필 사진경로
	private Date mRegisterDate;		//13.가입일
	private String memberStatus;	//14.회원 상태
	private String adminStatus;		//15.관리자 상태
	private int memberManner;		//16.매너 점수
	private String memberType;		//17.회원 종류
	private String memberIntroduce;	//18.회원 소개
	private String memberAddress;	//19.회원 주소
	private Date memberLastDate;	//20.최근 접속일
	//RECOMEND_RECODE
	private String sameMember;		//1. 실력이 비슷한 회원
	private String localMember;		//2. 주변 회원
	private String mannerMember;	//3. 매너점수 회원
	private String careerMember;	//4. 구력높은 회원
	private String SBDMember;		//5. 기록높은 회원
	private String genderMember;	//6. 동성 회원
	private String userId;			//7. 사용자
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
	public String getMemberSBD() {
		return memberSBD;
	}
	public void setMemberSBD(String memberSBD) {
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
	public int getMemberManner() {
		return memberManner;
	}
	public void setMemberManner(int memberManner) {
		this.memberManner = memberManner;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getMemberIntroduce() {
		return memberIntroduce;
	}
	public void setMemberIntroduce(String memberIntroduce) {
		this.memberIntroduce = memberIntroduce;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public Date getMemberLastDate() {
		return memberLastDate;
	}
	public void setMemberLastDate(Date memberLastDate) {
		this.memberLastDate = memberLastDate;
	}
	public String getSameMember() {
		return sameMember;
	}
	public void setSameMember(String sameMember) {
		this.sameMember = sameMember;
	}
	public String getLocalMember() {
		return localMember;
	}
	public void setLocalMember(String localMember) {
		this.localMember = localMember;
	}
	public String getMannerMember() {
		return mannerMember;
	}
	public void setMannerMember(String mannerMember) {
		this.mannerMember = mannerMember;
	}
	public String getCareerMember() {
		return careerMember;
	}
	public void setCareerMember(String careerMember) {
		this.careerMember = careerMember;
	}
	public String getSBDMember() {
		return SBDMember;
	}
	public void setSBDMember(String sBDMember) {
		SBDMember = sBDMember;
	}
	public String getGenderMember() {
		return genderMember;
	}
	public void setGenderMember(String genderMember) {
		this.genderMember = genderMember;
	}
	public String getUser() {
		return userId;
	}
	public void setUser(String user) {
		this.userId = user;
	}
	@Override
	public String toString() {
		return "memberRecordJoin [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberGender=" + memberGender + ", memberNick=" + memberNick
				+ ", memberJym=" + memberJym + ", memberCareer=" + memberCareer + ", memberSBD=" + memberSBD
				+ ", mProfileName=" + mProfileName + ", mProfileRename=" + mProfileRename + ", mProfilePath="
				+ mProfilePath + ", mRegisterDate=" + mRegisterDate + ", memberStatus=" + memberStatus
				+ ", adminStatus=" + adminStatus + ", memberManner=" + memberManner + ", memberType=" + memberType
				+ ", memberIntroduce=" + memberIntroduce + ", memberAddress=" + memberAddress + ", memberLastDate="
				+ memberLastDate + ", sameMember=" + sameMember + ", localMember=" + localMember + ", mannerMember="
				+ mannerMember + ", careerMember=" + careerMember + ", SBDMember=" + SBDMember + ", genderMember="
				+ genderMember + ", userId=" + userId + "]";
	}
	
	
}
