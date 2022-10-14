package com.kh.strap.shop.product.service;

import java.util.List;

import com.kh.strap.common.Paging;
import com.kh.strap.common.Search;
import com.kh.strap.shop.product.domain.Order;
import com.kh.strap.shop.product.domain.Product;
import com.kh.strap.shop.product.domain.ProductLike;

public interface ProductService {
	//상품
	public int registerProduct(Product product);
	public List<Product> printAllProduct(Paging paging,Search search);
	public Product printOneProduct(Product product);
	public List<Product> printLikeProduct(Paging paging);
	public int modifyProduct(Product product);
	public int removeProduct(Product product);
	
	
	//주문
	public int registerOrder(Order order);
	public Order printOneOrder(Order order);
	public List<Order> printMemberOrder(Paging paging,Search search,Order order);
	public List<Order> printMemberCancelOrder(Paging paging,Search search,Order order);
	public int modifyPayCompleteOrder(Order order);
	public int modifyDeliveryCompleteOrder(Order order);
	public int modifyCancelOrder(Order order);
	public int modifyBackOrder(Order order);
	
	//찜
	public int registerProductLike(ProductLike like);
	public List<Product> printProductLike(Paging paging,ProductLike like);
	public int removeProductLike(ProductLike like);
	
	
}
