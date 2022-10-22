package com.kh.strap.shop.qna.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.qna.domain.ShopQna;
import com.kh.strap.shop.qna.store.ShopQnaStore;

@Repository("ShopQnaStoreLogic")
public class ShopQnaStoreLogic implements ShopQnaStore {

	@Override
	public int insertShopQna(SqlSession session, ShopQna qna) {
		return session.insert("ShopQnaMapper.insertShopQna", qna);
	}

	@Override
	public List<ShopQna> selectShopQnaByProductNo(SqlSession session, Paging paging,Search search) {
		return session.selectList("ShopQnaMapper.selectMemberShopQna", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public List<ShopQna> selectShopQnaByMemberId(SqlSession session, Paging paging,Search search) {
		return session.selectList("ShopQnaMapper.selectMemberShopQna", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	
	@Override
	public int countShopQna(SqlSession session, Search search) {
		return session.selectOne("ShopQnaMapper.selectCountShopQna", search);
	}

	@Override
	public int countMemberShopQna(SqlSession session, Search search) {
		return session.selectOne("ShopQnaMapper.selectCountMemberShopQna", search);
	}

	@Override
	public int deleteShopQna(SqlSession session, ShopQna qna) {
		return session.delete("ShopQnaMapper.deleteShopQna", qna);
	}



}
