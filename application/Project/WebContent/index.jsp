<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Landing</title>
<!-- Favicon-->
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
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top"><i
				class="fa-sharp fa-solid fa-austral-sign"></i>uctioneer</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<%
					if (session.getAttribute("name") == null) {
					%>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">Login</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="registration.jsp">Register</a></li>
					<%}%>
					<%
					if (session.getAttribute("name") != null) {
					%>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="LogoutServlet">Logout</a></li>
					
					<%
					if (session!=null && session.getAttribute("role").equals("Seller")) {
					%>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="product.jsp">AddProduct</a></li>
						<%} %>
					<%
					if (session!=null && session.getAttribute("role").equals("Seller")) {
					%>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="products.jsp">Products</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="auctionedproducts.jsp">Auctioned Products</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded"
						href="category.jsp">Add Category</a></li>
					<%
					} else {
					%>

					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded"
						href="buyerproducts.jsp">Products</a></li>
							
					<%
					}
					%>
					<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#"><%=session.getAttribute("name")%>
					</a></li>
					<%
					} else {
					%>
					<span></span>
					<%}%>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-info text-white text-center">
		<div class="container d-flex align-items-center flex-column ">
			<!-- Masthead Avatar Image-->
			<i style="font-size: 90px;"
				class="fa-sharp fa-solid fa-austral-sign "></i>

			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To
				Auctioneer</h1>


		</div>
	</header>
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<%
			if (session.getAttribute("role")!=null && session.getAttribute("role").equals("Seller")) {
			%>
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">
				<a href="products.jsp">All Products</a>
			</h2>
			<%}else{ %>
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">
				All Products</h2>
			<%} %>

			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>

				<div class="divider-custom-line"></div>
			</div>
			<section class="signup">
				<div class="container mt-2">
					<div class="signup-content">
						<div class="signup-form">
							<%
							if ( session.getAttribute("role")!=null &&  session.getAttribute("role").equals("Buyer")) {
							%>
							<table class="table table-hover">

								<thead>
									<tr>
										<th scope="col">ProductID</th>
										<th scope="col">Name</th>
										<th scope="col">BID Price</th>
										<th scope="col">Start Date</th>
										<th scope="col">End Date</th>

										<th scope="col">Image</th>

									</tr>
								</thead>
								<tbody>

									<%
									RequestDispatcher dispatcher = null;
									ResultSet rs = null;
									Connection con = null;

									try {
										Class.forName("com.mysql.cj.jdbc.Driver");
										con = DriverManager.getConnection(
										"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
										"root", "");
										PreparedStatement pst = con.prepareStatement(
										"SELECT product.name,product.image,product.pid,product.uid,auction.bid,auction.sdate,auction.edate 	FROM auction INNER JOIN product ON auction.pid = product.pid ");

										rs = pst.executeQuery();

									} catch (Exception e) {
										// TODO: handle exception
										e.printStackTrace();
									}
									while (rs.next()) {
									%>
									<form action="bid.jsp">
										<input type="hidden" name="pid" value="<%=rs.getInt("pid")%>" />
										<tr>
											<th scope="row"><%=rs.getInt("pid")%></th>
											<td><%=rs.getString("name")%></td>
											<td><%=rs.getDouble("bid")%></td>
											<td><%=rs.getDate("sdate")%></td>
											<td><%=rs.getDate("edate")%></td>

											<td><img class="w-25 rounded"
												src="<%=rs.getString("image")%> "></td>
											


											<td><button type="submit" class="btn btn-primary"
													id="place" />Place bid
												</button></td>

										</tr>
									</form>
									<%
									}
									%>
								</tbody>
							</table>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</section>

		</div>
	</section>

	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						INDIA <br /> 
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Auctioneer</h4>
					<p class="lead mb-0">Its an Auction webApp.</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; CODEcrYption 2022</small>
		</div>
	</div>

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
