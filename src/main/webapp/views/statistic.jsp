<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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


		<div class="col-4 page-header1 container-fluid pt-4">
			<div class="list-group ">
				<h3 class="ps-2">Cài đặt tài khoản</h3>
				<a href="/UserManager"
					class="list-group-item list-group-item-action" aria-current="true">
					Thông tin tài khoản </a> <a href="/CartManager"
					class="list-group-item list-group-item-action "> Quản li giỏ
					hàng </a> <a href="/History"
					class="list-group-item list-group-item-action"> Lịch sử giao
					dịch </a> <a href="/statistics"
					class="list-group-item list-group-item-action active"> Thống kê
					(admin) </a> <a href="/ProductManager"
					class="list-group-item list-group-item-action">Quản lí sản phẩm 
					(admin)</a>
					<a href="/Admin"
					class="list-group-item list-group-item-action">Quản lí người dùng
					(admin)</a>
					 <a href="/AccountManager"
					class="list-group-item list-group-item-action"> Quản lí tài
					khoản </a>
			</div>
		</div>
		<div class="col-8">
			<h4>Thống kê:</h4>
			<hr>
			<div class="row">
				<div class="col-4">
					<h5>Ngày:</h5>
					<select class="form-select" aria-label="">
						<option selected>Ngày</option>

						<c:forEach var="i" begin="1" end="31">
							<option value="${i}">${i}</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-4">
					<h5>Tháng:</h5>
					<select class="form-select" aria-label="">
						<option selected>Tháng</option>

						<c:forEach var="i" begin="1" end="12">
							<option value="${i}">${i}</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-4">
					<h5>Năm:</h5>
					<select class="form-select" aria-label="">
						<option selected>Năm</option>

						<c:forEach var="i" begin="2020" end="2024">
							<option value="${i}">${i}</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-4 mt-3">
					<h5>Username</h5>
					<select class="form-select" aria-label="">
						<option selected>Userame</option>

						<c:forEach var="i" begin="2020" end="2024">
							<option value="${i}">${i}</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-4 mt-3">
					<h5>Sản phẩm</h5>
					<select class="form-select" aria-label="">
						<option selected>Userame</option>

						<c:forEach var="i" begin="2020" end="2024">
							<option value="${i}">${i}</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-4 mt-3">
					<button type="button" class="btn btn-primary  mt-4">Submit</button>
				</div>
			</div>


			<table class="table">
				<thead>
					<tr>
						
						<th scope="col">Mã đơn hàng</th>
						<th scope="col">Nguời tạo</th>
						<th scope="col">Ngày tạo</th>
						<th scope="col">Tổng tiền</th>
						<th scope="col">Trạng thái</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${listhd.content}">
						<tr>
							<td>${i.id}</td>
							<td>${i.user.userId}</td>
							<td>${i.ngaytao}</td>
							<td>${i.dongia}</td>
							<td>${i.stt}</td>
							<td><a href="#">chỉnh sửa</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<h3>Tổng tiền: ${tt}</h3>
		</div>
		<div></div>
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