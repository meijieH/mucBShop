package com.struts.action;

import java.io.PrintWriter;
import java.util.*;

import org.apache.struts2.ServletActionContext;

import com.ORM.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.*;
import com.util.MD5;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	Order order=new Order();
	OrderService service;
	BookService bookservice;
	StudentService stdservice;
	List<Order> orders=new ArrayList<Order>();
	
	
	

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public StudentService getStdservice() {
		return stdservice;
	}

	public void setStdservice(StudentService stdservice) {
		this.stdservice = stdservice;
	}

	public BookService getBookservice() {
		return bookservice;
	}

	public void setBookservice(BookService bookservice) {
		this.bookservice = bookservice;
	}

	public OrderService getService() {
		return service;
	}

	public void setService(OrderService service) {
		this.service = service;
	}

	@Override
	public Order getModel() {
		// TODO Auto-generated method stub
		return order;
	}
	
	
	public String addOrder()
	{
		
		service.addOrder(getModel());
		
		Book book=bookservice.loadBook(getModel().getBook().getId());
		/*更改book状态属性*/
	    	
		book.setState("冻结");
		bookservice.saveBook(book);
	
		return "toOrders";
	}
	
	
	public String payOrder()
	{
		/**如若获取password为null**/
		String password=(String)ServletActionContext.getRequest().getParameter("password");
		/**若password为null,表示是跳转到支付页面的，不进行密码验证**/
		if(password==null)
		{
			return INPUT;
		}
		/**扣除账户余额（书币）**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		/**获取订单对象**/
		Order order=service.getOrder(oid);
		/**获取书籍对象**/
		Integer bid=order.getBook().getId();
		Book book=bookservice.loadBook(bid);
		/**扣除用户账户余额**/
		student.setBalance(student.getBalance()-book.getPrice());
		stdservice.update(student);
		/**更新Order的状态为已支付**/
		order.setState("已支付");
		service.update(order);
		
		/**更新session的student属性**/
		ServletActionContext.getRequest().getSession().setAttribute("student",student);
		return "toOrders";
	}
	
	
	public void validatePayOrder()
	{
		/**验证密码**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		String password=(String)ServletActionContext.getRequest().getParameter("password");
		/**若password为null,表示是跳转到支付页面的，不进行密码验证**/
		if(password==null)
			return;
	    password=MD5.MD5Encode(password);
	    
		if(!password.equals(student.getPwd()))
		{
			this.addFieldError("payOk_pwd_error", getText("payOk_pwd_error"));
			return;
		}
	}
	public void validateAddOrder()
	{
		/**验证买卖双方是否为同一人，报错**/
		Book book=bookservice.loadBook(getModel().getBook().getId());
		ServletActionContext.getRequest().setAttribute("book", book);
		if(getModel().getStudentByBuyerId().getId().equals(getModel().getStudentBySalerId().getId()))
		{
			this.addFieldError("addOrder_buyself_error", getText("addOrder_buyself_error"));
		}
		
		/**检测订单是否已存在**/
		Order checkorder=service.getOrder(getModel().getStudentByBuyerId().getId(),getModel().getStudentBySalerId().getId(),getModel().getBook().getId());
		if(checkorder!=null){
			this.addFieldError("Order_hasExist",getText("Order_hasExist"));
		}
		
		/**查看book是否处于正在售出状态**/
		
		if(!book.getState().equals("正在售出"))
		{
			this.addFieldError("addOrder_saleout",getText("addOrder_saleout"));
		}
		
		/**检测账户余额**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		if(student.getBalance()<book.getPrice())
		{
			this.addFieldError("balance_not_enough",getText("balance_not_enough"));
		}
	}
	
	public String bookInfo()
	{
		try
			{
			Integer bid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
			System.out.println("id:"+bid);
			Order order=service.getOrderByBookId(bid);
			/**获取卖家信息**/
			Student std=order.getStudentByBuyerId();
			
			ServletActionContext.getRequest().setAttribute("buyer", std);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "input";
	}
	
	
	public String recvOK()
	{
		Integer orderid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		Order order=service.getOrder(orderid);
		//获取书的积分
		Integer jf=order.getBook().getPrice();
		//增加卖家的积分
		order.getStudentBySalerId().setBalance(order.getStudentBySalerId().getBalance()+jf);
		//更改书籍状态
		order.getBook().setState("已售出");
		//更改订单的状态
		order.setState("已完成");
		//更新订单信息
		service.update(order); /**联级操作同时保持该订单的关联对象信息**/
		bookservice.saveBook(order.getBook());
		stdservice.update(order.getStudentBySalerId());
		
		return "toOrders";
	}
	/**
	 * 用户申请退款**/
	public String applyCredit()
	{
		/**获取订单id**/
		Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		/**获取订单对象**/
		Order order=service.getOrder(oid);
		/**更改订单状态为“申请退款中” **/
		order.setState("申请退款中");
		/**更新订单**/
		service.update(order);
		return "toOrders";
	}
	
	/**
	 * 查看来自其他用户的退款申请**/
	public String seeApplyBack()
	{
		/**获取操作参数op,若为OK表示批准退款**/
		String apbackid=ServletActionContext.getRequest().getParameter("apbackid");
		if(apbackid!=null)
		{
			/**退款操作，获取订单id**/
			Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("apbackid"));
			Order order=service.getOrder(oid);
		
			/**退还买家费用**/
			Student buyer=order.getStudentByBuyerId();
			Integer newBalance=buyer.getBalance()+order.getBook().getPrice();
			buyer.setBalance(newBalance);
			stdservice.update(buyer);
			/**更改书籍状态**/
			Book book=order.getBook();
			book.setState("正在售出");
			bookservice.saveBook(book);
			/**更改订单状态**/
			order.setState("退款完成");
			service.update(order);
		}
		
		/**获取用户对象**/
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/**查询该用户的所有以卖家角色的，且状态为“申请退款中”的订单**/
		String hql="from Order as a where a.studentBySalerId.id='"+std.getId()+"' and a.state='申请退款中'";
		orders=service.queryOrders(hql);
		ServletActionContext.getRequest().setAttribute("orders", orders);
		/**返回到seeApplyBack.jsp页面**/
		return INPUT;
	}
	
	/**删除订单**/
	public String delOrder()
	{
		/**获取订单id**/
		Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("oid"));
		/**删除订单**/
		service.delOrder(oid);
		/**跳转至个人订单页**/
		return "toOrders";
	}

}
