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
							<div class="col-lg-12">
								<div class="card-body p-md-5 mx-md-4 gradient-custom-2">
									<form action="/signup" method="post">
										<h3 class="mb-2" style="color: white;">Sign up</h3>
										<div class="row">
											<div class="col-6">
												<div data-mdb-input-init class="form-outline mb-4">
													<input type="text" class="form-control" name="userNameSu"
														name="un" required /> <label class="form-label"
														style="color: white;" for="form2Example11">Username</label>
												</div>

												<div data-mdb-input-init class="form-outline mb-4">
													<input type="text" class="form-control" name="fullNameSu"
														name="un" required /> <label class="form-label"
														style="color: white;" for="form2Example11">fullname</label>
												</div>
												<div data-mdb-input-init class="form-outline mb-4">
													<input type="password" id="form2Example22"
														class="form-control" name="passSu" required /> <label
														style="color: white;" class="form-label"
														for="form2Example22">Password</label>
												</div>
												<div data-mdb-input-init class="form-outline mb-4">
													<input type="password" id="form2Example22"
														class="form-control" name="passLSu2" required /> <label
														style="color: white;" class="form-label"
														for="form2Example22">Comfirm Password</label>
												</div>
											</div>
											<div class="col-6">
												<div data-mdb-input-init class="form-outline mb-4">
													<input type="email" id="form2Example22"
														class="form-control" name="emailSu" required /> <label
														style="color: white;" class="form-label"
														for="form2Example22">Email</label>
												</div>
												<div data-mdb-input-init class="form-outline mb-4">
													<input type="text" id="form2Example22" class="form-control"
														name="addSu" required /> <label class="form-label"
														style="color: white;" for="form2Example22">Address</label>
												</div>
												<div class="row">
													<div class="col-6">
														<input class="btn " style="color: white;"
															formaction="/signup" type="submit" value="submit">
													</div>
													<div class="col-6 mt-2">
													
														<a  href="/login"><strong>Back to login</strong></a>
													</div>
												</div>

												<div data-mdb-input-init class="form-outline mb-4 mt-4">
													<h3 style="color: white;">${messSu}</h3>
												</div>

											</div>
										</div>
									</form>

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