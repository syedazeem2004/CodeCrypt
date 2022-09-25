<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Favicon-->

</head>
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
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>" />
	<section>
		<div class="container mt-5">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Add BID</h2>
					<div class="card" style="width: 18rem;">
						<div class="card-body">
							<form method="post" action="BidServlet" class="register-form"
								id="register-form">

								<%
								RequestDispatcher dispatcher = null;
								ResultSet rs = null;
								Connection con = null;
								String id = session.getAttribute("id").toString();
								try {
									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection(
									"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
									"root", "");
									PreparedStatement pst = con.prepareStatement("select * from product where pid=? ");
									pst.setInt(1, Integer.parseInt(request.getParameter("pid")));

									rs = pst.executeQuery();

								} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
								}
								if (rs.next()) {
								%>

								<input type="hidden" name="pid" value="<%=rs.getInt("pid")%>" />
								<div class="form-group">
									<label for="name"><i
										class="zmdi zmdi-account material-icons-name"></i></label> <input
										type="number" name="bidval" id="name" placeholder="BID Value"
										min="<%=rs.getDouble("price")%>" />
								</div>
								
								<div class="form-group form-button  mt-3 ">
									<input type="submit" class="form-submit btn btn-primary"
										value="submit" />
								</div>

								<%
								}
								%>


							</form>
						</div>
					</div>
				</div>
			</div>




		</div>
	</section>
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css">
	<script
		src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
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


	<script>
		var status = document.getElementById("status").value;
		if (status == "success") {
			console.log("called")
			Swal.fire("Congrats", "BID Successfully ", "success");
		}
		if (status == "failed") {

			Swal.fire("Error", "Something Went Wrong", "error");
		}
	</script>
</body>
</html>