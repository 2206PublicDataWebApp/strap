package com.kh.strap.admin.domain;

import java.util.Date;

public class Admin {
	private String adminId;			//1.관리자 아이디
	private String adminPwd;		//2.관리자 비밀번호
	private String adminName;		//3.관리자 이름
	private String adminEmail;		//4.관리자 이메일
	private String adminGender;		//5.관리자 성별
	private String adminNick;		//6.관리자 별명
	private String adminJym;
	private String adminCareer;
	private int adminSbd;
	private String aProfileName;
	private String aProfileRename;
	private String aProfilepath;
	private Date aRegisterDate;
	private String memberStatus;
	private String adminStatus;
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
