package com.kh.strap.shop.product.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.product.store.ProductStore;
import com.kh.strap.shop.review.domain.Review;

@Repository
public class ProductStoreLogic implements ProductStore {

	@Override
	public int insertProduct(SqlSession session, Product product) {
		return session.insert("ProductMapper.insertProduct", product);
	}

	@Override
	public List<Product> selectAllProduct(SqlSession session, Paging paging, Search search) {
		return session.selectList("ProductMapper.selectAllProduct", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	
	@Override
	public List<Product> selectAllProductSearch(SqlSession session, Paging paging, Search search) {
		return session.selectList("ProductMapper.selectAllProductSearch", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public Product selectOneProduct(SqlSession session, Product product) {
		return session.selectOne("ProductMapper.selectOneProduct", product);
	}


	@Override
	public int updateProduct(SqlSession session, Product product) {
		return session.update("ProductMapper.updateProduct", product);
	}
	
	@Override
	public int updateProductGradeSum(SqlSession session, Review review) {
		return session.update("ProductMapper.updateProductGradeSum",review);
	}
	
//	@Override
//	public int updateProductGradeAver(SqlSession session, Product product) {
//		return session.update("ProductMapper.",product);
//	}

	@Override
	public int deleteProduct(SqlSession session, Product product) {
		return session.delete("ProductMapper.deleteProduct", product);
	}

	@Override
	public int insertOrder(SqlSession session, Order order) {
		return session.insert("", order);
	}

	@Override
	public Order selectOneOrder(SqlSession session, Order order) {
		return session.selectOne("", order);
	}

	@Override
	public List<Order> selectMemberOrder(SqlSession session, Paging paging, Search search, Order order) {
		
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("search",search);
		hashMap.put("order",order);
		return session.selectList("", hashMap, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public List<Order> selectMemberCancelOrder(SqlSession session, Paging paging, Search search, Order order) {
		
		HashMap<String,Object> hashMap = new HashMap<>();
		hashMap.put("search",search);
		hashMap.put("order",order);
		return session.selectList("",hashMap,new RowBounds(paging.getOffset(),paging.getPageLimit()));
	}

	@Override
	public int updatePayCompleteOrder(SqlSession session, Order order) {
		return session.update("", order);
	}
	
	@Override
	public int updateDeliveryStartOrder(SqlSession session, Order order) {
		return session.update("",order);
	}

	@Override
	public int updateDeliveryCompleteOrder(SqlSession session, Order order) {
		return session.update("",order);
	}

	@Override
	public int updateCancelOrder(SqlSession session, Order order) {
		return session.update("",order);
	}

	@Override
	public int updateBackOrder(SqlSession session, Order order) {
		return session.update("", order);
	}

	@Override
	public int insertProductLike(SqlSession session, ProductLike like) {
		return session.insert("ProductMapper.insertProductLike", like);
	}

	@Override
	public List<Product> selectProductLike(SqlSession session, Paging paging, ProductLike like) {
		return session.selectList("ProductMapper.selectProductLike", like, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	
	@Override
	public int selectCheckProductLike(SqlSession session, ProductLike like) {
		return session.selectOne("ProductMapper.selectCheckProductLike", like);
	}

	@Override
	public int deleteProductLike(SqlSession session, ProductLike like) {
		return session.delete("ProductMapper.deleteProductLike", like);
	}











}
