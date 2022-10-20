package com.kh.strap.shop.product.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.product.service.ProductService;
import com.kh.strap.shop.product.store.ProductStore;
import com.kh.strap.shop.review.domain.Review;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductStore pStore;
	@Autowired
	SqlSession session;
	
//상품 등록
	@Override
	public int registerProduct(Product product) {
		return pStore.insertProduct(session, product);
	}
	@Override
	public int registerSubImg(ProductImg pi) {
		return pStore.insertSubImg(session, pi);
	}
	@Override
	public int registerInfoImg(ProductImg pi) {
		return pStore.insertInfoImg(session,pi);
	}
//쇼핑몰 상품목록 조회	
	@Override
	public List<Product> printAllProduct(Paging paging, Search search) {
		return pStore.selectAllProduct(session, paging, search);
	}
	@Override
	public List<Product> printAllProductSearch(Paging paging, Search search) {
		return pStore.selectAllProductSearch(session, paging, search);
	}
	@Override
	public int countAllProduct() {
		return pStore.selectCountAllProduct(session);
	}
	@Override
	public int countSearchProduct(Search search) {
		return pStore.selectCountSearchProduct(session, search);
	}
//관리자 상품목록 조회
	@Override
	public List<Product> printAdminAllProduct(Paging paging, Search search) {
		return pStore.selectAdminAllProduct(session, paging, search);
	}
	@Override
	public List<Product> printAdminProductSearch(Paging paging, Search search) {
		return pStore.selectAdminProductSearch(session, paging, search);
	}
	@Override
	public int countAdminProductSearch(Search search) {
		return pStore.selectCountAdminProductSearch(session, search);
	}
//상품 상세 조회
	@Override
	public Product printOneProduct(Product product) {
		return pStore.selectOneProduct(session, product);
	}
	@Override
	public List<ProductImg> printInfoImgByNo(Product product) {
		return pStore.selectInfoImgByNo(session, product);
	}
	@Override
	public List<ProductImg> printSubImgByNo(Product product) {
		return pStore.selectSubImgByNo(session, product);
	}
//관리자 상품 수정
	@Override
	public int modifyProduct(Product product) {
		return pStore.updateProduct(session, product);
	}
//관리자 상품 삭제
	@Override
	public int removeProduct(Product product) {
		return pStore.deleteProduct(session, product);
	}
//주문 등록
	@Override
	public int registerOrder(Order order) {
		return pStore.insertOrder(session, order);
	}
//주문 조회
	@Override
	public Order printOneOrder(Order order) {
		return pStore.selectOneOrder(session, order);
	}
	@Override
	public List<Order> printMemberOrder(Paging paging, Search search, Order order) {
		return pStore.selectMemberOrder(session, paging, search, order);
	}
	@Override
	public List<Order> printMemberCancelOrder(Paging paging, Search search, Order order) {
		return pStore.selectMemberCancelOrder(session, paging, search, order);
	}
//주문 수정
	@Override
	public int modifyPayCompleteOrder(Order order) {
		return pStore.updatePayCompleteOrder(session, order);
	}
	@Override
	public int modifyDeliveryStartOrder(Order order) {
		return pStore.updateDeliveryStartOrder(session, order);
	}
	@Override
	public int modifyDeliveryCompleteOrder(Order order) {
		return pStore.updateDeliveryCompleteOrder(session, order);
	}
	@Override
	public int modifyCancelOrder(Order order) {
		return pStore.updateCancelOrder(session, order);
	}
//찜 추가
	@Override
	public int registerProductLike(ProductLike like) {
		return pStore.insertProductLike(session, like);
	}
	@Override
	public List<Product> printProductLike(Paging paging, ProductLike like) {
		return pStore.selectProductLike(session, paging, like);
	}
	@Override
	public int checkProductLike(ProductLike like) {
		return pStore.selectCheckProductLike(session, like);
	}
	@Override
	public int removeProductLike(ProductLike like) {
		return pStore.deleteProductLike(session, like);
	}











	
}
