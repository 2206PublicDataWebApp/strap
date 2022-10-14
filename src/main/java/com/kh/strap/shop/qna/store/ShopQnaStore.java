package com.kh.strap.shop.qna.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.qna.domain.ShopQna;

public interface ShopQnaStore {

	public int insertShopQna(SqlSession session,ShopQna qna);
	public List<ShopQna> selectShopQnaByProductNo(SqlSession session,Paging paging,ShopQna qna);
	public List<ShopQna> selectShopQnaByMemberId(SqlSession session,Paging paging,ShopQna qna);
	public int deleteShopQna(SqlSession session,ShopQna qna);
	
}
