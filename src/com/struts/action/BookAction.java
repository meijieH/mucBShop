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

	/** �ϴ�ͼƬ�ļ������� */
	private File tpic;	//�ϴ����ļ�
	private String tpicContentType;	//�ϴ��ļ�������
	private String tpicFileName;		//�ϴ��ļ����ļ���
	
	
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
		/*�������������*/
		Student std=(Student) ServletActionContext.getRequest().getSession().getAttribute("student");
		getModel().setStudent(std);
		/*�ϴ�ͼƬ*/
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
		/*��֤�����ĺϷ���*/
	
		/*��֤�ļ������Ƿ�ΪͼƬ*/
		if(this.getTpic()==null)
		{
			this.addFieldError("pic_emptyerror", getText("regBook_pic_emptyerror"));
		}
		if(!this.getTpicContentType().contains("image"))
		{
			this.addFieldError("pic_typeerror", getText("regBook_pic_typeerror"));
		}
		System.out.println("�ļ����ͣ�"+this.getTpicContentType());
		
		/*��֤�۸��Ƿ��������*/
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
		/**��ȡѧ��id,����ѧ����Ϣ**/
		Student student=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		/**����ѧ�����꼶����ͬ�꼶��ͬרҵ���Ƽ����鼮ѧ���Ƽ����鼮**/
		String hql="from Student as a join a.books as b where a.grade='"+student.getGrade()+"' and a.major='"+student.getMajor()+"' and b.state='�����۳�' and a.id!='"+student.getId()+"'";
		List list=service.executeHql(hql);
		
		if(list==null) {System.out.println("��ѯ���Ϊ��");return;}
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
		books=service.listBook("from Book as a where a.state='�����'");
		return "adminIndex";
	}
	
	
	public String checkedPass()
	{
		try
		{
		/*��ȡ���id��*/
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		Book book=service.loadBook(id);
		/*����ѧ�����Ӧ���鼮����*/
		Student std=book.getStudent();
		Integer balance=std.getBalance()+book.getPrice();
		std.setBalance(balance);
		stdservice.editStudent(std);
		
		/**�޸��鼮״̬**/
		book.setState("�����۳�");
		service.saveBook(book);
		}catch(Exception e){
			e.printStackTrace();
		}
		/**�������δע���鼮**/
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
			/*������鼮���޸�*/
			getModel().setState("�����۳�");
			service.saveBook(getModel());
			Book book=service.loadBook(getModel().getId());
			ServletActionContext.getRequest().setAttribute("book", book);
			/*����ѧ�����Ӧ���鼮����*/
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
		if(!getModel().getState().equals("�����"))
		{
			this.addFieldError("bookhasbeenregistered", getText("bookhasbeenregistered"));
		}
			
	}
	
	@SuppressWarnings({ "finally", "unchecked" })
	public String searchByName()
	{
		try
		{
			String hql="from Book as b where b.name like '%"+this.getKeyword()+"%' and b.state='�����۳�'";
			books=service.executeHql(hql);
//			ServletActionContext.getRequest().getSession().setAttribute("books",books);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			return "input";
		}
		
	
	}
}
