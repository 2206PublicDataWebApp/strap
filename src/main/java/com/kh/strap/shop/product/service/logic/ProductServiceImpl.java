package com.kh.strap.shop.product.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
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
	@Override
	public int registerProduct(Product product) {
		return pStore.insertProduct(session, product);
	}
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
	
	@Override
	public int countAdminProductSearch(Search search) {
		return pStore.selectCountAdminProductSearch(session, search);
	}
	
	@Override
	public Product printOneProduct(Product product) {
		return pStore.selectOneProduct(session, product);
	}
	@Override
	public int modifyProduct(Product product) {
		return pStore.updateProduct(session, product);
	}
	@Override
	public int modifyProductGradeSum(Review review) {
		return pStore.updateProductGradeSum(session, review);
	}
//	@Override
//	public int modifyProductGradeAver(Product product) {
//		return pStore.updateProductGradeAver(session, product);
//	}
	@Override
	public int removeProduct(Product product) {
		return pStore.deleteProduct(session, product);
	}
	@Override
	public int registerOrder(Order order) {
		return pStore.insertOrder(session, order);
	}
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
//	@Override
//	public int modifyBackOrder(Order order) {
//		return pStore.updateBackOrder(session, order);
//	}
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
