<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>
<body>

	<section class="h-100 gradient-form" style="background-color: #eee;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-6">
								<div class="card-body p-md-5 mx-md-4">

									<div class="text-center">
										<img src="img/baner-1.png" style="width: 185px;" alt="logo">
										<h4 class="text-primary display-6">FruitTables</h4>
									</div>

									<form action="/login" method="post">
										<h3 class="mb-2">Login</h3>

										<div data-mdb-input-init class="form-outline mb-2">
											<input type="text" class="form-control" name="userNameLg"
												required /> <label class="form-label" for="form2Example11">Username</label>
										</div>

										<div data-mdb-input-init class="form-outline mb-4">
											<input type="password" id="form2Example22"
												class="form-control" name="passLg" required /> <label
												class="form-label" for="form2Example22">Password</label>
										</div>

										<div class="text-center pt-1 mb-5 pb-1">
											<button data-mdb-button-init data-mdb-ripple-init
												class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3"
												type="submit" formaction="/login">Log in</button>
											<a class="text-muted" href="#">Forgot password?</a>
										</div>



									</form>
									<div
										class="d-flex align-items-center justify-content-center pb-4">
										<p class="mb-0 me-2">Don't have an account?</p>
										<a href="/signup" class="btn btn-outline-danger" >Create new</a>
										
								
									</div>

								</div>
							</div>
							<div class="col-lg-6 d-flex align-items-center gradient-custom-2">
								<div class="text-white px-3 py-4 p-md-5 mx-md-4">
									<h4 class="mb-4">We are more than just a company</h4>
									<p class="small mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation ullamco laboris nisi ut aliquip ex
										ea commodo consequat.</p>
									<h4>${message}</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>