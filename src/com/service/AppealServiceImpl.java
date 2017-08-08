package com.service;

import java.util.List;

import com.DAO.BaseDAO;
import com.ORM.Appeal;
import com.ORM.Book;

public class AppealServiceImpl implements AppealService {

    BaseDAO dao;
    
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public boolean create(Appeal appeal) {
		// TODO Auto-generated method stub
		try
		{
			dao.saveOrUpdate(appeal);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Appeal> getAppeals(Integer stdid) {
		// TODO Auto-generated method stub
		try
		{
			String hql="from Appeal as a where a.studentByComplainantId.id="+stdid;
			return dao.query(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Appeal> getUnhandledAppeals() {
		// TODO Auto-generated method stub
		try
		{
			String hql="from Appeal as a where a.reply is null order by a.submitTime desc";
			return dao.query(hql);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void replyAppeal(Integer appealid) {
		try
		{
			Appeal appeal=(Appeal) dao.loadById(Appeal.class, appealid);
//			appeal.setReply(reply);
			dao.saveOrUpdate(appeal);
		}catch(Exception e){
			e.printStackTrace();
		}
		return;
	}

}
