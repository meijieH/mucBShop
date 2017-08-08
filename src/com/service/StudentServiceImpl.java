package com.service;

import java.util.*;

import org.hibernate.*;

import com.DAO.BaseDAO;
import com.ORM.*;


public class StudentServiceImpl implements StudentService {

	BaseDAO dao;
	
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public boolean regStudent(Student student) {
		// TODO Auto-generated method stub
		boolean status = false;
		try{
			dao.saveOrUpdate(student);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	@Override
	public Student login(Student student) {
		// TODO Auto-generated method stub
		return (Student)dao.loadObject("from Student as a where a.username='"+student.getUsername()+"' and a.pwd='"+student.getPwd()+"'" );
		
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		boolean status = false;
		try{
			dao.delById(Student.class, id);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	@Override
	public List<Order> queryAllOrders(Integer id) {
		// TODO Auto-generated method stub
		/*Session session=dao.currentSession();
		Transaction tx=null;
		Query query=null;
		List orders=null;
		try
		{
			tx=session.beginTransaction();
			Student student=(Student)session.get(Student.class, id);
			if(Hibernate.isInitialized(student.getOrders())) Hibernate.initialize(student.getOrders());
			orders=student.getOrders();
			tx.commit();
		}catch(Exception ex)
		{
			if(tx!=null) tx.rollback();
			ex.printStackTrace();
		}finally{
			session.close();
		}*/
		try
		{
			return dao.query("from Order as a where a.studentByBuyerId.id="+id);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Book> queryAllBooks(Integer id) {
		// TODO Auto-generated method stub
		try
		{
			return dao.query("from Book as a where a.student.id="+id);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
		
	}

	
	@Override
	public void editStudent(Student student) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(student);
	}

	@Override/*��ѯ���û����Ƿ��Ѿ�����*/
	public Student queryStudent(String username) {
		// TODO Auto-generated method stub
		return (Student) dao.loadObject("from Student as a where a.username='"+username+"'");
	}
	

	public Student loadStudent(Integer id)
	{
		return (Student) dao.loadById(Student.class, id);
	}

	@Override
	public List executeHql(String hql) {
		// TODO Auto-generated method stub
		try
		{
			return dao.query(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean update(Student student) {
		// TODO Auto-generated method stub

		boolean status = false;
		try{
			dao.saveOrUpdate(student);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	@Override
	public List<Book> getBooksByConditions(Integer ownid,String press, String subject,
			String grade, String type, String min_price, String max_price) {
		// TODO Auto-generated method stub
		String hql="from Book as b where b.student.id!="+ownid+" and b.state='�����۳�'";
		if(press!=null&&!press.equals(""))
		{
			if(press.equals("0")){
				press="�������������";
			}else if(press.equals("1")){
				press="���ӹ�ҵ������";
			}else if(press.equals("2")){
				press="�廪��ѧ������";
			}else if(press.equals("3")){
				press="�ߵȽ���������";
			}
			hql+=" and b.press='"+press+"'";
		}else if(subject!=null&&!subject.equals("")){
			if(subject.equals("0")){
				subject="����";
			}else if(subject.equals("1")){
				subject="����";
			}else if(subject.equals("2")){
				subject="�����";
			}else if(subject.equals("3")){
				subject="����";
			}
			hql+=" and b.subject='"+subject+"'";
		}else if(grade!=null&&!grade.equals("")){
			if(grade.equals("0")){
				grade="��һ";
			}else if(grade.equals("1")){
				grade="���";
			}else if(grade.equals("2")){
				grade="����";
			}else if(grade.equals("3")){
				grade="����";
			}
			hql+=" and b.student.grade='"+grade+"'";
		}else if(type!=null&&!type.equals("")){
			if(type.equals("0")){
				type="�̲�";
			}else if(type.equals("1")){
				type="����";
			}else if(type.equals("2")){
				type="��־";
			}else if(type.equals("3")){
				type="����";
			}else if(type.equals("4")){
				type="������";
			}
			hql+=" and b.type='"+type+"'";
		}else{
			if(min_price!=null&&min_price.equals(""))
			{
				hql+="and b.price>="+min_price;
			}
			
			if(max_price!=null&&max_price.equals(""))
			{
				hql+=" and b.price<="+max_price;
			}
		}
		System.out.println(hql);
		return dao.query(hql);
	}
	
}
