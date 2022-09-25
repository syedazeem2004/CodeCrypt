package com.auction.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("username");
		String pass = request.getParameter("password");

		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
			PreparedStatement pst = con.prepareStatement("select * from user where email= ? and pass= ?");
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
            System.out.println(rs);
			if (rs.next()) {
				session.setAttribute("name", rs.getString("uname"));
				session.setAttribute("id", rs.getString("uid"));
				session.setAttribute("role", rs.getString("role"));
				dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}

	}

}
