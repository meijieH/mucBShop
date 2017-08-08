package com.service;

import java.util.List;

import com.ORM.*;

public interface OrderService {
	
	public boolean addOrder(Order order);
	public Order getOrder(Integer buyerId,Integer salerId,Integer bookId);
	public Order getOrder(Integer orderId);
	public boolean update(Order order);
	public Order getOrderByBookId(Integer bid);
	public List<Order> queryOrders(String hql);
	public boolean delOrder(Integer id);
	
}
