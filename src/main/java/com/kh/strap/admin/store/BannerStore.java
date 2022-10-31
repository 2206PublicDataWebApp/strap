package com.kh.strap.admin.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.admin.domain.Banner;

public interface BannerStore {
	public List<Banner> selectAllBanner(SqlSession session);
	public int insertBanner(SqlSession session, Banner banner);
	public int updateBanner(SqlSession session, Banner banner);
	public int deleteBanner(SqlSession session, Integer bannerNo);
}
