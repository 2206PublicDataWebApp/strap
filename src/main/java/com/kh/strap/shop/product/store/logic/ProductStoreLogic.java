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
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.product.store.ProductStore;
import com.kh.strap.shop.review.domain.Review;

@Repository
public class ProductStoreLogic implements ProductStore {

//상품 등록
	@Override
	public int insertProduct(SqlSession session, Product product) {
		return session.insert("ProductMapper.insertProduct", product);
	}

	@Override
	public int insertSubImg(SqlSession session, ProductImg pi) {
		return session.insert("ProductMapper.insertSubImg", pi);
	}
	
	@Override
	public int insertInfoImg(SqlSession session, ProductImg pi) {
		return session.insert("ProductMapper.insertInfoImg",pi);
	}
//쇼핑몰 상품목록 조회		
	@Override
	public List<Product> selectAllProduct(SqlSession session, Paging paging, Search search) {
		return session.selectList("ProductMapper.selectAllProduct", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	@Override
	public List<Product> selectAllProductSearch(SqlSession session, Paging paging, Search search) {
		return session.selectList("ProductMapper.selectAllProductSearch",search,new RowBounds(paging.getOffset(),paging.getPageLimit()));
	}

	@Override
	public int selectCountAllProduct(SqlSession session) {
		return session.selectOne("ProductMapper.selectCountAllProduct");
	}

	@Override
	public int selectCountSearchProduct(SqlSession session, Search search) {
		return session.selectOne("ProductMapper.selectCountSearchProduct",search);
	}
//관리자 상품목록 조회	
	@Override
	public List<Product> selectAdminAllProduct(SqlSession session, Paging paging, Search search) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Product> selectAdminProductSearch(SqlSession session, Paging paging, Search search) {
		return session.selectList("ProductMapper.selectAdminProductSearch", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	@Override
	public int selectCountAdminProductSearch(SqlSession session, Search search) {
		return session.selectOne("ProductMapper.selectCountAdminProductSearch", search);
	}
//상품 상세 조회
	@Override
	public Product selectOneProduct(SqlSession session, Product product) {
		return session.selectOne("ProductMapper.selectOneProduct", product);
	}

	@Override
	public List<ProductImg> selectInfoImgByNo(SqlSession session, Product product) {
		return session.selectList("ProductMapper.selectInfoImgList", product);
	}

	@Override
	public List<ProductImg> selectSubImgByNo(SqlSession session, Product product) {
		return session.selectList("ProductMapper.selectSubImgList",product);
	}

//관리자 상품수정
	@Override
	public int updateProduct(SqlSession session, Product product) {
		return session.update("ProductMapper.updateProduct", product);
	}

	
//관리자 상품 삭제
	@Override
	public int deleteProduct(SqlSession session, Product product) {
		return session.delete("ProductMapper.deleteProduct", product);
	}
//주문 등록
	@Override
	public int insertOrder(SqlSession session, Order order) {
		return session.insert("", order);
	}
//주문 조회
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
//주문 수정
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
//찜 추가
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
