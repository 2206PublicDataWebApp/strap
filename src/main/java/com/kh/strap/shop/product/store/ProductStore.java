package com.kh.strap.shop.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;

public interface ProductStore {
	
//상품 등록
		//상품 등록
		public int insertProduct(SqlSession session,Product product);
		//서브이미지 등록
		public int insertSubImg(SqlSession session,ProductImg pi);
		//인포이미지 등록
		public int insertInfoImg(SqlSession session,ProductImg pi);
		
//쇼핑몰 상품목록 조회			
		//상품 리스트 출력(디폴트:평점순)
		public List<Product> selectAllProduct(SqlSession session,Paging paging,Search search);
		//상품 검색 리스트 출력(검색어와 정렬 사용)
		public List<Product> selectAllProductSearch(SqlSession session,Paging paging, Search search);
		//전체상품 개수 카운트
		public int selectCountAllProduct(SqlSession session);
		//검색상품 개수 카운트(쇼핑몰)
		public int selectCountSearchProduct(SqlSession session, Search search);
		
//관리자 상품목록 조회
		//상품 리스트 출력(디폴트:최신순)
		public List<Product> selectAdminAllProduct(SqlSession session,Paging paging,Search search);
		//상품 검색 리스트 출력(검색어만 사용)
		public List<Product> selectAdminProductSearch(SqlSession session,Paging paging,Search search);
		//검색상품 개수 카운트(관리자)
		public int selectCountAdminProductSearch(SqlSession session,Search search);
		
//주문별 구매상품 목록 출력
		public List<Product> selectProductsOnOrder(SqlSession session ,int orderNo);
		
//상품 상세 조회
		public Product selectOneProduct(SqlSession session,Product product);
		//인포이미지 리스트 조회
		public List<ProductImg> selectInfoImgByNo(SqlSession session,Product product);
		//서브이미지 리스트 조회
		public List<ProductImg> selectSubImgByNo(SqlSession session,Product product);
		
		
//관리자 상품수정
		//상품 수정
		public int updateProduct(SqlSession session,Product product);
		

//관리자 상품 삭제
		public int deleteProduct(SqlSession session,Product product);
		
//주문 등록
		public int insertOrder(SqlSession session,Order order);
		
		
//주문 조회
		//주문 상세 출력
		public Order selectOneOrder(SqlSession session,Order order);
		//회원 주문내역 리스트 출력
		public List<Order> selectMemberOrder(SqlSession session,Paging paging,Search search);
		public int selectCountMemberOrder(SqlSession session,Search search);
		//회원 주문 취소 리스트 출력
		public List<Order> selectMemberCancelOrder(SqlSession session,Paging paging,Search search);
		public int selectCountMemberCancelOrder(SqlSession session, Search search);
		
//주문 수정
		//주문 완료
		public int updatePayCompleteOrder(SqlSession session,Order order);
		//배송 시작
		public int updateDeliveryStartOrder(SqlSession session, Order order);
		//배송 완료
		public int updateDeliveryCompleteOrder(SqlSession session,Order order);
		//주문 취소
		public int updateCancelOrder(SqlSession session,Order order);
		
		
//찜 추가
		//찜 등록
		public int insertProductLike(SqlSession session,ProductLike like);
		//찜 리스트 조회
		public List<Product> selectMemberProductLike(SqlSession session,Paging paging,ProductLike like);
		//찜한 상품 카운트
		public int selectCountMemberProductLike(SqlSession session, ProductLike like);
		//찜 여부 확인
		public int selectCheckProductLike(SqlSession session,ProductLike like);
		//찜 삭제
		public int deleteProductLike(SqlSession session,ProductLike like);
		//로그인 멤버의 찜목록
		public List<ProductLike> selectMemberLikeList(SqlSession session, String memberId);

		//멤버 주소 등록 및 수정
		public int updateMemberAddr(SqlSession session,Member member);
		public int selectCheckMemberAddr(SqlSession session,Member member);
		
}
