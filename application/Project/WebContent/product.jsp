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
<title>Add Product</title>

<link rel="stylesheet"
	href=" 	https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="sweetalert2.min.css">
</head>


<body>




	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>" />
	<section>
		<div class="container mt-5">
			<div class="p-3">
				<div class="signup-form">
					<h2 class="form-title">Add Product</h2>
					<form method="post" action="ProductServlet" class="register-form"
						id="register-form">
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="name" id="name" placeholder="Product Name" />
						</div>
						<div class="form-floating">
							<select class="form-select" id="floatingSelect"
								aria-label="Floating label select example" name="category">
								<%
								RequestDispatcher dispatcher = null;
								ResultSet rs = null;
								Connection con = null;
								try {
									Class.forName("com.mysql.cj.jdbc.Driver");
									con = DriverManager.getConnection(
									"jdbc:mysql://localhost:3307/auction?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
									"root", "");
									PreparedStatement pst = con.prepareStatement("select cname from category");

									rs = pst.executeQuery();

								} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
								}
								while (rs.next()) {
								%>
								<option><%=rs.getString("cname")%></option>
								<%
								}
								%>
							</select> <label for="floatingSelect">Category</label>
						</div>
						<div class="form-floating mt-2">
							<textarea class="form-control" placeholder="Leave a comment here"
								name="desc" id="floatingTextarea"></textarea>
							<label class="mt-2" for="floatingTextarea">Description</label>
						</div>
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="number" name="price" id="name" placeholder="Price" />
						</div>
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="number" name="quantity" id="name" placeholder="Quantity" />
						</div>
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="image" id="name" placeholder="Add image url" />
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
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css">
	<script
		src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>



	<script>
		var status = document.getElementById("status").value;
		if (status == "success") {
			console.log("called")
			Swal.fire("Congrats", "Product Added Successfully ", "success");
		}
		if (status == "failed") {

			Swal.fire("Error", "Something Went Wrong", "error");
		}
	</script>
</html>