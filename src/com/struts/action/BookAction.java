package com.struts.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.*;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;

import com.ORM.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.*;
import com.util.Tools;

public class BookAction extends ActionSupport implements ModelDriven<Book> {

	Book book=new Book();
	BookService service;
	List<Book> books;
	StudentService stdservice;
	String keyword="";
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	/** 上传图片文件的属性 */
	private File tpic;	//上传的文件
	private String tpicContentType;	//上传文件的类型
	private String tpicFileName;		//上传文件的文件名
	
	
	public StudentService getStdservice() {
		return stdservice;
	}

	public void setStdservice(StudentService stdservice) {
		this.stdservice = stdservice;
	}

	public File getTpic() {
		return tpic;
	}

	public void setTpic(File tpic) {
		this.tpic = tpic;
	}

	public String getTpicContentType() {
		return tpicContentType;
	}

	public void setTpicContentType(String tpicContentType) {
		this.tpicContentType = tpicContentType;
	}

	public String getTpicFileName() {
		return tpicFileName;
	}

	public void setTpicFileName(String tpicFileName) {
		this.tpicFileName = tpicFileName;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public BookService getService() {
		return service;
	}

	public void setService(BookService service) {
		this.service = service;
	}

	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		return book;
	}
	
	public String regBook()
	{
		/*设置书的所有者*/
		Student std=(Student) ServletActionContext.getRequest().getSession().getAttribute("student");
		getModel().setStudent(std);
		/*上传图片*/
		try{
			String tempfilename = Tools.getRndFilename()+Tools.getFileExtName(getTpicFileName());
			String filename = ServletActionContext.getRequest().getRealPath("/bookPics").replaceAll("\\\\", "/")+"/"+tempfilename;
			System.out.println("filename="+filename);
			FileOutputStream fos = new FileOutputStream(filename);
			FileInputStream fis = new FileInputStream(getTpic());
			byte[] buf = new byte[1024];
			int len = 0;
			while((len=fis.read(buf))>0){
				fos.write(buf,0,len);
			}
			if (fis!=null)fis.close();
			if (fos!=null)fos.close();
			getModel().setPic(tempfilename);
		
		}catch(Exception ex){
			ex.printStackTrace();
		}
		if(service.saveBook(getModel()))
		{
			this.addActionMessage(getText("regbook_save_success"));	
		}
		
		return INPUT;
	}
	
	
	public void validateRegBook()
	{
		/*验证书名的合法性*/
	
		/*验证文件类型是否为图片*/
		if(this.getTpic()==null)
		{
			this.addFieldError("pic_emptyerror", getText("regBook_pic_emptyerror"));
		}
		if(!this.getTpicContentType().contains("image"))
		{
			this.addFieldError("pic_typeerror", getText("regBook_pic_typeerror"));
		}
		System.out.println("文件类型；"+this.getTpicContentType());
		
		/*验证价格是否输入合理*/
		if(!Pattern.matches("\\d{1,3}", getModel().getPrice().toString()))
		{
			this.addFieldError("price_outrange", getText("regBook_price_outrange"));
		}
		
		
	}
	
	public String browseValidBooks()
	{
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		books=service.listAllValidBooks(student.getId());
		searchForYou();
		return "index";
	}
	
	protected void searchForYou()
	{
		try
		{
		/**获取学生id,搜索学生信息**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/**根据学生的年级搜索同年级、同专业人推荐的书籍学生推荐的书籍**/
		String hql="from Student as a join a.books as b where a.grade='"+student.getGrade()+"' and a.major='"+student.getMajor()+"' and b.state='正在售出' and a.id!='"+student.getId()+"'";
		List list=service.executeHql(hql);
		
		if(list==null) {System.out.println("查询结果为空");return;}
		Iterator it=list.iterator();
		List<Book> tjbooks=new ArrayList<Book>();
		Object[] obj=null;
		int i=0;
		while(it.hasNext())
		{
			obj=(Object[])it.next();
			tjbooks.add((Book)obj[1]);
			if(++i>=5) break;
	        
		}	
		ServletActionContext.getRequest().setAttribute("tjbooks", tjbooks);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public String queryBookInfo()
	{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		
		if(id!=null)
		{
			Book book=service.loadBook(id);
			ServletActionContext.getRequest().setAttribute("book", book);
		}
		return "book";
	}
	
	public String browseUncheckedBooks()
	{
		books=service.listBook("from Book as a where a.state='待审核'");
		return "adminIndex";
	}
	
	
	public String checkedPass()
	{
		try
		{
		/*获取书的id号*/
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		Book book=service.loadBook(id);
		/*增加学生相对应的书籍积分*/
		Student std=book.getStudent();
		Integer balance=std.getBalance()+book.getPrice();
		std.setBalance(balance);
		stdservice.editStudent(std);
		
		/**修改书籍状态**/
		book.setState("正在售出");
		service.saveBook(book);
		}catch(Exception e){
			e.printStackTrace();
		}
		/**重新浏览未注册书籍**/
		return browseUncheckedBooks();
	}
	
	public String toEditBook()
	{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		Book book=service.loadBook(id);
		
		ServletActionContext.getRequest().setAttribute("book", book);
		return "toEditBook";
	}
	
	public String editBook()
	{
		try
		{
			/*保存对书籍的修改*/
			getModel().setState("正在售出");
			service.saveBook(getModel());
			Book book=service.loadBook(getModel().getId());
			ServletActionContext.getRequest().setAttribute("book", book);
			/*增加学生相对应的书籍积分*/
			Student std=stdservice.loadStudent(book.getStudent().getId());
			Integer balance=std.getBalance()+book.getPrice();
			std.setBalance(balance);
			stdservice.editStudent(std);
			this.addActionMessage(getText("editsavepass_success"));
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return "adminInput";
	}
	
	public void validateEditBook()
	{
		if(!getModel().getState().equals("待审核"))
		{
			this.addFieldError("bookhasbeenregistered", getText("bookhasbeenregistered"));
		}
			
	}
	
	@SuppressWarnings({ "finally", "unchecked" })
	public String searchByName()
	{
		try
		{
			String hql="from Book as b where b.name like '%"+this.getKeyword()+"%' and b.state='正在售出'";
			books=service.executeHql(hql);
//			ServletActionContext.getRequest().getSession().setAttribute("books",books);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return "input";
		}
		
	
	}
}
