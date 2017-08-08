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
	StudentService service; /**学生服务接口**/
	BookService bookservice;/**书籍服务接口**/
	CreditTransferService credit_transfer_service; /**转让记录service**/
	ShoplistService shop_list_service; /**购物车service**/
	
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

	/** 上传图片文件的属性 */
	private File pic;	//上传的文件
	private String picContentType;	//上传文件的类型
	private String picFileName;		//上传文件的文件名
	
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
		/*明码加密转换*/
		getModel().setPwd(MD5.MD5Encode(getModel().getPwd()));
		
		Student tempstudent=service.login(getModel());
		if(tempstudent!=null)
		{
			ServletActionContext.getRequest().getSession().setAttribute("student",tempstudent);
			return "index";
		}
		else{
			addActionMessage(getText("用户名或密码错误！"));
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
	
	/*验证注册信息*/
	public void validateRegStudent()
	{
		String username=this.getModel().getUsername();
		/*查询昵称是否已经存在*/
		if(service.queryStudent(username)!=null) 
		{
			this.addFieldError("username_existerror", getText("regstudent_username_existerror"));
		}
		/*验证两次输入的密码的一致性*/
		if(!getModel().getPwd().equals(this.getAgainPwd()))
		{
			this.addFieldError("pwdmatch_failed", getText("regstudent_pwdmatch_failed"));
		}
		/*验证邮箱地址格式的正确性*/
		if(!Pattern.matches("\\w+([-_+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*", getModel().getEmail()))
		{
			this.addFieldError("emailformat_error",getText("regstudent_emailformat_error"));
		}
		/*验证学号格式的正确性*/
		if(!Pattern.matches("\\w\\d{6}", getModel().getStdnum()))
		{
			this.addFieldError("stdnumformat_error",getText("regstudent_stdnumformat_error"));
		}
		/*验证手机号格式的正确性*/
		if(!Pattern.matches("\\d{11}", getModel().getPhonenumber()))
		{
			this.addFieldError("phonenumber_error",getText("regstudent_phonenumber_error"));
		}
	}
	
	public String regStudent()
	{
		/*用户密码加密*/
		getModel().setPwd(MD5.MD5Encode(getModel().getPwd()));
		
		/*上传图片*/
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
		/*如果用户修改头像，上传图片*/
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
		/**获取学生id,搜索学生信息**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/**根据学生的年级搜索同年级、同专业人推荐的书籍学生推荐的书籍**/
		String hql="from Student as a join a.books as b where a.grade='"+student.getGrade()+"' and a.major='"+student.getMajor()+"'";
		List list=service.executeHql(hql);
		System.out.println("查询结果为空");
		if(list==null) {System.out.println("查询结果为空");}
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
	/**删除已注册的书籍**/
	public String delMyBook()
	{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		bookservice.delOrder(id);
		
		return "toBrowseMyBooks";
	}
	
	/**修改密码**/
	public String updatePassword()
	{
		String oldPwd=ServletActionContext.getRequest().getParameter("oldPwd");
		String newPwd=ServletActionContext.getRequest().getParameter("newPwd");
		/**如果未有提交的数据，直接跳转数据提交页面**/
		if(oldPwd==null&&newPwd==null)
		{
			return INPUT;
		}
		/**验证old密码是否正确**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		if(!oldPwd.equals(student.getPwd()))
		{
			this.addActionMessage("密码错误");
			return INPUT;
		}
		/**保存新密码**/
		student.setPwd(newPwd);
		service.update(student);
		/**更新session中的student对象**/
		ServletActionContext.getRequest().getSession().setAttribute("student",student);
		this.addActionMessage("密码修改成功");
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
	 * 转让积分
	 * **/
	public String transferCredits()
	{
		Student from_std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/*验证输入的学号是否正确*/
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
			this.addActionMessage("转让学号和当前用户学号相同，转让不被允许");
			return INPUT;
		}
		
		
		from_std.setBalance(from_std.getBalance()-credit);
		service.update(from_std);
		System.out.println("from_std:"+from_std.getId());
		/*验证学号的用户是否存在*/
		String hql="from Student as a where a.stdnum='"+to_stdnum+"'";
		List<Student> list=service.executeHql(hql);
		if(list==null)
		{
			this.addActionMessage("转让学号不存在");
			return INPUT;
		}
		Student to_std=list.get(0);
		to_std.setBalance(to_std.getBalance()+credit);
		service.update(to_std);
		
		/**添加积分转让记录**/
		Date date=new Date();
		
		CreditTransfer trans=new CreditTransfer(from_std,to_std,credit,date,info);
		if(this.credit_transfer_service.save(trans))
		{
			this.addActionMessage("转让成功");
		}else{
			this.addActionMessage("转让失败");
		}
		return INPUT;
	}
	
	/*
	 * 添加书籍到购物车
	 * ***/
	public String addShopList(){
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		Integer book_id=Integer.parseInt(ServletActionContext.getRequest().getParameter("book_id"));
		
		String message=shop_list_service.addItem(std.getId(), book_id);
		/**出错提示*/
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
			this.addActionMessage("删除失败");
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
