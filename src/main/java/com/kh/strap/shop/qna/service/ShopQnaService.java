package com.kh.strap.shop.qna.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.qna.domain.ShopQna;

public interface ShopQnaService {
	
	//1.상품 문의 insert
	public int registerShopQna(ShopQna qna);
	//2.상품 페이지에 select
	public List<ShopQna> printShopQnaByProductNo(Paging paging,Search search);
	//3.회원 페이지에 select
	public List<ShopQna> printShopQnaByMemberId(Paging paging,Search search);
	//Paging용 카운트
	public int countShopQna(Search search);
	public int countMemberShopQna(Search search);
	//4.상품 문의 삭제
	public int removeShopQna(ShopQna qna);
}
