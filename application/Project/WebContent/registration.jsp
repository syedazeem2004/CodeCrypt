<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="sweetalert2.min.css">
<link rel="stylesheet"
	href=" 	https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>" />
	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>

						<form method="post" action="RegistrationServlet"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-floating">
								<select class="form-select" id="floatingSelect"
									aria-label="Floating label select example" name="role">
									
									<option selected value="Buyer">Buyer</option>
									<option value="Seller">Seller</option>
								
								</select> <label for="floatingSelect">Role</label>
							</div>
							<div class="form-group">

								<input type="date" name="dob" id="contact"
									placeholder="Enter Date OF Birth" />
							</div>
							<div class="form-floating">
								<textarea class="form-control"
									placeholder="Leave a comment here" name="addr" id="floatingTextarea"></textarea>
								<label class="mt-2" for="floatingTextarea">Address</label>
							</div>


							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->

	<script src="js/main.js"></script>
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-bulma/bulma.css">
	<script
		src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		var status = document.getElementById("status").value;
		if (status == "success") {
			console.log("called")
			Swal.fire("Congrats", "Account Created Successfully ", "success");
		}
	</script>

</body>

</html>