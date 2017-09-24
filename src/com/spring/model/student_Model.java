package com.spring.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class student_Model {
	private String studentNumber;
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentCard() {
		return studentCard;
	}
	public void setStudentCard(String studentCard) {
		this.studentCard = studentCard;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public String getStudentTie() {
		return studentTie;
	}
	public void setStudentTie(String studentTie) {
		this.studentTie = studentTie;
	}
	public Date getStudentDate() {
		return studentDate;
	}
	public void setStudentDate(Date studentDate) {
		this.studentDate = studentDate;
	}
	private String studentName;
	private String studentCard;
	private String studentSex;
	private String studentTie;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date studentDate;
}
