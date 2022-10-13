package com.kh.strap.admin.domain;

import java.util.Date;

public class Admin {
	private String adminId;
	private String adminPwd;
	private String adminName;
	private String adminEmail;
	private String adminGender;
	private String adminNick;
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
