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
<body style="background-color: #484848">
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
							<li class="sidebar-item"><a class="sidebar-link active"
								href="#" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-chalkboard-user"></i>
								</span> <span class="hide-menu">Lớp</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/InfoStudentsServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-graduation-cap"></i>
								</span> <span class="hide-menu">Thông tin học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="./searchStudent.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-magnifying-glass"></i>
								</span> <span class="hide-menu">Tra cứu học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/SubjectServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-book-open"></i>
								</span> <span class="hide-menu">Môn</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="./tablePoint.jsp" aria-expanded="false"> <span>
										<i class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>

							<li class="sidebar-item"><a class="sidebar-link"
								href="./report.jsp" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-file-excel"></i>
								</span> <span class="hide-menu">Báo cáo</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="./changeRule.jsp" aria-expanded="false"> <span>
										<i class="fa fa-solid fa-gear"></i>
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

			<!-- Class start -->
			<div id="class" class="container-fluid class">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách lớp
							</div>

							<div class="class-list-wrap">
								<div class="card-body class-list-data">
									<div class="datatable-wrapper">
										<div class="datatable-top">
											<div class="datatable-selection">

												<div id="class-semester" class="class-semester-selection">
													<label>Khối: </label> <select>
														<option></option>
														<option>10</option>
														<option>11</option>
														<option>12</option>
													</select>
												</div>

											</div>


											<div class="search-class">
												<button class="btn btn-primary search-class-btn">Tìm
													kiếm</button>
											</div>

										</div>
										<div class="datatable-container">
											<table id="datatablesClass" class="datatable-table">
												<thead>
													<tr>
														<th data-sortable="true" style="width: 10%;"><a
															href="#" class="datatable-sorter">STT</a></th>
														<th data-sortable="true" aria-sort="descending"
															class="datatable-descending" style="width: 30%;"><a
															href="#" class="datatable-sorter">Tên Lớp</a></th>
														<th data-sortable="true" style="width: 20%;"><a
															href="#" class="datatable-sorter">Sỉ số</a></th>
													</tr>
												</thead>
												<tbody>
													<tr data-index="0">
														<td>1</td>
														<td class="className-edit">Technical Author <i
															class="className-edit-icon fa fa-solid fa-pen-to-square"></i>
														</td>
														<td>23</td>
													</tr>
													<tr data-index="0">
														<td>2</td>
														<td class="className-edit">ABC <i
															class="className-edit-icon fa fa-solid fa-pen-to-square"></i>
														</td>
														<td>45</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="datatablefooter justify-content-end ">
											<button class="btn btn-primary add-class-btn">Thêm
												lớp</button>
										</div>
									</div>
								</div>

								<div class="card-body change-className hidden">
									<div class="card">
										<header class="change-className-top">
											<h5>Thay đổi tên lớp</h5>
										</header>

										<div class="change-className-container">
											<div class="change-className-group">
												<label for="change-className-input">Nhập tên lớp
													mới:</label> <input type="text" id="change-className-input"
													placeholder="Tên lớp mới">
											</div>
										</div>


										<div class="change-className-bottom">
											<div class="change-className-confirm">
												<button class="btn btn-primary change-className-cancel-btn">Hủy</button>
												<button class="btn btn-primary change-className-confirm-btn">Xác
													nhận</button>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- Class end -->

			<!-- List student of class start -->
			<div id="list-student-of-class"
				class="container-fluid list-student-of-class hidden">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách học sinh lớp
							</div>

							<div class="list-student-wrap">
								<div class="card-body">
									<div class="datatable-wrapper">
										<div class="datatable-top">
											<div class="datatable-top-group">
												<p>Lớp:</p>
												<p class="class-value">...</p>
											</div>

											<div class="datatable-top-group">
												<p>Sỉ số:</p>
												<p class="number-of-student-value">...</p>
											</div>
										</div>
										<div class="datatable-container">
											<table id="datatablesListStudent" class="datatable-table">
												<thead>
													<tr>
														<th data-sortable="true" style="width: 10%;"><a
															href="#" class="datatable-sorter">STT</a></th>
														<th data-sortable="true" aria-sort="descending"
															class="datatable-descending" style="width: 30%;"><a
															href="#" class="datatable-sorter">Họ tên</a></th>
														<th data-sortable="true" style="width: 10%;"><a
															href="#" class="datatable-sorter">Giới Tính</a></th>
														<th data-sortable="true" style="width: 15%;"><a
															href="#" class="datatable-sorter">Ngày sinh</a></th>
														<th data-sortable="true" style="width: 35%;"><a
															href="#" class="datatable-sorter">Địa chỉ</a></th>
													</tr>
												</thead>
												<tbody>
													<tr data-index="0">
														<td>1</td>
														<td>Technical Author</td>
														<td>23</td>
														<td>Technical Author</td>
														<td>23</td>
													</tr>

												</tbody>
											</table>
										</div>
										<div class="datatablefooter justify-content-between">
											<button
												class="btn btn-primary list-student-of-class-cancel-btn">Hủy</button>
											<button
												class="btn btn-primary list-student-of-class-confirm-btn">Xác
												nhận</button>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- List student of class end -->

		</div>
		<!--  Main wrapper -->

	</div>

	<!-- Modal add class -->
	<div class="modal add-class-modal">
		<div class="modal-container add-class-modal-container">

			<div class="icon-close js-modal-add-class-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Thêm lớp mới </header>

			<div class="modal-body">
				<div class="model-input-item">
					<label for="new-class" class="modal-label">Tên lớp:</label> <input
						type="text" id="new-class" class="modal-input"
						placeholder="Tên lớp">
				</div>


				<div class="model-input-item">
					<label for="number-of-student" class="modal-label">Sỉ số:</label> <input
						type="text" id="number-of-student" class="modal-input"
						placeholder="Sỉ số">
				</div>

			</div>

			<footer class="modal-footer">
				<button class="btn btn-primary cancel-add-class-btn">Hủy</button>
				<button class="btn btn-primary confirm-add-class-btn">Xác
					nhận</button>
			</footer>
		</div>
	</div>

	<!-- Modal list students to add class -->
	<div class="modal list-students-modal">
		<div class="modal-container list-students-modal-container">
			<div class="icon-close js-modal-list-students-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Danh sách học sinh </header>


			<div class="datatable-container">
				<table id="datatablesListStudent" class="datatable-table">
					<thead>
						<tr>
							<th data-sortable="true" style="width: 10%;"><a href="#"
								class="datatable-sorter">STT</a></th>
							<th data-sortable="true" aria-sort="descending"
								class="datatable-descending" style="width: 25%;"><a
								href="#" class="datatable-sorter">Tên</a></th>
							<th data-sortable="true" style="width: 15%;"><a href="#"
								class="datatable-sorter">Giới Tính</a></th>
							<th data-sortable="true" style="width: 25%;"><a href="#"
								class="datatable-sorter">Địa chỉ</a></th>
							<th data-sortable="true" style="width: 25%;"><a href="#"
								class="datatable-sorter">Email</a></th>
						</tr>
					</thead>
					<tbody>
						<tr data-index="0">
							<td>1</td>
							<td>Technical Author</td>
							<td>Nam</td>
							<td>123 quan hoa</td>
							<td>vanA@gmail.com</td>
							<td class="choose-student-to-class"><input
								class="choose-student-to-class-input" type="checkbox"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<footer class="modal-footer">
				<button class="btn btn-primary cancel-list-students-btn">Hủy</button>
				<button class="btn btn-primary confirm-list-students-btn">Xác
					nhận</button>
			</footer>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>


	<script src="./js/app.js"></script>
	<script src="./js/editClassName.js"></script>
	<script src="./js/pagination.js"></script>
	<script src="./js/modalAddClass.js"></script>
	<script src="./js/modalListStudent.js"></script>

</body>
</html>