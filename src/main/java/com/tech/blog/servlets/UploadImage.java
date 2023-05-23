package com.tech.blog.servlets;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.tech.blog.dao.ProductDao;
import com.tech.blog.entities.Gift;
import com.tech.blog.helper.ConnProvider;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.*;

/**
 * Servlet implementation class UploadImage
 */

@MultipartConfig
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImage() {
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
		
		String pName = request.getParameter("name");
		String category = request.getParameter("category");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		
		Part part = request.getPart("image");
		
		Gift product = new Gift();
		
		product.setname(pName);
		product.setcategory(category);
		product.setprice(price);
		product.setdescription(description);
		product.setimage(part.getSubmittedFileName());
		
		
		ProductDao dao = new ProductDao(ConnProvider.getConnection());
		dao.saveProduct(product);
		
		//pic upload
		
		String path = getServletContext().getRealPath("product")+ System.getProperty("file.separator")+ part.getSubmittedFileName();
		System.out.println(path);
		
		//uploading
		
		try {
			
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is =part.getInputStream();
			
			//reading data
			
			byte []data=new byte[is.available()];
			is.read(data);
			
			//writing the data
			
			fos.write(data);
			fos.close();
		} catch (Exception e) {
			// TODO: handle exception
			out.print(e);
		}
		
		RequestDispatcher ed = request.getRequestDispatcher("gift.jsp");
		ed.include(request, response);
		
	}

}
