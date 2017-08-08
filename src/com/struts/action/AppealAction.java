package com.struts.action;

import java.util.*;

import org.apache.struts2.ServletActionContext;

import com.ORM.*;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.service.AppealService;

public class AppealAction extends ActionSupport implements ModelDriven<Appeal> {

	Appeal appeal=new Appeal();
	AppealService service;
	
	List<Appeal> list=new ArrayList<Appeal>();
	
	public List<Appeal> getList() {
		return list;
	}

	public void setList(List<Appeal> list) {
		this.list = list;
	}

	public AppealService getService() {
		return service;
	}

	public void setService(AppealService service) {
		this.service = service;
	}

	@Override
	public Appeal getModel() {
		// TODO Auto-generated method stub
		return appeal;
	}
	
	public String createAppeal()
	{
		
		String complainant=ServletActionContext.getRequest().getParameter("reason");
		/**若未提交数据，跳转到数据提交页面**/
		if(complainant==null)
		{
			return INPUT;
		}
		
		if(service.create(getModel()))
		{
		   this.addActionMessage("申诉成功，等待管理处理结果");
		}else{
			this.addActionMessage("信息提交失败，请核实提交信息");
		}
		return INPUT;
	}

	public String getAppeals()
	{
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		//查询用户提交的所有申诉
		list=service.getAppeals(std.getId());
		
		return INPUT;
	}
}
