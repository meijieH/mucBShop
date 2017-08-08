package com.struts.action;

import java.util.*;

import org.apache.struts2.ServletActionContext;

import com.ORM.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.*;
import com.util.MD5;

public class AdminAction extends ActionSupport implements ModelDriven<Admin> {

	Admin admin=new Admin();
	AdminService service;
	BookService bookservice;
	AppealService appealservice;
	List<Book> books;
	List<Book> allRegBooks;
	List<Appeal> appeals;
	
	public List<Appeal> getAppeals() {
		return appeals;
	}

	public void setAppeals(List<Appeal> appeals) {
		this.appeals = appeals;
	}

	public AppealService getAppealservice() {
		return appealservice;
	}

	public void setAppealservice(AppealService appealservice) {
		this.appealservice = appealservice;
	}


	
	
	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public AdminService getService() {
		return service;
	}

	public void setService(AdminService service) {
		this.service = service;
	}

	
	public BookService getBookservice() {
		return bookservice;
	}

	public void setBookservice(BookService bookservice) {
		this.bookservice = bookservice;
	}

	public List<Book> getAllRegBooks() {
		return allRegBooks;
	}

	public void setAllRegBooks(List<Book> allRegBooks) {
		this.allRegBooks = allRegBooks;
	}
	
	@Override
	public Admin getModel() {
		// TODO Auto-generated method stub
		return admin;
	}
	
	public String login()
	{
		Admin admin=service.login(getModel().getUsername(), getModel().getPwd());
		if(admin==null)
		{
			this.addActionMessage(getText("admin_logincheck_failed"));
			return INPUT;
		}
		ServletActionContext.getRequest().getSession().setAttribute("admin", admin);
		appeals=appealservice.getUnhandledAppeals();
		books=bookservice.listBook("from Book as a where a.state='待审核'");
		allRegBooks=bookservice.listBook("from Book as a where a.state='正在售出' or a.state='冻结'");
		ServletActionContext.getRequest().getSession().setAttribute("books", books);
		ServletActionContext.getRequest().getSession().setAttribute("appeals", appeals);
		ServletActionContext.getRequest().getSession().setAttribute("allRegBooks", allRegBooks);
		return LOGIN;	
	}
	
	
	public String listStorage()
	{
		books=bookservice.listBook("from Book as a where a.state='正在售出' or a.state='冻结'");
		return "listStorage";
	}
	
	

	public String listUncheck()
	{
		books=bookservice.listBook("from Book as a where a.state='待审核'");
		return "listUncheck";
	}
	
	//获取所有申诉项，并按时间由近及远排序
	public String browseAppeals()
	{
		appeals=appealservice.getUnhandledAppeals();
		return INPUT;
	}
	
	
	//回复申述
	public String replyAppeal()
	{
			appeals=appealservice.getUnhandledAppeals();
			return INPUT;
	}
	
}