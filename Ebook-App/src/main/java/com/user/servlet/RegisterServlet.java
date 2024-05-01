package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phoneno=req.getParameter("phoneno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phoneno+" "+password+" "+check);
			
		User us=new	User();
		us.setName(name);
		us.setEmail(email);
		us.setPhoneno(phoneno);
		us.setPassword(password);
		
		HttpSession session=req.getSession();
		
		if(check != null) 
		{
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.userRegister(us);
			
			if(f)
			{
				//System.out.println("user registered successfully");
			
			  session.setAttribute("succMsg","Registration Success..");
			  resp.sendRedirect("register.jsp");
			
			}else {
				//System.out.println("something went wrong on server...");
				session.setAttribute("failedMsg","something wrong on server..");
				resp.sendRedirect("register.jsp");			
			}
		}
		else {
			//System.out.println("please check Agree privacy policy");
			session.setAttribute("failedMsg","please check Agree privacy policy");
			  resp.sendRedirect("register.jsp");	
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
    
}
