package com.auction.status;

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
 * Servlet implementation class StatusServlet
 */
@WebServlet("/StatusServlet")
public class StatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = session.getAttribute("id").toString();
		RequestDispatcher dispatcher = null;

		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
			PreparedStatement pst = con.prepareStatement("select * from auction;");
			ResultSet rs = pst.executeQuery();
			
			String time = java.time.LocalTime.now().toString();
			

				while (rs.next()) {
					String edate = rs.getString("edate");
					if (edate.equals(java.time.LocalDate.now()) && time.equals("19:00:00")) {
					// updating auctioned status
					PreparedStatement pst1 = con.prepareStatement("select * from bid where pid=?");
					pst1.setInt(1, rs.getInt("pid"));
					ResultSet rs1 = pst1.executeQuery();
					if (rs1.next()) {
						PreparedStatement pst2 = con.prepareStatement("update auction set status='SOLD' where pid=?");
						pst1.setInt(1, rs.getInt("pid"));

						pst2.executeUpdate();
					} else {
						PreparedStatement pst2 = con
								.prepareStatement("update auction set status='Auctioned Not SOLD' where pid=?");
						pst1.setInt(1, rs.getInt("pid"));
						pst2.executeUpdate();
					}
				// updating bidding status
				PreparedStatement pst5 = con.prepareStatement("select * from bid ");
				ResultSet bidrs = pst5.executeQuery();
				while(bidrs.next()) {
					PreparedStatement pst3 = con.prepareStatement(
							"select * from bid where bidvalue=(select max(bidvalue) from bid where pid=?);");
					pst3.setInt(1, bidrs.getInt("pid"));
					ResultSet rs2 = pst3.executeQuery();
					if(rs2.next()) {
						PreparedStatement pst4 = con
								.prepareStatement("update bid set status='WON BID' where userid=? and pid=?");
						PreparedStatement pst6 = con
								.prepareStatement("update bid set status='WON BID' where userid!=? and pid!=?");
						pst4.setInt(1,rs2.getInt("uid"));
						pst4.setInt(2, rs2.getInt("pid"));
						pst6.setInt(1,rs2.getInt("uid"));
						pst6.setInt(2, rs2.getInt("pid"));
						pst4.executeUpdate(); 
						pst6.executeUpdate(); 
					}
				}
				}
			}
		
			if (rs.next()) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);

			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
