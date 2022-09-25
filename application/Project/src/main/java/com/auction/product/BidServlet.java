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
 * Servlet implementation class BidServlet
 */
@WebServlet("/BidServlet")
public class BidServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		double bid = Double.parseDouble(request.getParameter("bidval"));

		String pid = request.getParameter("pid");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString();
		RequestDispatcher dispatcher = null;
     
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
			PreparedStatement pst = con.prepareStatement("insert into bid(userid,pid,bidvalue,status) values(?,?,?,?);");
			pst.setInt(2, Integer.parseInt(pid));
			pst.setDouble(3, bid);
			pst.setInt(1, Integer.parseInt(uid));
			pst.setString(4, "Open");

			int count = pst.executeUpdate();
			if (count > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("bid.jsp");
				dispatcher.forward(request, response);

			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("bid.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
