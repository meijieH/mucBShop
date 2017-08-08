package com.struts.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.*;
import java.util.regex.*;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


import com.ORM.*;
import com.util.MD5;
import com.util.Tools;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.*;

public class StudentAction extends ActionSupport implements ModelDriven<Student> {

	Student student=new Student();
	StudentService service; /**ѧ������ӿ�**/
	BookService bookservice;/**�鼮����ӿ�**/
	CreditTransferService credit_transfer_service; /**ת�ü�¼service**/
	ShoplistService shop_list_service; /**���ﳵservice**/
	
	List<Order> myorders;
	List<Book> mybooks;
	List<Shoplist> myShoplist;
	String againPwd;
	
	
	public ShoplistService getShop_list_service() {
		return shop_list_service;
	}

	public void setShop_list_service(ShoplistService shop_list_service) {
		this.shop_list_service = shop_list_service;
	}

	public CreditTransferService getCredit_transfer_service() {
		return credit_transfer_service;
	}

	public void setCredit_transfer_service(
			CreditTransferService credit_transfer_service) {
		this.credit_transfer_service = credit_transfer_service;
	}

	public BookService getBookservice() {
		return bookservice;
	}

	public void setBookservice(BookService bookservice) {
		this.bookservice = bookservice;
	}
	public List<Book> getMybooks() {
		return mybooks;
	}

	public void setMybooks(List<Book> mybooks) {
		this.mybooks = mybooks;
	}

	public List<Order> getMyorders() {
		return myorders;
	}

	public void setMyorders(List<Order> myorders) {
		this.myorders = myorders;
	}

	/** �ϴ�ͼƬ�ļ������� */
	private File pic;	//�ϴ����ļ�
	private String picContentType;	//�ϴ��ļ�������
	private String picFileName;		//�ϴ��ļ����ļ���
	
	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getAgainPwd() {
		return againPwd;
	}

	public void setAgainPwd(String againPwd) {
		this.againPwd = againPwd;
	}

	public StudentService getService() {
		return service;
	}

	public void setService(StudentService service) {
		this.service = service;
	}

	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return student;
	}
	
	public String login()
	{
		/*�������ת��*/
		getModel().setPwd(MD5.MD5Encode(getModel().getPwd()));
		
		Student tempstudent=service.login(getModel());
		if(tempstudent!=null)
		{
			ServletActionContext.getRequest().getSession().setAttribute("student",tempstudent);
			return "index";
		}
		else{
			addActionMessage(getText("�û������������"));
			return INPUT;				
		}
			
	}
	
	public String browseOrders()
	{
		 Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		 System.out.println("studentid:"+student.getId());
		
		 myorders= service.queryAllOrders(student.getId());
		 ServletActionContext.getRequest().setAttribute("myorders", myorders);
	     System.out.println("orders:"+myorders.size());
		
		 return INPUT;
	}
	
	public String browseBooks()
	{
		 Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		 mybooks= service.queryAllBooks(student.getId());
		 
		 return INPUT;
	}
	
	/*��֤ע����Ϣ*/
	public void validateRegStudent()
	{
		String username=this.getModel().getUsername();
		/*��ѯ�ǳ��Ƿ��Ѿ�����*/
		if(service.queryStudent(username)!=null) 
		{
			this.addFieldError("username_existerror", getText("regstudent_username_existerror"));
		}
		/*��֤��������������һ����*/
		if(!getModel().getPwd().equals(this.getAgainPwd()))
		{
			this.addFieldError("pwdmatch_failed", getText("regstudent_pwdmatch_failed"));
		}
		/*��֤�����ַ��ʽ����ȷ��*/
		if(!Pattern.matches("\\w+([-_+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", getModel().getEmail()))
		{
			this.addFieldError("emailformat_error",getText("regstudent_emailformat_error"));
		}
		/*��֤ѧ�Ÿ�ʽ����ȷ��*/
		if(!Pattern.matches("\\w\\d{6}", getModel().getStdnum()))
		{
			this.addFieldError("stdnumformat_error",getText("regstudent_stdnumformat_error"));
		}
		/*��֤�ֻ��Ÿ�ʽ����ȷ��*/
		if(!Pattern.matches("\\d{11}", getModel().getPhonenumber()))
		{
			this.addFieldError("phonenumber_error",getText("regstudent_phonenumber_error"));
		}
	}
	
	public String regStudent()
	{
		/*�û��������*/
		getModel().setPwd(MD5.MD5Encode(getModel().getPwd()));
		
		/*�ϴ�ͼƬ*/
		if(getPic()!=null)
		{
			try{
				String tempfilename = Tools.getRndFilename()+Tools.getFileExtName(getPicFileName());
				String filename = ServletActionContext.getRequest().getRealPath("/upload").replaceAll("\\\\", "/")+"/"+tempfilename;
				System.out.println("filename="+filename);
				FileOutputStream fos = new FileOutputStream(filename);
				FileInputStream fis = new FileInputStream(getPic());
				byte[] buf = new byte[1024];
				int len = 0;
				while((len=fis.read(buf))>0){
					fos.write(buf,0,len);
				}
				if (fis!=null)fis.close();
				if (fos!=null)fos.close();
				getModel().setHeadpic(tempfilename);
			
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		service.regStudent(getModel());
		this.addActionMessage(getText("regstudent_success"));
		return INPUT;
	}
	
	public String editStudent()
	{
		/*����û��޸�ͷ���ϴ�ͼƬ*/
		if(getPic()!=null)
		{
			try{
				String tempfilename = Tools.getRndFilename()+Tools.getFileExtName(getPicFileName());
				String filename = ServletActionContext.getRequest().getRealPath("/upload").replaceAll("\\\\", "/")+"/"+tempfilename;
				System.out.println("filename="+filename);
				FileOutputStream fos = new FileOutputStream(filename);
				FileInputStream fis = new FileInputStream(getPic());
				byte[] buf = new byte[1024];
				int len = 0;
				while((len=fis.read(buf))>0){
					fos.write(buf,0,len);
				}
				if (fis!=null)fis.close();
				if (fos!=null)fos.close();
				getModel().setHeadpic(tempfilename);
			
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		if(service.regStudent(getModel()))
		{
			ServletActionContext.getRequest().getSession().setAttribute("student", getModel());
			this.addActionMessage(getText("editstudent_success"));
		}
		else
			this.addActionMessage(getText("editstudent_failed"));
		return INPUT;
	}

	
	public String exit()
	{
		ServletActionContext.getRequest().getSession().removeAttribute("student");
		return "tologin";
	}
	
	protected void searchForYou()
	{
		try
		{
		/**��ȡѧ��id,����ѧ����Ϣ**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/**����ѧ�����꼶����ͬ�꼶��ͬרҵ���Ƽ����鼮ѧ���Ƽ����鼮**/
		String hql="from Student as a join a.books as b where a.grade='"+student.getGrade()+"' and a.major='"+student.getMajor()+"'";
		List list=service.executeHql(hql);
		System.out.println("��ѯ���Ϊ��");
		if(list==null) {System.out.println("��ѯ���Ϊ��");}
		Iterator it=list.iterator();
		List<Book> tjbooks=new ArrayList<Book>();
		Object[] obj=null;
		while(it.hasNext())
		{
			obj=(Object[])it.next();
			tjbooks.add((Book)obj[1]);
	        
		}	
		ServletActionContext.getRequest().setAttribute("tjbooks", tjbooks);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	/**ɾ����ע����鼮**/
	public String delMyBook()
	{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		bookservice.delOrder(id);
		
		return "toBrowseMyBooks";
	}
	
	/**�޸�����**/
	public String updatePassword()
	{
		String oldPwd=ServletActionContext.getRequest().getParameter("oldPwd");
		String newPwd=ServletActionContext.getRequest().getParameter("newPwd");
		/**���δ���ύ�����ݣ�ֱ����ת�����ύҳ��**/
		if(oldPwd==null&&newPwd==null)
		{
			return INPUT;
		}
		/**��֤old�����Ƿ���ȷ**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		if(!oldPwd.equals(student.getPwd()))
		{
			this.addActionMessage("�������");
			return INPUT;
		}
		/**����������**/
		student.setPwd(newPwd);
		service.update(student);
		/**����session�е�student����**/
		ServletActionContext.getRequest().getSession().setAttribute("student",student);
		this.addActionMessage("�����޸ĳɹ�");
		return INPUT;
	}
	
	public String getBooksByConditions()
	{
		try {
			ServletActionContext.getRequest().setCharacterEncoding("utf8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String press=ServletActionContext.getRequest().getParameter("press");
		String subject=ServletActionContext.getRequest().getParameter("subject");
		String grade=ServletActionContext.getRequest().getParameter("grade");
		String type=ServletActionContext.getRequest().getParameter("type");
		String min_price=ServletActionContext.getRequest().getParameter("min_price");
		String max_price=ServletActionContext.getRequest().getParameter("max_price");
		
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		
		mybooks=service.getBooksByConditions(std.getId(), press, subject, grade, type, min_price, max_price);
		
		if(mybooks==null)
			System.out.println("mybooks is null");
		
		return INPUT;
	}
	
	/**
	 * ת�û���
	 * **/
	public String transferCredits()
	{
		Student from_std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/*��֤�����ѧ���Ƿ���ȷ*/
		String to_stdnum=ServletActionContext.getRequest().getParameter("to_stdnum");
		if(to_stdnum==null||to_stdnum.equals(""))
		{
			return INPUT;
		}
		String isWhole=ServletActionContext.getRequest().getParameter("isWhole");
		Integer credit=0;
		if(isWhole!=null){
			credit=from_std.getBalance();
		}else{
			credit=Integer.parseInt(ServletActionContext.getRequest().getParameter("credit"));
		}
		String info=ServletActionContext.getRequest().getParameter("info");
		
		if(from_std.getStdnum().equals(to_stdnum))
		{
			this.addActionMessage("ת��ѧ�ź͵�ǰ�û�ѧ����ͬ��ת�ò�������");
			return INPUT;
		}
		
		
		from_std.setBalance(from_std.getBalance()-credit);
		service.update(from_std);
		System.out.println("from_std:"+from_std.getId());
		/*��֤ѧ�ŵ��û��Ƿ����*/
		String hql="from Student as a where a.stdnum='"+to_stdnum+"'";
		List<Student> list=service.executeHql(hql);
		if(list==null)
		{
			this.addActionMessage("ת��ѧ�Ų�����");
			return INPUT;
		}
		Student to_std=list.get(0);
		to_std.setBalance(to_std.getBalance()+credit);
		service.update(to_std);
		
		/**��ӻ���ת�ü�¼**/
		Date date=new Date();
		
		CreditTransfer trans=new CreditTransfer(from_std,to_std,credit,date,info);
		if(this.credit_transfer_service.save(trans))
		{
			this.addActionMessage("ת�óɹ�");
		}else{
			this.addActionMessage("ת��ʧ��");
		}
		return INPUT;
	}
	
	/*
	 * ����鼮�����ﳵ
	 * ***/
	public String addShopList(){
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		Integer book_id=Integer.parseInt(ServletActionContext.getRequest().getParameter("book_id"));
		
		String message=shop_list_service.addItem(std.getId(), book_id);
		/**������ʾ*/
		if(message!=null)
		{
			HttpServletResponse response=ServletActionContext.getResponse();
			response.setCharacterEncoding("GBK");
			response.setContentType("text/html");
			try {
				PrintWriter out=response.getWriter();
				out.println("<script>alert('"+message+"');history.back();</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "viewMyShopList";
	}
	
	public String viewMyShopList(){
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		List<Shoplist> shoplist=shop_list_service.viewShopList(std.getId(),true);
		List<Shoplist> invalid_shoplist=shop_list_service.viewShopList(std.getId(),false);
		ServletActionContext.getRequest().setAttribute("shoplist", shoplist);
		ServletActionContext.getRequest().setAttribute("invalid_shoplist", invalid_shoplist);
		return INPUT;
	}
	
	public String delShopListItem()
	{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		if(!shop_list_service.delItem(id)){
			this.addActionMessage("ɾ��ʧ��");
		}
		return "viewMyShopList";
	}
	
	
	public String payFromShoplist()
	{
		String ids=ServletActionContext.getRequest().getParameter("ids");
		System.out.println("before split ids:"+ids);
		String id_array[]=ids.split("-");
		System.out.println("after split ids[0]:"+id_array[0]);
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		
		shop_list_service.goPay(id_array,std);
		
		 myorders= service.queryAllOrders(std.getId());
		 ServletActionContext.getRequest().setAttribute("myorders", myorders);
		 return "viewMyOrders";
	}
}
