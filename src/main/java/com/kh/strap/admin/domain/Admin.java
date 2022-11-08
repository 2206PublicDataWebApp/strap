package com.kh.strap.admin.domain;

import java.util.Date;

public class Admin {
	private String adminId;			//1.관리자 아이디
	private String adminPwd;		//2.관리자 비밀번호
	private String adminName;		//3.관리자 이름
	private String adminEmail;		//4.관리자 이메일
	private String adminGender;		//5.관리자 성별
	private String adminNick;		//6.관리자 별명
	private String adminJym;		//7.관리자 체육관
	private String adminCareer;		//8.관리자 경력
	private int adminSbd;			//9.관리자 3대
	private String aProfileName;	//10.관리자 프로필 기존 이름
	private String aProfileRename;	//11.관리자 프로필 바뀐 이름
	private String aProfilepath;	//12.관리자 프로필 경로
	private Date aRegisterDate;		//13.관리자 가입일
	private String memberStatus;	//14.회원 상태
	private String adminStatus;		//15.관리자 상태
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminGender() {
		return adminGender;
	}
	public void setAdminGender(String adminGender) {
		this.adminGender = adminGender;
	}
	public String getAdminNick() {
		return adminNick;
	}
	public void setAdminNick(String adminNick) {
		this.adminNick = adminNick;
	}
	public String getAdminJym() {
		return adminJym;
	}
	public void setAdminJym(String adminJym) {
		this.adminJym = adminJym;
	}
	public String getAdminCareer() {
		return adminCareer;
	}
	public void setAdminCareer(String adminCareer) {
		this.adminCareer = adminCareer;
	}
	public int getAdminSbd() {
		return adminSbd;
	}
	public void setAdminSbd(int adminSbd) {
		this.adminSbd = adminSbd;
	}
	public String getaProfileName() {
		return aProfileName;
	}
	public void setaProfileName(String aProfileName) {
		this.aProfileName = aProfileName;
	}
	public String getaProfileRename() {
		return aProfileRename;
	}
	public void setaProfileRename(String aProfileRename) {
		this.aProfileRename = aProfileRename;
	}
	public String getaProfilepath() {
		return aProfilepath;
	}
	public void setaProfilepath(String aProfilepath) {
		this.aProfilepath = aProfilepath;
	}
	public Date getaRegisterDate() {
		return aRegisterDate;
	}
	public void setaRegisterDate(Date aRegisterDate) {
		this.aRegisterDate = aRegisterDate;
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
		return "Admin [adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName=" + adminName + ", adminEmail="
				+ adminEmail + ", adminGender=" + adminGender + ", adminNick=" + adminNick + ", adminJym=" + adminJym
				+ ", adminCareer=" + adminCareer + ", adminSbd=" + adminSbd + ", aProfileName=" + aProfileName
				+ ", aProfileRename=" + aProfileRename + ", aProfilepath=" + aProfilepath + ", aRegisterDate="
				+ aRegisterDate + ", memberStatus=" + memberStatus + ", adminStatus=" + adminStatus + "]";
	}
	
}
