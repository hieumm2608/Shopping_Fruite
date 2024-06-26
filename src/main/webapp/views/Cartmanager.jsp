<%@ taglib uri="jakarta.tags.core" prefix="C"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


	<!-- Navbar start -->
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- Navbar End -->



	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="row manager">
		<C:choose>
			<C:when test="${ulg.role == true}">
				<div class="col-4 page-header1 container-fluid pt-4">
					<div class="list-group ">
						<h3 class="ps-2">Cài đặt tài khoản</h3>
						<a href="/UserManager"
							class="list-group-item list-group-item-action"
							aria-current="true"> Thông tin tài khoản </a> <a
							href="/CartManager"
							class="list-group-item list-group-item-action active "> Quản
							li giỏ hàng </a> <a href="/History"
							class="list-group-item list-group-item-action"> Lịch sử giao
							dịch </a> <a href="/statistics"
							class="list-group-item list-group-item-action "> Thống kê
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
							class="list-group-item list-group-item-action"
							aria-current="true"> Thông tin tài khoản </a> <a
							href="/CartManager"
							class="list-group-item list-group-item-action active "> Quản
							li giỏ hàng </a> <a href="/History"
							class="list-group-item list-group-item-action"> Lịch sử giao
							dịch </a> <a href="/AccountManager"
							class="list-group-item list-group-item-action"> Quản lí tài
							khoản </a>
					</div>
				</div>
			</C:otherwise>
		</C:choose>


		<div class="col-8">
			<div class="container-fluid py-5">
				<div class="container">
					<h3>Your Cart:</h3>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Products</th>
									<th scope="col">Name</th>
									<th scope="col">Price</th>
									<th scope="col">Quantity</th>
									<th scope="col">Total</th>
									<th scope="col">Handle</th>
								</tr>
							</thead>
							<tbody>
								<C:forEach var="i" items="${listhdct}">
									<tr>
										<th scope="row">
											<div class="d-flex align-items-center">
												<img src="/img/${i.product.imgSr}"
													class="img-fluid me-5 rounded-circle"
													style="width: 80px; height: 80px;" alt="">
											</div>
										</th>
										<td>
											<p class="mb-0 mt-4">${i.product.prodcutName}</p>
										</td>
										<td>
											<p class="mb-0 mt-4">${i.product.productPrice}</p>
										</td>
										<td>
											<div class="input-group quantity mt-4" style="width: 100px;">
												<div class="input-group-btn">
													<button
														class="btn btn-sm btn-minus rounded-circle bg-light border">
														<i class="fa fa-minus"></i>
													</button>
												</div>
												<input type="text"
													class="form-control form-control-sm text-center border-0"
													value="${i.product.quanity}">
												<div class="input-group-btn">
													<button
														class="btn btn-sm btn-plus rounded-circle bg-light border">
														<i class="fa fa-plus"></i>
													</button>
												</div>
											</div>
										</td>
										<td>
											<p class="mb-0 mt-4">${i.product.productPrice * i.product.quanity}</p>
										</td>
										<td>
											<button
												class="btn btn-md rounded-circle bg-light border mt-4">
												<i class="fa fa-times text-danger"></i>
											</button>
										</td>
									</tr>
								</C:forEach>


							</tbody>
						</table>
					</div>
					<div class="d-flex">
						<div class="mt-5">
							<input type="text"
								class="border-0 border-bottom rounded me-5 py-3 mb-4"
								placeholder="Coupon Code">
							<button
								class="btn border-secondary rounded-pill px-4 py-3 text-primary"
								type="button">Apply Coupon</button>
						</div>

						<div class="ms-5 mt-5">
							Total: <input type="text"
								class="border-0 disable border-bottom rounded ms-4 me-5 py-3 mb-4">
						</div>

					</div>

				</div>
			</div>
			<!-- Cart Page End -->
		</div>
	</div>




	<jsp:include page="footer.jsp"></jsp:include>




	<!-- Back to Top -->
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