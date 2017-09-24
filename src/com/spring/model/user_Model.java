package com.spring.model;

import java.util.Date;

public class user_Model {
	private int userId;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public boolean isUserTitle() {
		return userTitle;
	}
	public void setUserTitle(boolean userTitle) {
		this.userTitle = userTitle;
	}
	public Date getUserNowDate() {
		return userNowDate;
	}
	public void setUserNowDate(Date userNowDate) {
		this.userNowDate = userNowDate;
	}
	public Date getUserLogDate() {
		return userLogDate;
	}
	public void setUserLogDate(Date userLogDate) {
		this.userLogDate = userLogDate;
	}
	public user_Model() {
		// TODO Auto-generated constructor stub
		userNowDate = new Date();
		userLogDate = new Date();
	}
	private String userName;
	private String userPass;
	private boolean userTitle;
	private Date userNowDate;
	private Date userLogDate;
}
