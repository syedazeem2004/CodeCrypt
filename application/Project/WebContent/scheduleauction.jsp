<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Google fonts-->
<link rel="stylesheet"
	href=" 	https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="sweetalert2.min.css">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>" />
	<section>
	
		<div class="container mt-5">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Schedule Auction</h2>
					<form method="post" action="AuctionServlet" class="register-form">
					<input type="hidden" name="pid" value="<%=request.getParameter("pid")%>" />
						
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="number" name="bidval" id="name"
								placeholder="Enter minimum Bid Value" />
						</div>
						
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i>Enter End Date</label>
							<input class="mt-5" type="date" name="edate" id="name"
								placeholder="Enter end date" />
						</div>

						<div class="form-group form-button ">
							<input type="submit" class="form-submit bg-primary"
								value="submit" />
						</div>
					</form>
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
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css">
	<script
		src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>



	<script>
		var status = document.getElementById("status").value;
		if (status == "success") {
			console.log("called")
			Swal.fire("Congrats", "Auction  Scheduled Successfully ", "success");
		}
		if (status == "failed") {

			Swal.fire("Error", "Something Went Wrong", "error");
		}
	</script>

</body>
</html>