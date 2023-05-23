package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnProvider;


/**
 * Servlet implementation class RegServlet
 */
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String firstName = request.getParameter("fname");
		String lastName =request.getParameter("lname");
        String userName=request.getParameter("uname");
        String email=request.getParameter("email");
        String password=request.getParameter("pass");
        String status=request.getParameter("status");
        String contact =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        
        //create user
        User user = new User(firstName,lastName,userName,email,password,status,contact,city,address);
     
        //create userdao 
        HttpSession httpSession = request.getSession();
        
        UserDao dao = new UserDao(ConnProvider.getConnection());
        if (dao.addUser(user)) {
        	httpSession.setAttribute("message", "Registration Succesfully..");
        	RequestDispatcher ed = request.getRequestDispatcher("login.jsp");
			ed.include(request, response);
		}else {
			out.print("error");
		}
	}

}
