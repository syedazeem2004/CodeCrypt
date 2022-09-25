package com.auction.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String role = request.getParameter("role");
		String dob = request.getParameter("dob");
		String addr = request.getParameter("addr");
		RequestDispatcher dispatcher = null;
		PrintWriter out = response.getWriter();
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
			PreparedStatement pst = con
					.prepareStatement("insert into user(uname,email,dob,pass,address,role) values(?,?,?,?,?,?) ");
			pst.setString(1, uname);
			pst.setString(2, email);
			pst.setString(3, dob);
			pst.setString(4, pass);
			pst.setString(5, addr);
			pst.setString(6, role);
			int count = pst.executeUpdate();

			if (count > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
                
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("registration.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
