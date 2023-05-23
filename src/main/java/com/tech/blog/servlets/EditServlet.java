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
 * Servlet implementation class EditServlet
 */
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String firstName = request.getParameter("fname");
		String lastName =request.getParameter("lname");
        String userName=request.getParameter("uname");
        String email=request.getParameter("email");
        String password=request.getParameter("pass");
        String contact =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        
        HttpSession session= request.getSession();
        User user = (User)session.getAttribute("currentuser");
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUserName(userName);
        user.setEmail(email);
        user.setPassword(password);
        user.setContact(contact);
        user.setCity(city);
        user.setAddress(address);
        
        //update
        
        UserDao dao = new UserDao(ConnProvider.getConnection());
        boolean ans = dao.updateUser(user);
        
        if (ans) {
//			out.print("updated");
        	
        	RequestDispatcher ed = request.getRequestDispatcher("Edit.jsp");
			ed.include(request, response);
		}else {
			out.print("Not updated");
		}
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
        String contact =request.getParameter("contactno");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        
        HttpSession session= request.getSession();
        User user = (User)session.getAttribute("currentuser");
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUserName(userName);
        user.setEmail(email);
        user.setPassword(password);
        user.setContact(contact);
        user.setCity(city);
        user.setAddress(address);
        
        //update
        
        UserDao dao = new UserDao(ConnProvider.getConnection());
        boolean ans = dao.updateUser(user);
        
        if (ans) {
//			out.print("updated");
        	
        	RequestDispatcher ed = request.getRequestDispatcher("Edit.jsp");
			ed.include(request, response);
		}else {
			out.print("Not updated");
		}
	}

}
