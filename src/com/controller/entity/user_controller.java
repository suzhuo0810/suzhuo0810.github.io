package com.controller.entity;

import java.io.IOException;
import java.io.Reader;
import java.net.InetAddress;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.controller.Interface.user_Interface;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.spring.model.dow_Model;
import com.spring.model.student_Model;
import com.spring.model.user_Model;
import cz.mallat.uasparser.OnlineUpdater;
import cz.mallat.uasparser.UASparser;
import cz.mallat.uasparser.UserAgentInfo;

@Controller
public class user_controller implements user_Interface {

	@Override
	public SqlSession get_session() {
		// TODO Auto-generated method stub
		String str = "com/mybatis/jdbc/MybatisConfig.xml";
		Reader reader = null;
		SqlSession session;
		try {
			reader = Resources.getResourceAsReader(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session = new SqlSessionFactoryBuilder().build(reader).openSession();
		return session;
	}

	@Override
	@RequestMapping("/login_Select.do")
	public ModelAndView login_Select(user_Model user,HttpServletRequest request){
		// TODO Auto-generated method stub
		Map<String, Object> user_select = new HashedMap();
		user_select.put("userName", user.getUserName());
		user_select.put("userPass", user.getUserPass());
		List<user_Model> list = get_session().selectList("login_Select",user_select);
		if (list.size() > 0) {
			Map<String, Object> user_update = new HashedMap();
			user_update.put("userLogDate", new Date());
			user_update.put("userId", list.get(0).getUserId());
			SqlSession session = get_session();
			session.update("long_Update", user_update);
			session.commit();
			request.getSession().setAttribute("user", list.get(0).getUserName());
			if (list.get(0).isUserTitle()) {//管理员用户权限
				
				return new ModelAndView("views/admin_sussen");
			}else {//普通用户权限
				
				return new ModelAndView("views/sussen");
			}
		}else {
			return new ModelAndView("views/index").addObject("error", user_Interface.RETURN_INT_FALSE);
		}
	}

	@Override
	@RequestMapping("/session_Null.do")
	public ModelAndView session_Null(HttpServletRequest request) {
		// TODO Auto-generated method stub
		request.getSession().removeAttribute("user");
		return new ModelAndView("views/index");
	}

	
	@Override
	@RequestMapping("/all_Select.do")
	public void all_Select(HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<user_Model> list = get_session().selectList("all_Select");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		response.getWriter().write(gson.toJson(list));
	}

	@Override
	@RequestMapping("/add_User.do")
	public void add_User(user_Model user,HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.insert("add_User", user);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		} 
	}

	
	@Override
	@RequestMapping("/del_User.do")
	public void del_User(user_Model user, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.delete("del_User", user);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		} 
	}

	@Override
	@RequestMapping("/up_User.do")
	public void up_User(user_Model user, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.update("up_User", user);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		} 
	}

	
	@Override
	@RequestMapping("/add_Dow.do")
	public void add_Dow(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub 
		UserAgentInfo agent = new UASparser(OnlineUpdater.getVendoredInputStream()).parse(request.getHeader("User-Agent"));
		dow_Model dow = new dow_Model();
		dow.setDowName((String)request.getSession().getAttribute("user"));
		dow.setDowIp(InetAddress.getLocalHost().getHostAddress());
		dow.setDowSystem(agent.getOsName());
		dow.setDwoExp(agent.getUaName());
		dow.setDowText(request.getParameter("idefg"));
		dow.setDowDate(new Date());
		SqlSession session = get_session();
		session.insert("add_Dow", dow);
		session.commit();
	}

	
	@Override
	@RequestMapping("/all_Dow.do")
	public void all_Dow(HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<dow_Model> list = get_session().selectList("all_Dow");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		response.getWriter().write(gson.toJson(list));
	}

	
	@Override
	@RequestMapping("/del_Dow.do")
	public void del_Dow(dow_Model dow, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.delete("del_Dow", dow);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		} 
	}

	@Override
	@RequestMapping("/all_Student.do")
	public void all_Student(HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		List<student_Model> list = get_session().selectList("all_Student");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		response.getWriter().write(gson.toJson(list));
	}

	@Override
	@RequestMapping("/add_Student.do")
	public void add_Student(student_Model stu, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.insert("add_Student", stu);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		}
	}

	@Override
	@RequestMapping("/del_Student.do")
	public void del_Student(student_Model stu, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.delete("del_Student", stu);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		}
	}

	@Override
	@RequestMapping("/up_Student.do")
	public void up_Student(student_Model stu, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		SqlSession session = get_session();
		int i = session.update("up_Student", stu);
		session.commit();
		if (i <= 0) {
			response.getWriter().write("error");
		}
	}	
	
	
}
