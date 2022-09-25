<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<section class="signup">
		<div class="container mt-2">
			<div class="signup-content">
				<div class="signup-form">
					<h1>PRODUCTS Placed For Auction</h1>
					<table class="table table-hover">

						<thead>
							<tr>
								<th scope="col">ProductID</th>
								<th scope="col">SellerId</th>

								<th scope="col">Name</th>
								<th scope="col">Bid Value</th>

								<th scope="col">Image</th>
								<th scope="col">Status</th>
							</tr>
						</thead>
						<tbody>
							<%
							RequestDispatcher dispatcher = null;
							ResultSet rs = null;
							Connection con = null;
							String uid = session.getAttribute("id").toString();
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								con = DriverManager.getConnection(
								"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
								"root", "");
								PreparedStatement pst = con.prepareStatement(
								"SELECT product.name,product.image,product.uid,product.pid,bid.bidvalue,bid.status from bid INNER JOIN product ON  product.uid=? ;");
                                pst.setInt(1,Integer.parseInt(uid));
								rs = pst.executeQuery();

							} catch (Exception e) {
								// TODO: handle exception
								e.printStackTrace();
							}
							while (rs.next()) {
							%>

							<tr>
								<th scope="row"><%=rs.getInt("pid")%></th>
								<td><%=rs.getInt("uid")%></td>
								<td><%=rs.getString("name")%></td>

								<td><%=rs.getDouble("bidvalue")%></td>

								<td><img class="w-25 rounded"
									src="<%=rs.getString("image")%> "></td>
								<td><%=rs.getString("status")%></td>


							</tr>

							<%
							}
							%>
						</tbody>
					</table>

				</div>
			</div>
		</div>
	</section>

















	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>