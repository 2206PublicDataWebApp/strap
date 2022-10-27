package com.kh.strap.shop.product.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.OrderProduct;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.product.store.ProductStore;

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
		return session.selectList("ProductMapper.selectAdminAllProduct", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	@Override
	public List<Product> selectAdminProductSearch(SqlSession session, Paging paging, Search search) {
		return session.selectList("ProductMapper.selectAdminProductSearch", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	@Override
	public int selectCountAdminProductSearch(SqlSession session, Search search) {
		return session.selectOne("ProductMapper.selectCountAdminProductSearch", search);
	}
	
//주문별 상품목록 조회	
	@Override
	public List<Product> selectProductsOnOrder(SqlSession session, int orderNo) {
		return session.selectList("ProductMapper.selectProductsOnOrder", orderNo);
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
		return session.insert("OrderMapper.insertOrder", order);
	}
//주문 상품 List 등록
	@Override
	public int insertOrderProducts(SqlSession session, OrderProduct orderProduct) {
		return session.insert("OrderMapper.insertOrderProducts", orderProduct);
	}
	
//주문 조회
	@Override
	public Order selectOneOrder(SqlSession session, Order order) {
		return session.selectOne("OrderMapper.selectOneOrder", order);
	}

	@Override
	public List<Order> selectMemberOrder(SqlSession session, Paging paging, Search search) {
		return session.selectList("OrderMapper.selectMemberOrder", search, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	@Override
	public int selectCountMemberOrder(SqlSession session,Search search) {
		return session.selectOne("OrderMapper.selectCountMemberOrder", search);
	}

	@Override
	public List<Order> selectMemberCancelOrder(SqlSession session, Paging paging, Search search) {
		return session.selectList("OrderMapper.selectMemberCancelOrder",search,new RowBounds(paging.getOffset(),paging.getPageLimit()));
	}
	
	@Override
	public int selectCountMemberCancelOrder(SqlSession session,Search search) {
		return session.selectOne("OrderMapper.selectCountMemberCancelOrder", search);
	}
//주문 수정
	@Override
	public int updatePayCompleteOrder(SqlSession session, Order order) {
		return session.update("OrderMapper.updatePayComplete", order);
	}
	
	@Override
	public int updateDeliveryStartOrder(SqlSession session, Order order) {
		return session.update("OrderMapper.updateDeliveryStart",order);
	}

	@Override
	public int updateDeliveryCompleteOrder(SqlSession session, Order order) {
		return session.update("OrderMapper.updateDeliveryComplete",order);
	}

	@Override
	public int updateCancelOrder(SqlSession session, Order order) {
		return session.update("OrderMapper.updateOrderCancel",order);
	}
//찜
	//찜목록출력
	@Override
	public List<Product> selectMemberProductLike(SqlSession session, Paging paging, ProductLike like) {
		return session.selectList("ProductMapper.selectMemberProductLike", like, new RowBounds(paging.getOffset(), paging.getPageLimit()));
	}
	//멤버 찜 카운트
	@Override
	public int selectCountMemberProductLike(SqlSession session, ProductLike like) {
		return session.selectOne("ProductMapper.selectCountMemberProductLike",like);
	}
	//찜추가
	@Override
	public int insertProductLike(SqlSession session, ProductLike like) {
		return session.insert("ProductMapper.insertProductLike", like);
	}
	//찜체크
	@Override
	public int selectCheckProductLike(SqlSession session, ProductLike like) {
		return session.selectOne("ProductMapper.selectCheckProductLike", like);
	}
	//찜삭제
	@Override
	public int deleteProductLike(SqlSession session, ProductLike like) {
		return session.delete("ProductMapper.deleteProductLike", like);
	}

	//로그인 멤버의 찜목록
	@Override
	public List<ProductLike> selectMemberLikeList(SqlSession session, String memberId) {
		return session.selectList("ProductMapper.selectMemberLikeList", memberId);
	}

	//주문페이지: 멤버 주소 ajax
	@Override
	public int updateMemberAddr(SqlSession session, Member member) {
		return session.update("MemberMapper.updateMemberAddr", member);
	}

}
