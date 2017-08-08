package com.service;

import com.DAO.BaseDAO;
import com.ORM.CreditTransfer;

public class CreditTransferServiceImpl implements CreditTransferService {

	BaseDAO dao;
	public BaseDAO getDao() {
		return dao;
	}
	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}
	@Override
	public boolean save(CreditTransfer credit_transfer) {
		// TODO Auto-generated method stub
		try
		{
			dao.saveOrUpdate(credit_transfer);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

}
