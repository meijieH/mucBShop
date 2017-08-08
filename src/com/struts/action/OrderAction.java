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
		/*����book״̬����*/
	    	
		book.setState("����");
		bookservice.saveBook(book);
	
		return "toOrders";
	}
	
	
	public String payOrder()
	{
		/**������ȡpasswordΪnull**/
		String password=(String)ServletActionContext.getRequest().getParameter("password");
		/**��passwordΪnull,��ʾ����ת��֧��ҳ��ģ�������������֤**/
		if(password==null)
		{
			return INPUT;
		}
		/**�۳��˻�����ң�**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		/**��ȡ��������**/
		Order order=service.getOrder(oid);
		/**��ȡ�鼮����**/
		Integer bid=order.getBook().getId();
		Book book=bookservice.loadBook(bid);
		/**�۳��û��˻����**/
		student.setBalance(student.getBalance()-book.getPrice());
		stdservice.update(student);
		/**����Order��״̬Ϊ��֧��**/
		order.setState("��֧��");
		service.update(order);
		
		/**����session��student����**/
		ServletActionContext.getRequest().getSession().setAttribute("student",student);
		return "toOrders";
	}
	
	
	public void validatePayOrder()
	{
		/**��֤����**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		String password=(String)ServletActionContext.getRequest().getParameter("password");
		/**��passwordΪnull,��ʾ����ת��֧��ҳ��ģ�������������֤**/
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
		/**��֤����˫���Ƿ�Ϊͬһ�ˣ�����**/
		Book book=bookservice.loadBook(getModel().getBook().getId());
		ServletActionContext.getRequest().setAttribute("book", book);
		if(getModel().getStudentByBuyerId().getId().equals(getModel().getStudentBySalerId().getId()))
		{
			this.addFieldError("addOrder_buyself_error", getText("addOrder_buyself_error"));
		}
		
		/**��ⶩ���Ƿ��Ѵ���**/
		Order checkorder=service.getOrder(getModel().getStudentByBuyerId().getId(),getModel().getStudentBySalerId().getId(),getModel().getBook().getId());
		if(checkorder!=null){
			this.addFieldError("Order_hasExist",getText("Order_hasExist"));
		}
		
		/**�鿴book�Ƿ��������۳�״̬**/
		
		if(!book.getState().equals("�����۳�"))
		{
			this.addFieldError("addOrder_saleout",getText("addOrder_saleout"));
		}
		
		/**����˻����**/
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
			/**��ȡ������Ϣ**/
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
		//��ȡ��Ļ���
		Integer jf=order.getBook().getPrice();
		//�������ҵĻ���
		order.getStudentBySalerId().setBalance(order.getStudentBySalerId().getBalance()+jf);
		//�����鼮״̬
		order.getBook().setState("���۳�");
		//���Ķ�����״̬
		order.setState("�����");
		//���¶�����Ϣ
		service.update(order); /**��������ͬʱ���ָö����Ĺ���������Ϣ**/
		bookservice.saveBook(order.getBook());
		stdservice.update(order.getStudentBySalerId());
		
		return "toOrders";
	}
	/**
	 * �û������˿�**/
	public String applyCredit()
	{
		/**��ȡ����id**/
		Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		/**��ȡ��������**/
		Order order=service.getOrder(oid);
		/**���Ķ���״̬Ϊ�������˿��С� **/
		order.setState("�����˿���");
		/**���¶���**/
		service.update(order);
		return "toOrders";
	}
	
	/**
	 * �鿴���������û����˿�����**/
	public String seeApplyBack()
	{
		/**��ȡ��������op,��ΪOK��ʾ��׼�˿�**/
		String apbackid=ServletActionContext.getRequest().getParameter("apbackid");
		if(apbackid!=null)
		{
			/**�˿��������ȡ����id**/
			Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("apbackid"));
			Order order=service.getOrder(oid);
		
			/**�˻���ҷ���**/
			Student buyer=order.getStudentByBuyerId();
			Integer newBalance=buyer.getBalance()+order.getBook().getPrice();
			buyer.setBalance(newBalance);
			stdservice.update(buyer);
			/**�����鼮״̬**/
			Book book=order.getBook();
			book.setState("�����۳�");
			bookservice.saveBook(book);
			/**���Ķ���״̬**/
			order.setState("�˿����");
			service.update(order);
		}
		
		/**��ȡ�û�����**/
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/**��ѯ���û������������ҽ�ɫ�ģ���״̬Ϊ�������˿��С��Ķ���**/
		String hql="from Order as a where a.studentBySalerId.id='"+std.getId()+"' and a.state='�����˿���'";
		orders=service.queryOrders(hql);
		ServletActionContext.getRequest().setAttribute("orders", orders);
		/**���ص�seeApplyBack.jspҳ��**/
		return INPUT;
	}
	
	/**ɾ������**/
	public String delOrder()
	{
		/**��ȡ����id**/
		Integer oid=Integer.parseInt(ServletActionContext.getRequest().getParameter("oid"));
		/**ɾ������**/
		service.delOrder(oid);
		/**��ת�����˶���ҳ**/
		return "toOrders";
	}

}
