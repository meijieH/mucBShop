package com.service;

import com.DAO.BaseDAO;
import com.ORM.*;
import com.util.MD5;

public class AdminServiceImpl implements AdminService {

	BaseDAO dao;
	
	
	public BaseDAO getDao() {
		return dao;
	}


	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}


	@Override
	public Admin login(String username,String pwd) {
		// TODO Auto-generated method stub	
		return (Admin)dao.loadObject("from Admin as a where a.username='"+username+"' and a.pwd='"+pwd+"'");
	}

}
