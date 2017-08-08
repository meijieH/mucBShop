package com.service;

import java.util.List;

import com.DAO.BaseDAO;
import com.ORM.*;

public class OrderServiceImpl implements OrderService {

	BaseDAO dao;
	
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		try
		{
			dao.saveOrUpdate(order);
			return true;
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return false;
	}

	@Override
	public Order getOrder(Integer buyerId, Integer salerId, Integer bookId) {
		// TODO Auto-generated method stub
		try
		{
			String hql="from Order as a where a.studentByBuyerId.id='"+buyerId+"' and a.studentBySalerId.id='"+salerId+"' and a.book.id='"+bookId+"' and a.state!='ÍË¿îÍê³É'";
			return (Order)dao.loadObject(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Order getOrder(Integer orderId) {
		// TODO Auto-generated method stub
		try
		{
			return (Order)dao.loadById(Order.class, orderId);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean update(Order order) {
		// TODO Auto-generated method stub
		return this.addOrder(order);
	}

	@Override
	public Order getOrderByBookId(Integer bid) {
		// TODO Auto-generated method stub
		try
		{
			String hql="from Order as a where a.book.id='"+bid+"'";
			return (Order)dao.loadObject(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Order> queryOrders(String hql) {
		// TODO Auto-generated method stub
		try
		{
			return dao.query(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean delOrder(Integer id) {
		// TODO Auto-generated method stub
		try
		{
			dao.delById(Order.class, id);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	

}
