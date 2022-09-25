package com.auction.product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Category
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String category = request.getParameter("category");

		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
			PreparedStatement pst = con
					.prepareStatement("insert into category(cname,description) values(?,?) ");
			pst.setString(1, name);
			pst.setString(2, category);
			
			int count = pst.executeUpdate();
			if (count > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("category.jsp");
				dispatcher.forward(request, response);
                
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("category.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
