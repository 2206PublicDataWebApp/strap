package com.kh.strap.shop.product.service.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.member.domain.Member;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.OrderCancel;
import com.kh.strap.shop.product.domain.OrderProduct;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductImg;
import com.kh.strap.shop.product.domain.ProductLike;
import com.kh.strap.shop.product.service.ProductService;
import com.kh.strap.shop.product.store.ProductStore;

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
	public int countAllProduct(Search search) {
		return pStore.selectCountAllProduct(session,search);
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

//주문별 상품목록 조회
	@Override
	public List<Product> printProductsOnOrder(String orderNo) {
		return pStore.selectProductsOnOrder(session, orderNo);
	}
//관리자: 판매량 갱신
	@Override
	public int renewSales() {
		List<Product> pList = pStore.selectGetAllProductNo(session);
		if(!pList.isEmpty()) {
			pList.stream().forEach(p -> {
				pStore.updateSales(session, p.getProductNo());
			});
			return 1;
		}else {
			return 0;
		}
	}
	

//주문별 주문상품목록 조회
	@Override
	public List<OrderProduct> printOrderProductsOnOrder(String orderNo) {
		return pStore.selectOrderProductsOnOrder(session, orderNo);
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
	public int modifyProductInfo(Product product) {
		return pStore.updateProductInfo(session, product);
	}
//수정을 위한 서브이미지 및 인포이미지 삭제	
	@Override
	public int removeSubImgOnProduct(int productNo) {
		return pStore.deleteSubImgOnProduct(session, productNo);
	}
	@Override
	public int removeInfoImgOnProduct(int productNo) {
		return pStore.deleteInfoImgOnProduct(session, productNo);
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
//주문 상품 List 등록
	@Override
	public int registerOrderProducts(OrderProduct orderProduct) {
		return pStore.insertOrderProducts(session, orderProduct);
	}
//결제금액 체크	
	@Override
	public int getTobePaidFinalCost(String merchant_uid) {
		return pStore.selectGetTobePaidFinalCost(session, merchant_uid);
	}
	
//주문 조회
	@Override
	public Order printOneOrder(String merchant_uid) {
		return pStore.selectOneOrder(session, merchant_uid);
	}
	@Override
	public List<Order> printMemberOrder(Paging paging, Search search) {
		return pStore.selectMemberOrder(session, paging, search);
	}
	@Override
	public int countMemberOder(Search search) {
		return pStore.selectCountMemberOrder(session, search);
	}
	@Override
	public List<Order> printMemberCancelOrder(Paging paging, Search search) {
		return pStore.selectMemberCancelOrder(session, paging, search);
	}
	@Override
	public int countMemberCancelOrder(Search search) {
		return pStore.selectCountMemberCancelOrder(session, search);
	}
	
//관리자:주문관리
	@Override
	public List<Order> printManageOrder(Paging paging, Search search) {
		return pStore.selectManageOrder(session, paging, search);
	}
//관리자:주문관리 카운트
	@Override
	public int countManageOrder(Search search) {
		return pStore.selectCountManageOrder(session, search);
	}
//주문 수정
	@Override
	public int modifyPayCompleteOrder(Map<String,String> paidMap) {
		return pStore.updatePayCompleteOrder(session, paidMap);
	}
	@Override
	public int modifyDeliveryStartOrder(String merchant_uid) {
		return pStore.updateDeliveryStartOrder(session, merchant_uid);
	}
	@Override
	public int modifyDeliveryCompleteOrder(String merchant_uid) {
		return pStore.updateDeliveryCompleteOrder(session, merchant_uid);
	}
	@Override
	public int modifyCancelOrder(String merchant_uid) {
		return pStore.updateCancelOrder(session, merchant_uid);
	}
	@Override
	public int modifyVBankInfo(Order order) {
		return pStore.updateVBankInfo(session, order);
	}
	
//주문 취소
	//주문 취소 정보 insert
	public int registerCancelInfo(OrderCancel oc) {
		return pStore.insertCancelInfo(session, oc);
	}
	
	
	
//찜
	//찜목록출력
	@Override
	public List<Product> printMemberProductLike(Paging paging, ProductLike like) {
		return pStore.selectMemberProductLike(session, paging, like);
	}
	//찜추가
	@Override
	public int registerdeleteProductLike(ProductLike like) {
		if(pStore.selectCheckProductLike(session, like) > 0) {
			//찜체크가 있으면 딜리트
			pStore.deleteProductLike(session, like);
			return 0;
		}else {
			//찜체크가 없으면 인서트
			pStore.insertProductLike(session, like);
			return 1;
		}
	}
	//로그인 멤버의 찜목록
	@Override
	public List<ProductLike> memberLikeList(String memberId) {
		return pStore.selectMemberLikeList(session, memberId);
	}
	//멤버 찜 카운트
	@Override
	public int countMemberProductLike(ProductLike like) {
		return pStore.selectCountMemberProductLike(session, like);
	}
	
	//주문페이지: 멤버 주소 변경, 업데이트만 하면됨.
	@Override
	public int modifyMemberAddr(Member member) {
		return pStore.updateMemberAddr(session, member);
	}
	@Override
	public int modifyProductMainImg(Product product) {
		return pStore.updateProductMainImg(session, product);
	}


	
}
