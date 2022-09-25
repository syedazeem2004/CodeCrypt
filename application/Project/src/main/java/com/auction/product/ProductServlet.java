package com.auction.product;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pname = request.getParameter("name");
		String category = request.getParameter("category");
		String desc = request.getParameter("desc");
		double price = Double.parseDouble(request.getParameter("price"));
		int quant = Integer.parseInt(request.getParameter("quantity"));
		String url = request.getParameter("image");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString();
		System.out.println(uid);
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
			PreparedStatement pst = con.prepareStatement(
					"insert into product(name,cname,description,price,quant,image,uid) values(?,?,?,?,?,?,?)");
			pst.setString(1, pname);
			pst.setString(2, category);
			pst.setString(3, desc);
			pst.setDouble(4, price);
			pst.setInt(5, quant);
			pst.setString(6, url);
			pst.setInt(7, Integer.parseInt(uid));
			int count = pst.executeUpdate();

			if (count > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("product.jsp");
				dispatcher.forward(request, response);

			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("product.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}
}
