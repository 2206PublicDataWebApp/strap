package com.kh.strap.shop.product.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.review.domain.Review;

public interface ProductService {
	//상품
	//1.관리자 상품 등록 insert
	public int registerProduct(Product product);
	public int registerSubImg(ProductImg pi);
	public int registerInfoImg(ProductImg pi);
	//2-1. 전체상품 selectList
	public List<Product> printAllProduct(Paging paging,Search search);
	//2-2. 전체상품 검색 selectList
	public List<Product> printAllProductSearch(Paging paging,Search search);
	//2-3. 전체상품 개수 카운팅
	public int countAllProduct();
	//2-4. 검색상품 개수 카운팅
	public int countSearchProduct(Search search);
	//2-5. 상품관리페이지 검색 개수 카운팅
	public int countAdminProductSearch(Search search);
	//3.상품 상세 페이지 selectOne
	public Product printOneProduct(Product product);
	//4.관리자 상품 수정 update
	public int modifyProduct(Product product);
	//5번을 하나로 묶어서 처리하는 방법 생각하기.
	//5-1.상품리뷰가 추가될 때 상품 총점을 update한다.
	public int modifyProductGradeSum(Review review);
	//5-2.상품리뷰가 추가될 때 상품 평점을 update한다.
//	public int modifyProductGradeAver(Product product);
	//5-3. 상품리뷰가 추가될 때 상품 리뷰개수를 update한다.
	//6.관리자 상품 삭제 PRODUCT_DELETE 'Y' 변경
	public int removeProduct(Product product);
	
	
	//주문
	//1.결제하기 버튼 클릭 시 주문 INSERT. 
	public int registerOrder(Order order);
	//2.한개의 주문내역 SELECT
	public Order printOneOrder(Order order);
	//3. 회원 주문 리스트 SELECT
	public List<Order> printMemberOrder(Paging paging,Search search,Order order);
	//4. 회원 취소 주문 SELECT
	public List<Order> printMemberCancelOrder(Paging paging,Search search,Order order);
	//5. 결제 완료 시 PAY_COMPLETE 'Y' UPDATE
	public int modifyPayCompleteOrder(Order order);
	//6. 배송 시작 시 DELIVERY_START 'Y' UPDATE
	public int modifyDeliveryStartOrder(Order order);
	//7. 배송 완료 시 DELIVERY_COMPLETE 'Y' UPDATE
	public int modifyDeliveryCompleteOrder(Order order);
	//8. 회원 주문 취소 시 ORDER_CANCEL 'Y'
	public int modifyCancelOrder(Order order);
//	//9. 회원 주문 환불 시 ORDER_BACK 'Y'
//	public int modifyBackOrder(Order order);
	
	//찜
	//1. 찜버튼 클릭 시 찜 여부 체크 후 반환값이 0이면, insert
	public int registerProductLike(ProductLike like);
	//2. 회원 찜한 상품리스트 select
	public List<Product> printProductLike(Paging paging,ProductLike like);
	//3. 찜 여부 체크
	public int checkProductLike(ProductLike like);
	//4. 회원 찜한 상품 취소
	public int removeProductLike(ProductLike like);
	
	
	
}
