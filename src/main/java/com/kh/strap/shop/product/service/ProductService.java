package com.kh.strap.shop.product.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;

public interface ProductService {

//상품 등록
	//상품 등록
	public int registerProduct(Product product);
	//상품등록 중 서브이미지, 인포이미지 등록
	public int registerSubImg(ProductImg pi);
	public int registerInfoImg(ProductImg pi);
	
//쇼핑몰 상품목록 조회
	//상품 리스트 출력(디폴트:평점순)
	public List<Product> printAllProduct(Paging paging,Search search);
	//상품 검색 리스트 출력(검색어와 정렬 사용)
	public List<Product> printAllProductSearch(Paging paging, Search search);
	//전체상품 개수 카운트
	public int countAllProduct();
	//검색상품 개수 카운트
	public int countSearchProduct(Search search);
	
//관리자 상품목록 조회
	//상품 리스트 출력(디폴트:최신순)
	public List<Product> printAdminAllProduct(Paging paging, Search search);
	//상품 검색 리스트 출력(검색어만 사용)
	public List<Product> printAdminProductSearch(Paging paging,Search search);
	//검색상품 개수 카운트
	public int countAdminProductSearch(Search search);
	
	//주문별 구매상품 목록 출력
	public List<Product> printProductsOnOrder(int orderNo);
	
	
//상품 상세 조회
	public Product printOneProduct(Product product);
	//상품 인포이미지 리스트 출력
	public List<ProductImg> printInfoImgByNo(Product product);
	//상품 서브이미지 리스트 출력
	public List<ProductImg> printSubImgByNo(Product product);
	
//관리자 상품 수정
	//상품 수정
	public int modifyProduct(Product product);
	
//관리자 상품 삭제
	public int removeProduct(Product product);
	
//주문 등록
	//주문 등록 
	public int registerOrder(Order order);

//주문 조회
	//주문 상세 출력
	public Order printOneOrder(Order order);
	//회원 주문내역 리스트 출력
	public List<Order> printMemberOrder(Paging paging,Search search);
	public int countMemberOder(Search search);
	//회원 주문취소 리스트 출력
	public List<Order> printMemberCancelOrder(Paging paging,Search search);
	public int countMemberCancelOrder(Search search);
	
//주문 수정
	//결제 완료 시 PAY_COMPLETE 'Y' UPDATE
	public int modifyPayCompleteOrder(Order order);
	//배송 시작 시 DELIVERY_START 'Y' UPDATE
	public int modifyDeliveryStartOrder(Order order);
	//배송 완료 시 DELIVERY_COMPLETE 'Y' UPDATE
	public int modifyDeliveryCompleteOrder(Order order);
	//회원 주문 취소 시 ORDER_CANCEL 'Y'
	public int modifyCancelOrder(Order order);
	
//찜 추가
	//찜컨트롤 
	public int registerdeleteProductLike(ProductLike like);
	//회원 찜한 상품리스트 select
	public List<Product> printMemberProductLike(Paging paging,ProductLike like);
	//회원 찜한 상품 카운트
	public int countMemberProductLike(ProductLike like);
	//로그인 멤버의 찜한 상품들
	public List<ProductLike> memberLikeList(String memberId);
	
//멤버 주소 등록 및 수정
	public int modifyMemberAddr(Member member);

	
	
	
}
