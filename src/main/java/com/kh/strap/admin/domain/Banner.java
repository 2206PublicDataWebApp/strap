package com.kh.strap.admin.domain;

import java.util.Date;

public class Banner {
	private int bannerNo;				//1.배너 넘버
	private String bannerTitle;			//2.배너 이름
	private Date enrollDate;			//3.배너 등록 날짜
	private String bannerFilename;		//4.배너 파일 이름
	private String bannerFileRename;	//5.배너 리네임
	private String bannerFilepath;		//6.배너 경로
	
	
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
