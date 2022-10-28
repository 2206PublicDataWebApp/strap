package com.kh.strap.admin.service;

import java.util.List;

import com.kh.strap.admin.domain.Banner;

public interface BannerService {
	public List<Banner> printAllBanner();
	public int registBanner(Banner banner);
}
