package com.service;



import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.DAO.BaseDAO;
import com.ORM.*;

public class ShoplistServiceImpl implements ShoplistService {

	BaseDAO dao;
	
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public boolean addItem(Shoplist item) {
		// TODO Auto-generated method stub
		try{
			dao.saveOrUpdate(item);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delItem(Integer id) {
		// TODO Auto-generated method stub
		try{
			dao.delById(Shoplist.class, id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean goPay(String[] ids,Student std) {
		// TODO Auto-generated method stub
		 try {
				if(ids==null)
					return false;
				for(int i=0;i<ids.length;i++){
					Shoplist si=(Shoplist)dao.loadById(Shoplist.class, Integer.parseInt(ids[i]));
					 Date d=new Date(System.currentTimeMillis());
					 DateFormat df=DateFormat.getDateTimeInstance();
					
						Date d2=df.parse(df.format(d));
					
					Order od=new Order(si.getStudent(),std,si.getBook());
					od.setCount(1);
					od.setSubDate(d2);
					od.setState("������");
					dao.saveOrUpdate(od);
					//�����鼮״̬Ϊ�����ᡱ
					si.getBook().setState("����");
					dao.saveOrUpdate(si.getBook());
					
					dao.delById(Shoplist.class, Integer.parseInt(ids[i]));
				}
		 } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return true;
	}

	@Override
	public String addItem(Integer std_id, Integer book_id) {
		// TODO Auto-generated method stub
		try{
			Shoplist item=new Shoplist();
			item.setPreshoptime(new Date());
			Book book=(Book)dao.loadById(Book.class, book_id);
			//����state��Ϊ�������۳������鼮(�������˹���),��ӵ����ﳵʧ��
			if(!book.getState().equals("�����۳�")){
				return "�Բ��𣬸����ѱ������û�������ѡ�������鼮";
			}
			//�����Ѿ���ӵ����ﳵ���鼮�������ٴ����
			String hql="from Shoplist as a where a.book.id="+book_id+" and a.student.id="+std_id;
			Shoplist result=(Shoplist)dao.loadObject(hql);
			if(result!=null){
				return "�����������Ĺ��ﳵ�У������ٴ����";
			}
			Student std=(Student)dao.loadById(Student.class, std_id);
			item.setBook(book);
			item.setStudent(std);
			dao.saveOrUpdate(item);
		}catch(Exception e){
			e.printStackTrace();
			return "���ʧ��";
		}
		return null;
	}

	@Override
	public List<Shoplist> viewShopList(Integer std_id, boolean isValid) {
		// TODO Auto-generated method stub
		try{
			String hql="from Shoplist as a where a.student.id="+std_id;
			if(isValid==true)
			{
				hql+=" and a.book.state='�����۳�'";
			}else{
				hql+=" and a.book.state!='�����۳�'";
			}
			return dao.query(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
