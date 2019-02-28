package com.internousdev.yellow.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.yellow.dao.UserInfoDAO;
import com.opensymphony.xwork2.ActionSupport;
public class LogoutAction extends ActionSupport implements SessionAware
{
	private Map<String,Object>session;

	public String execute()
	{
		//	商品カテゴリがないならセッションタイムアウト
		if(!session.containsKey("mCategoryDtoList"))
		{
			return "sessionTimeOut";
		}

		UserInfoDAO userInfoDao = new UserInfoDAO();
		String loginId = String.valueOf(session.get("loginId"));
		boolean savedLoginId = Boolean.valueOf(String.valueOf(session.get("savedLoginId")));

		if(userInfoDao.logout(loginId) > 0)
		{
			session.clear();

			if(savedLoginId)
			{
				session.put("savedLoginId", savedLoginId);
				session.put("saveLoginId", loginId);
			}
		}

		return SUCCESS;
	}
	public Map<String,Object> getSession()
	{
		return session;
	}
	@Override
	public void setSession(Map<String,Object>session)
	{
		this.session=session;
	}
}
