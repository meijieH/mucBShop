package com.service;
import java.util.*;

import com.ORM.*;
public interface StudentService {

	public boolean regStudent(Student student);
	public boolean update(Student student);
	public Student login(Student student);
	public boolean delete(Integer id);
	public void editStudent(Student student);
	public List<Order> queryAllOrders(Integer id);
	public List<Book> queryAllBooks(Integer id);
	public Student queryStudent(String username);
	public Student loadStudent(Integer id);
	public List executeHql(String hql);
	public List<Book> getBooksByConditions(Integer ownid,String press,String subject,String grade,String type,String min_price, String max_price);
}
