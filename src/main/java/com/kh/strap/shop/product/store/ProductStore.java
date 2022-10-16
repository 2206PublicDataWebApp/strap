package com.kh.strap.shop.product.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.review.domain.Review;

public interface ProductStore {
	
	//상품
		public int insertProduct(SqlSession session,Product product);
		public List<Product> selectAllProduct(SqlSession session,Paging paging,Search search);
		public Product selectOneProduct(SqlSession session,Product product);
		public int updateProduct(SqlSession session,Product product);
		public int updateProductGradeSum(SqlSession session,Review review);
		public int deleteProduct(SqlSession session,Product product);
		
		
		//주문
		public int insertOrder(SqlSession session,Order order);
		public Order selectOneOrder(SqlSession session,Order order);
		public List<Order> selectMemberOrder(SqlSession session,Paging paging,Search search,Order order);
		public List<Order> selectMemberCancelOrder(SqlSession session,Paging paging,Search search,Order order);
		public int updatePayCompleteOrder(SqlSession session,Order order);
		public int updateDeliveryStartOrder(SqlSession session, Order order);
		public int updateDeliveryCompleteOrder(SqlSession session,Order order);
		public int updateCancelOrder(SqlSession session,Order order);
		public int updateBackOrder(SqlSession session,Order order);
		
		//찜
		public int insertProductLike(SqlSession session,ProductLike like);
		public List<Product> selectProductLike(SqlSession session,Paging paging,ProductLike like);
		public int deleteProductLike(SqlSession session,ProductLike like);

}
