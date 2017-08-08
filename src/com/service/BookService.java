package com.service;

import java.util.List;

import com.ORM.Book;

public interface BookService {
	public List<Book> listAllBooks();
	public boolean saveBook(Book book);
	public List<Book> listAllValidBooks(Integer stdId);
	public Book loadBook(Integer id);
	public List<Book> listBook(String hql);
	public List executeHql(String hql);
	public boolean delOrder(Integer id);
}
