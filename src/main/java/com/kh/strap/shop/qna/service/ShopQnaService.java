package com.kh.strap.shop.qna.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.shop.qna.domain.ShopQna;

public interface ShopQnaService {
	
	public int registerShopQna(ShopQna qna);
	public List<ShopQna> printShopQnaByProductNo(Paging paging,ShopQna qna);
	public List<ShopQna> printShopQnaByMemberId(Paging paging,ShopQna qna);
	public int removeShopQna(ShopQna qna);
}
