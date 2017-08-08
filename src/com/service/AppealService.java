package com.service;

import java.util.List;

import com.ORM.Appeal;

public interface AppealService {
	public boolean create(Appeal appeal);
	public List<Appeal> getAppeals(Integer stdid);
	public List<Appeal> getUnhandledAppeals();
	public void replyAppeal(Integer appealid);
}
