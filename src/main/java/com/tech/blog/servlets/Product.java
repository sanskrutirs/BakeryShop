package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Gift;
import com.tech.blog.helper.ConnProvider;

/**
 * Servlet implementation class Product
 */
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
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
		
		String Id = request.getParameter("id");
		
		int data = Integer.parseInt(Id);
		UserDao dao = new UserDao(ConnProvider.getConnection());
		
		Gift gift = dao.getGiftById(data);
		
		if (gift==null) {
			out.print("Invalid");
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("currentgift", gift);
			response.sendRedirect("booking.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String Id = request.getParameter("id");
		
		int data = Integer.parseInt(Id);
		UserDao dao = new UserDao(ConnProvider.getConnection());
		
		Gift gift = dao.getGiftById(data);
		
		if (gift==null) {
			out.print("Invalid");
			
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("currentgift", gift);
			response.sendRedirect("booking.jsp");
		}
	}

}
