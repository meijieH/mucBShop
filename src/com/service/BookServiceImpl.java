package com.service;


import java.util.List;

import com.DAO.BaseDAO;
import com.ORM.Book;

public class BookServiceImpl implements BookService {

	BaseDAO dao;
	
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<Book> listAllBooks() {
		// TODO Auto-generated method stub
		return dao.listAll("Book");
	}

	@Override
	public boolean saveBook(Book book) {
		// TODO Auto-generated method stub
		try
		{
			dao.saveOrUpdate(book);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public List<Book> listAllValidBooks(Integer stdId) {
		// TODO Auto-generated method stub
		try
		{
			
			return dao.query("from Book as a where a.state='正在售出' and a.student.id!="+stdId);
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Book loadBook(Integer id) {
		// TODO Auto-generated method stub
		try
		{
			return (Book)dao.loadById(Book.class, id);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Book> listBook(String hql) {
		// TODO Auto-generated method stub
		try
		{
			return dao.query(hql);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public List executeHql(String hql)
	{
		try
		{
			return dao.query(hql);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean delOrder(Integer id) {
		// TODO Auto-generated method stub
		try
		{
			dao.delById(Book.class, id);
			return true;
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

}
