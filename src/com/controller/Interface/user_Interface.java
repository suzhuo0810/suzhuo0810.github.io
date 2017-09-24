package com.controller.Interface;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.servlet.ModelAndView;

import com.spring.model.dow_Model;
import com.spring.model.student_Model;
import com.spring.model.user_Model;

public interface user_Interface {
	static final int RETURN_INT_EXCEPTION = 2;
	static final int RETURN_INT_TRUE = 1;
	static final int RETURN_INT_FALSE = 0;

	SqlSession get_session();
	ModelAndView login_Select(user_Model user,HttpServletRequest request);
	ModelAndView session_Null(HttpServletRequest request);
	void all_Select(HttpServletResponse response) throws Exception;
	void add_User(user_Model user,HttpServletResponse response) throws Exception;
	void del_User(user_Model user,HttpServletResponse response) throws Exception;
	void up_User(user_Model user,HttpServletResponse response) throws Exception;
	
	void add_Dow(HttpServletRequest request) throws Exception;
	void all_Dow(HttpServletResponse response) throws Exception;
	void del_Dow(dow_Model dow,HttpServletResponse response) throws Exception;
	
	void all_Student(HttpServletResponse response) throws Exception;
	void add_Student(student_Model stu,HttpServletResponse response) throws Exception;
	void del_Student(student_Model stu,HttpServletResponse response) throws Exception;
	void up_Student(student_Model stu,HttpServletResponse response) throws Exception;
}
