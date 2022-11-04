package com.kh.strap.shop.product.service;

import java.util.List;
import java.util.Map;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.OrderCancel;
import com.kh.strap.shop.product.domain.OrderProduct;
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
	public int countAllProduct(Search search);
	//검색상품 개수 카운트
	public int countSearchProduct(Search search);
	
//관리자 상품목록 조회
	//상품 리스트 출력(디폴트:최신순)
	public List<Product> printAdminAllProduct(Paging paging, Search search);
	//상품 검색 리스트 출력(검색어만 사용)
	public List<Product> printAdminProductSearch(Paging paging,Search search);
	//검색상품 개수 카운트
	public int countAdminProductSearch(Search search);

//관리자 상품 판매량 갱신
	public int renewSales();
	
//주문별 구매상품 목록 출력
	public List<Product> printProductsOnOrder(String orderNo);
	public List<OrderProduct> printOrderProductsOnOrder(String orderNo);
	
//상품 상세 조회
	public Product printOneProduct(Product product);
	//상품 인포이미지 리스트 출력
	public List<ProductImg> printInfoImgByNo(Product product);
	//상품 서브이미지 리스트 출력
	public List<ProductImg> printSubImgByNo(Product product);
	
//관리자 상품 수정
	//상품 정보 수정
	public int modifyProductInfo(Product product);
	//메인이미지 업데이트
	public int modifyProductMainImg(Product product);
	public int removeSubImgOnProduct(int productNo);
	public int removeInfoImgOnProduct(int productNo);
	
//관리자 상품 삭제
	public int removeProduct(Product product);
	
//주문 등록
	//주문 등록 
	public int registerOrder(Order order);
	//주문 상품 List 등록
	public int registerOrderProducts(OrderProduct orderProduct);
	
	
//결제: 결제금액과 주문 금액 체크
	public int getTobePaidFinalCost(String merchant_uid);

//주문 조회
	//주문 상세 출력
	public Order printOneOrder(String merchant_uid);
	//회원 주문내역 리스트 출력
	public List<Order> printMemberOrder(Paging paging,Search search);
	public int countMemberOder(Search search);
	//회원 주문취소 리스트 출력
	public List<Order> printMemberCancelOrder(Paging paging,Search search);
	public int countMemberCancelOrder(Search search);
	
//관리자:주문관리 조회
	public List<Order> printManageOrder(Paging paging,Search search);
//관리자:주문관리 카운트
	public int countManageOrder(Search search);
	
//주문 수정
	//결제 완료 시 PAY_COMPLETE 'Y' UPDATE
	public int modifyPayCompleteOrder(Map<String,String> paidMap);
	//배송 시작 시 DELIVERY_START 'Y' UPDATE
	public int modifyDeliveryStartOrder(String merchant_uid);
	//배송 완료 시 DELIVERY_COMPLETE 'Y' UPDATE
	public int modifyDeliveryCompleteOrder(String merchant_uid);
	//회원 주문 취소 시 ORDER_CANCEL 'Y'
	public int modifyCancelOrder(String merchant_uid);
	//가상계좌 등록
	public int modifyVBankInfo(Order order);
	
//주문 취소
	//주문 취소 정보 insert
	public int registerCancelInfo(OrderCancel oc);
	
	
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
