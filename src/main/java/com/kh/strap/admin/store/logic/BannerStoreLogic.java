package com.kh.strap.admin.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.admin.domain.Banner;
import com.kh.strap.admin.store.BannerStore;

@Repository
public class BannerStoreLogic implements BannerStore {

	@Override
	public List<Banner> selectAllBanner(SqlSession session) {
		List<Banner> bnList = session.selectList("BannerMapper.selectAllBanner");
		return bnList;
	}

	@Override
	public int insertBanner(SqlSession session, Banner banner) {
		int result = session.insert("BannerMapper.insertBanner", banner);
		return result;
	}

}
