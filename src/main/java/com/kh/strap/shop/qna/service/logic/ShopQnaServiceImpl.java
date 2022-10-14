package com.kh.strap.shop.qna.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.qna.domain.ShopQna;
import com.kh.strap.shop.qna.service.ShopQnaService;
import com.kh.strap.shop.qna.store.ShopQnaStore;

@Service("ShopQnaServiceImpl")
public class ShopQnaServiceImpl implements ShopQnaService {
	@Autowired
	ShopQnaStore qStore;
	@Autowired
	SqlSession session;
	@Override
	public int registerShopQna(ShopQna qna) {
		return qStore.insertShopQna(session, qna);
	}
	@Override
	public List<ShopQna> printShopQnaByProductNo(Paging paging,ShopQna qna) {
		return qStore.selectShopQnaByMemberId(session,paging, qna);
	}
	@Override
	public List<ShopQna> printShopQnaByMemberId(Paging paging,ShopQna qna) {
		return qStore.selectShopQnaByProductNo(session,paging, qna);
	}
	@Override
	public int removeShopQna(ShopQna qna) {
		return qStore.deleteShopQna(session, qna);
	}
}
