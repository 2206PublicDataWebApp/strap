package com.kh.strap.admin.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.domain.Banner;
import com.kh.strap.admin.service.BannerService;
import com.kh.strap.admin.store.BannerStore;

@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	private SqlSession session;
	@Autowired
	private BannerStore bnStore;
	
	@Override
	public List<Banner> printAllBanner() {
		List<Banner> bnList = bnStore.selectAllBanner(session);
		return bnList;
	}

	@Override
	public int registBanner(Banner banner) {
		int result = bnStore.insertBanner(session, banner);
		return result;
	}

	@Override
	public int modifyBanner(Banner banner) {
		int result = bnStore.updateBanner(session, banner);
		return result;
	}

	@Override
	public int removeBanner(Integer bannerNo) {
		int result = bnStore.deleteBanner(session, bannerNo);
		return result;
	}
}
