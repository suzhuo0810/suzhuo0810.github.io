package com.spring.model;

import java.util.Date;

public class dow_Model {
	private int dowId;
	public int getDowId() {
		return dowId;
	}
	public void setDowId(int dowId) {
		this.dowId = dowId;
	}
	public String getDowName() {
		return dowName;
	}
	public void setDowName(String dowName) {
		this.dowName = dowName;
	}
	public String getDowText() {
		return dowText;
	}
	public void setDowText(String dowText) {
		this.dowText = dowText;
	}
	public String getDowIp() {
		return dowIp;
	}
	public void setDowIp(String dowIp) {
		this.dowIp = dowIp;
	}
	public String getDwoExp() {
		return dwoExp;
	}
	public void setDwoExp(String dwoExp) {
		this.dwoExp = dwoExp;
	}
	public Date getDowDate() {
		return dowDate;
	}
	public void setDowDate(Date dowDate) {
		this.dowDate = dowDate;
	}
	private String dowSystem;
	public String getDowSystem() {
		return dowSystem;
	}
	public void setDowSystem(String dowSystem) {
		this.dowSystem = dowSystem;
	}
	private String dowName;
	private String dowText;
	private String dowIp;
	private String dwoExp;
	private Date dowDate;
}
