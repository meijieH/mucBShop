package com.service;

import java.util.List;

import com.ORM.Shoplist;
import com.ORM.Student;

public interface ShoplistService {
	public boolean addItem(Shoplist item);
	public String addItem(Integer std_id,Integer book_id);
	public boolean delItem(Integer id);
	public boolean goPay(String[] ids,Student std);
	public List<Shoplist> viewShopList(Integer std_id,boolean isValid);
}
