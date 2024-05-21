<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@v5.3.0/dist/css/bootstrap.min.css">
<style <%@ include file="./css/style.css" %>></style>

</head>
<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">

		<!-- Sidebar Start -->
		<aside class="left-sidebar">
			<!-- Sidebar scroll-->
			<div>
				<div
					class="brand-logo d-flex align-items-center justify-content-between">
					<a href="./index.html" class="text-nowrap brand-logo-link"> <img
						class="logo-img" src="./image/logo.jpg" alt="">
						StudentManager
					</a>
					<div class="close-btn d-block sidebartoggler cursor-pointer"
						id="sidebarCollapse">
						<i class="fa-solid fa-xmark"></i>
					</div>
				</div>
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav scroll-sidebar" data-simplebar="">
					<ul id="sidebarnav">
						<div class="sidebarnav-top">
							<li class="sidebar-item mg-l-4"><a class="sidebar-link"
								href="./account.jsp" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./class.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-chalkboard-user"></i>
								</span> <span class="hide-menu">Lớp</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./infoStudent.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-graduation-cap"></i>
								</span> <span class="hide-menu">Thông tin học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./searchStudent.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-magnifying-glass"></i>
								</span> <span class="hide-menu">Tra cứu học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./subject.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-book-open"></i>
								</span> <span class="hide-menu">Môn</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./tablePoint.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>

							<li class="sidebar-item"><a class="sidebar-link active" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-file-excel"></i>
								</span> <span class="hide-menu">Báo cáo</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./changeRule.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-gear"></i>
								</span> <span class="hide-menu">Thay đổi quy định</span>
							</a></li>
						</div>
						<div class="sidebarnav-bottom">
							<li class="sidebar-item"><a class="sidebar-link"
								href="./signIn.jsp" aria-expanded="false"> <span> <i
										class="fa-solid fa-power-off"></i>
								</span> <span class="hide-menu">Đăng xuất</span>
							</a></li>
						</div>


					</ul>

				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!--  Sidebar End -->

		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<header class="app-header">
				<nav class="navbar navbar-expand-lg navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item d-block d-xl-none"><a
							class="nav-link sidebartoggler nav-icon-hover"
							id="headerCollapse" href="javascript:void(0)"> <i
								class="fa-solid fa-bars"></i>
						</a></li>
						<li class="nav-item"><a class="nav-link nav-icon-hover"
							href="javascript:void(0)"> <i class="fa-regular fa-bell"></i>
								<div class="notification"></div>
						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
							<a href="" target="_blank">VanA@gmail.com</a>
							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="javascript:void(0)"
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="./image/captain_yami-sukehiro.jpg" alt="" width="35"
									height="35" class="rounded-circle">
							</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->

			<!-- Report start -->
			<div id="report" class="container-fluid report">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Báo cáo tổng kết
							</div>
							<div class="card-body">
								<div
									class="datatable-wrapper">
									<div class="datatable-top">
										<div class="datatable-selection">
											<div class="report-type-selection">
												<label for="report-type-selection">Loại: </label> <select
													id="report-type-selection">
													<option></option>
													<option value="report-subject">Báo cáo tổng kết
														môn</option>
													<option value="report-semester">Báo cáo tổng kết
														học kỳ</option>
												</select>
											</div>

											<div class="report-type-list hidden">
												<div id="report-semester"
													class="report-type report-semester-selection">
													<label>Học kỳ: </label> <select>
														<option></option>
														<option>1</option>
														<option>2</option>
													</select>
												</div>

												<div id="report-subject"
													class="report-type report-subject-selection">
													<label>Môn: </label> <select>
														<option></option>
														<option>Toán</option>
														<option>Văn</option>
														<option>Đạo đức</option>
														<option>Sinh</option>
														<option>Sử</option>
														<option>Địa</option>
														<option>Lý</option>
														<option>Hóa</option>
														<option>Thể dục</option>
													</select>
												</div>
											</div>


										</div>


										<div class="search-report">
											<button class="btn btn-primary search-point-btn">Tìm
												kiếm</button>
										</div>

									</div>
									<div class="datatable-container">
										<table id="datatablesReport" class="datatable-table">
											<thead>
												<tr>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">STT</a></th>
													<th data-sortable="true" aria-sort="descending"
														class="datatable-descending" style="width: 30%;"><a
														href="#" class="datatable-sorter">Lớp</a></th>
													<th data-sortable="true" style="width: 20%;"><a
														href="#" class="datatable-sorter">Sỉ số</a></th>
													<th data-sortable="true" style="width: 20%;"><a
														href="#" class="datatable-sorter">Số lượng đạt</a></th>
													<th data-sortable="true" style="width: 20%;"><a
														href="#" class="datatable-sorter">Tỉ lệ</a></th>
												</tr>
											</thead>
											<tbody>
												<tr data-index="0">
													<td>1</td>
													<td>Technical Author</td>
													<td>Nam</td>
													<td>123 quan hoa</td>
													<td>vanA@gmail.com</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Report end -->

		</div>
		<!--  Main wrapper -->

	</div>




	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>


	<script src="./js/app.js"></script>
	<script src="./js/reportTypeHandle.js"></script>
	<script src="./js/pagination.js"></script>
	
</body>
</html>