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

@Repository
public class ProductStoreLogic implements ProductStore {

	@Override
	public int insertProduct(SqlSession session, Product product) {
		return session.insert("", product);
	}

	@Override
	public List<Product> selectAllProduct(SqlSession session, Paging paging, Search search) {
		return session.selectList("", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public Product selectOneProduct(SqlSession session, Product product) {
		return session.selectOne("", product);
	}

	@Override
	public List<Product> selectLikeProduct(SqlSession session, Paging paging) {
		return session.selectList("", null, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public int updateProduct(SqlSession session, Product product) {
		return session.update("", product);
	}

	@Override
	public int deleteProduct(SqlSession session, Product product) {
		return session.delete("", product);
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
		return session.insert("", like);
	}

	@Override
	public List<Product> selectProductLike(SqlSession session, Paging paging, ProductLike like) {
		return session.selectList("", like, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}

	@Override
	public int deleteProductLike(SqlSession session, ProductLike like) {
		return session.delete("", like);
	}

}
