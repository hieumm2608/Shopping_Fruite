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
<link href="/css/bootstrap.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
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
					class="list-group-item list-group-item-action "> Thống kê
					(admin) </a> <a href="/ProductManager"
					class="list-group-item list-group-item-action">Quản lí sản phẩm
					(admin)</a> <a href="/Admin"
					class="list-group-item list-group-item-action active">Quản lí
					người dùng (admin)</a> <a href="/AccountManager"
					class="list-group-item list-group-item-action"> Quản lí tài
					khoản </a>
			</div>
		</div>

		<div class="col-8">
			<h4>Thông tin khách hàng:</h4>
			<hr>
			<form action="/Admin/save" method="POST">
				<div class="row">
					<div class="col-4">
						<h5>Id:</h5>
						<input class="form-control" type="text" placeholder="id"
							value="${u.userId}" name="userIdAdmin">
					</div>
					<div class="col-4">
						<h5>Fullname:</h5>
						<input class="form-control" type="text" placeholder="Fullname"
							value="${u.userName}" name="fullnameAdmin">
					</div>
					<div class="col-4">
						<h5>Username:</h5>
						<input class="form-control" type="text" placeholder="Username"
							value="${u.userName}" name="usernameAdmin">
					</div>
					<div class="col-4 mt-3">
						<h5>Address</h5>
						<input class="form-control" type="text" placeholder="Address"
							value="${u.address}" name="addressAdmin">
					</div>
					<div class="col-4 mt-3">
						<h5>Role</h5>

						<select class="form-select" aria-label="" name="roleAd">
							<option value="user" ${u.role == false ? 'selected' : ''}>User</option>
							<option value="admin" ${u.role == true ? 'selected' : ''}>Admin</option>


						</select>


					</div>
					<div class="col-4 mt-3">
						<h5>Email</h5>
						<input class="form-control" type="email" placeholder="email"
							value="${u.email}" name="emailAdmin">
					</div>
					<div class="col-1 mt-3">
						<input type="submit" class="btn btn-primary  mt-4" value="save">
					</div>
					<div class="col-1 mt-3">
						<input formaction="/Admin/delete" type="submit"
							class="btn btn-primary  mt-4" value="delete">
					</div>
					<div class="col-4 mt-3"></div>
					<div class="col-4 mt-3">
						<button class="btn btn-primary  mt-4" formaction="/Admin/page?p=0">
							first</button>
						<button class="btn btn-primary  mt-4"
							formaction="/Admin/page?p=${page.number-1}">previous</button>
						<button class="btn btn-primary  mt-4"
							formaction="/Admin/page?p=${page.number+1}">next</button>
						<button class="btn btn-primary  mt-4"
							formaction="/Admin/page?p=${page.totalPages-1}">Last</button>
					</div>
					<div class ="row">
						<div class="col-4">${page.number}</div>
						<div class="col-4">${messAd}</div>
					</div>
					




				</div>
			</form>



			<table class="table">
				<thead>
					<tr>

						<th scope="col">Id</th>
						<th scope="col">Username</th>
						<th scope="col">Fullname</th>
						<th scope="col">Email</th>
						<th scope="col">Role</th>
						<th scope="col">Address</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${page.content}">
						<tr>
							<td>${i.userId}</td>
							<td>${i.userName}</td>
							<td>${i.fullname}</td>
							<td>${i.email}</td>
							<td>${i.role}</td>
							<td>${i.address}</td>
							<td><a href="/Admin/${i.userId}">chỉnh sửa</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

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
	<script src="/js/main.js"></script>
</body>
</html>