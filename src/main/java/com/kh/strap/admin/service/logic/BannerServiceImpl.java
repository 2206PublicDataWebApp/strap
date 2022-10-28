package com.kh.strap.admin.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.admin.service.BannerService;
import com.kh.strap.admin.store.BannerStore;

@Service
public class BannerServiceImpl implements BannerService {
	@Autowired
	private SqlSession session;
	@Autowired
	private BannerStore bnStore;
}
