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
		/**��δ�ύ���ݣ���ת�������ύҳ��**/
		if(complainant==null)
		{
			return INPUT;
		}
		
		if(service.create(getModel()))
		{
		   this.addActionMessage("���߳ɹ����ȴ���������");
		}else{
			this.addActionMessage("��Ϣ�ύʧ�ܣ����ʵ�ύ��Ϣ");
		}
		return INPUT;
	}

	public String getAppeals()
	{
		Student std=(Student)ServletActionContext.getRequest().getSession().getAttribute("student");
		//��ѯ�û��ύ����������
		list=service.getAppeals(std.getId());
		
		return INPUT;
	}
}
