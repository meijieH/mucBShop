package com.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class EncodingInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		// TODO Auto-generated method stub
		ServletActionContext.getRequest().setCharacterEncoding("utf8");
		String u=ServletActionContext.getRequest().getParameter("username");
		ai.setResultCode("utf8");
		System.out.println("Encoding Username:"+u);
		return ai.invoke();
	}

}
