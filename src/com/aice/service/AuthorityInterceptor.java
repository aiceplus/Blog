package com.aice.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorityInterceptor extends AbstractInterceptor implements ServletRequestAware{
	private HttpServletRequest request;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//取得请求相关的ActionContext实例
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		//session.put("userId", "null");
		String userId = session.get("userId").toString();
//		String userId = request.getSession().getAttribute("userId").toString();
		if(!userId.equals("0")){
			return invocation.invoke();
		}
		ctx.put("tip", "please login first");
		return Action.LOGIN;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
