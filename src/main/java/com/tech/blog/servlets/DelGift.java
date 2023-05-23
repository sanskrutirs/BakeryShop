package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnProvider;

/**
 * Servlet implementation class DelGift
 */
public class DelGift extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelGift() {
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
		
		boolean gift = dao.delGift(data);
		
		if (gift) {
			RequestDispatcher ed = request.getRequestDispatcher("gift.jsp");
			ed.include(request, response);
			
		}else {
			out.print("Invalid");
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
		
		boolean gift = dao.delGift(data);
		
		if (gift) {
			RequestDispatcher ed = request.getRequestDispatcher("gift.jsp");
			ed.include(request, response);
			
		}else {
			out.print("Invalid");
		}
	}

}
