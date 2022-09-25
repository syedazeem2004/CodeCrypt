<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category</title>
</head>
<link rel="stylesheet"
	href=" 	https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="sweetalert2.min.css">
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>" />
	<section>
		<div class="container mt-5">
			<div class="signup-content">
				<div class="signup-form">
					<h2 class="form-title">Add Category</h2>
					<form method="post" action="CategoryServlet" class="register-form"
						id="register-form">
						<div class="form-group">
							<label for="name"><i
								class="zmdi zmdi-account material-icons-name"></i></label> <input
								type="text" name="name" id="name" placeholder="Category Name" />
						</div>
						<div class="form-floating">
							<textarea class="form-control" placeholder="Add Category"
								name="category" id="floatingTextarea"></textarea>
							<label class="mt-2" for="floatingTextarea">Category</label>
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
			Swal.fire("Congrats", "Category Created Successfully ", "success");
		}
		if (status == "failed") {

			Swal.fire("Error", "Something Went Wrong", "error");
		}
	</script>


</body>
</html>