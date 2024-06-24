<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="C"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


	<!-- Spinner Start -->
	<div id="spinner"
		class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="row manager">
		<C:choose>
			<C:when test="${ulg.role == true}">
				<div class="col-4 page-header1 container-fluid pt-4">
					<div class="list-group ">
						<h3 class="ps-2">Cài đặt tài khoản</h3>
						<a href="/UserManager"
							class="list-group-item list-group-item-action active"
							aria-current="true"> Thông tin tài khoản </a> <a
							href="/CartManager"
							class="list-group-item list-group-item-action "> Quản li giỏ
							hàng </a> <a href="/History"
							class="list-group-item list-group-item-action"> Lịch sử giao
							dịch </a> <a href="/statistics"
							class="list-group-item list-group-item-action"> Thống kê
							(admin) </a> <a href="/ProductManager"
							class="list-group-item list-group-item-action">Quản lí sản
							phẩm (admin)</a> <a href="/Admin"
							class="list-group-item list-group-item-action">Quản lí người
							dùng (admin)</a> <a href="/AccountManager"
							class="list-group-item list-group-item-action"> Quản lí tài
							khoản </a>
					</div>
				</div>
			</C:when>
			<C:otherwise>
				<div class="col-4 page-header1 container-fluid pt-4">
					<div class="list-group ">
						<h3 class="ps-2">Cài đặt tài khoản</h3>
						<a href="/UserManager"
							class="list-group-item list-group-item-action active"
							aria-current="true"> Thông tin tài khoản </a> <a
							href="/CartManager"
							class="list-group-item list-group-item-action "> Quản li giỏ
							hàng </a> <a href="/History"
							class="list-group-item list-group-item-action"> Lịch sử giao
							dịch </a> <a href="/AccountManager"
							class="list-group-item list-group-item-action"> Quản lí tài
							khoản </a>
					</div>
				</div>
			</C:otherwise>
		</C:choose>


		<div class="col-8">
			<h4>Infomation</h4>
			<hr>
			<form action="/UserManager" method="post">
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Email:</label> <input
						type="email" class="form-control" id="exampleInputEmail1" name="emailUm" required
						aria-describedby="emailHelp">
				</div>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Fullname:</label>
					<input type="text" class="form-control" id="" aria-describedby="" name="fullnameUm" required>
				</div>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Address:</label>
					<input type="text" class="form-control" id="" aria-describedby="" name="addUm" required>
				</div>

				<input type="submit" class= "btn btn-primary" value="submit">
				<h3>${messUm}</h3>
			</form>
		</div>
	</div>



	<jsp:include page="footer.jsp"></jsp:include>



	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>


	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/lightbox/js/lightbox.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>
</body>
</html>