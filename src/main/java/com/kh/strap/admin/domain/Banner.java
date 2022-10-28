package com.kh.strap.admin.domain;

import java.util.Date;

public class Banner {
	private int bannerNo;
	private String bannerTitle;
	private Date enrollDate;
	private String bannerFilename;
	private String bannerFileRename;
	private String bannerFilepath;
	
	
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
	public String getBannerTitle() {
		return bannerTitle;
	}
	public void setBannerTitle(String bannerTitle) {
		this.bannerTitle = bannerTitle;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getBannerFilename() {
		return bannerFilename;
	}
	public void setBannerFilename(String bannerFilename) {
		this.bannerFilename = bannerFilename;
	}
	public String getBannerFileRename() {
		return bannerFileRename;
	}
	public void setBannerFileRename(String bannerFileRename) {
		this.bannerFileRename = bannerFileRename;
	}
	public String getBannerFilepath() {
		return bannerFilepath;
	}
	public void setBannerFilepath(String bannerFilepath) {
		this.bannerFilepath = bannerFilepath;
	}
	
	
	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", bannerTitle=" + bannerTitle + ", enrollDate=" + enrollDate
				+ ", bannerFilename=" + bannerFilename + ", bannerFileRename=" + bannerFileRename + ", bannerFilepath="
				+ bannerFilepath + "]";
	}
}
