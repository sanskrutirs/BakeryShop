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
import com.tech.blog.entities.Booking;
import com.tech.blog.helper.ConnProvider;

/**
 * Servlet implementation class BookServlet
 */
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
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
        String email=request.getParameter("email");
        String contact =request.getParameter("contact");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        String giftid = request.getParameter("giftid");
        String sprice =request.getParameter("sprice");
        String quantity =request.getParameter("quantity");
        String total =request.getParameter("total");
        
        Booking booking = new Booking(firstName,email,contact, city, address, giftid, sprice, quantity, total);
        
        UserDao dao = new UserDao(ConnProvider.getConnection());
        
        HttpSession httpSession = request.getSession();
        
        if (dao.addBooking(booking)) {
        	httpSession.setAttribute("message", "Booking Succesfully..");
        	RequestDispatcher ed = request.getRequestDispatcher("viewcart.jsp");
			ed.include(request, response);
		}else {
			out.print("error");
		}
	}

}
