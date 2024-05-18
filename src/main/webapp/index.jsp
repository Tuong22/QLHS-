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
								href="#" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-chalkboard-user"></i>
								</span> <span class="hide-menu">Lớp</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-graduation-cap"></i>
								</span> <span class="hide-menu">Thông tin học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-magnifying-glass"></i>
								</span> <span class="hide-menu">Tra cứu học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>

							<li class="sidebar-item"><a class="sidebar-link" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-file-excel"></i>
								</span> <span class="hide-menu">Báo cáo</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="#"
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
						<li class="nav-item">
							<div class="toggle-switch">
								<label class="switch-label"> <input type="checkbox"
									class="checkbox toggle-theme"> <span class="slider"></span>
								</label>
							</div>
						</li>
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
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="drop2">
									<div class="message-body">
										<a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-user fs-6"></i>
											<p class="mb-0 fs-3">My Profile</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-mail fs-6"></i>
											<p class="mb-0 fs-3">My Account</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-list-check fs-6"></i>
											<p class="mb-0 fs-3">My Task</p>
										</a> <a href="./signIn.jsp"
											class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</header>
			<!--  Header End -->

			<div class="container-fluid account hidden">

				<div class="row">
					<div class="card account-info">
						<div class="account-info-content">
							<h3 class="account-info-heading">Thông tin tài khoản</h3>

							<div class="spacer"></div>

							<div class="account-info-group">
								<label><i class="account-icon fa-solid fa-user"></i>Tên
									tài khoản: </label>
								<div class="account-name">
									<p class="account-info-text">Van A</p>
								</div>

							</div>

							<div class="account-info-group">
								<label><i class="account-icon fa-solid fa-key"></i>Mật
									khẩu: </label>
								<div class="account-pass">
									<p class="account-info-text account-pass-text__hide">*******</p>
									<p class="account-info-text account-pass-text__show hidden">123456</p>
									<divclass"pass-selection"> <i
										class="show-pass fa-solid fa-eye"></i> <i
										class="hide-pass fa-solid fa-eye-slash hidden"></i> <i
										class="edit-pass fa-solid fa-pen-to-square"></i>
								</div>

							</div>

							<div class="account-info-group">
								<label><i class="account-icon fa-solid fa-envelope"></i>Email:
								</label>
								<div class="account-pass">
									<p class="account-info-text">KienTuong@gmail.com</p>
								</div>
							</div>
						</div>


						<footer class="account-info-footer">
							<span>Last update: </span>
							<p class="account-last-update">__/__/____</p>
						</footer>
					</div>

				</div>
			</div>

			<div class="container-fluid class hidden">
				<div class="row"></div>
			</div>

			<div class="container-fluid info-student hidden">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách học sinh
							</div>
							<div class="card-body">
								<div
									class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
									<div class="datatable-top">
										<div class="add-student">
											<button class="btn btn-primary add-student-btn">Thêm
												học sinh</button>
										</div>


										<div class="datatable-search">
											<input class="datatable-input" placeholder="Search..."
												type="search" title="Search within table"
												aria-controls="datatablesSimple">
										</div>

									</div>
									<div class="datatable-container">
										<table id="datatablesInfoStudent" class="datatable-table">
											<thead>
												<tr>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">STT</a></th>
													<th data-sortable="true" aria-sort="descending"
														class="datatable-descending" style="width: 25%;"><a
														href="#" class="datatable-sorter">Tên</a></th>
													<th data-sortable="true" style="width: 15%;"><a
														href="#" class="datatable-sorter">Giới Tính</a></th>
													<th data-sortable="true" style="width: 25%;"><a
														href="#" class="datatable-sorter">Địa chỉ</a></th>
													<th data-sortable="true" style="width: 25%;"><a
														href="#" class="datatable-sorter">Email</a></th>
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

			<div class="container-fluid table-point">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách học sinh
							</div>
							<div class="card-body">
								<div
									class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
									<div class="datatable-top">
										<div class="datatable-selection">
											<div class="">
												<label>Lớp: </label> 
												<input class="" placeholder = "..."
												type="text">
											</div>
											
											<div class="">
												<label>Học kỳ: </label> <select>
													<option>1</option>
													<option>2</option>
												</select>
											</div>

											<div class="">
												<label>Môn: </label> <select>
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


										<div class="search-point">
											<button class="btn btn-primary search-point-btn">Tìm
												kiếm</button>
										</div>

									</div>
									<div class="datatable-container">
										<table id="datatablesPoint" class="datatable-table">
											<thead>
												<tr>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">STT</a></th>
													<th data-sortable="true" aria-sort="descending"
														class="datatable-descending" style="width: 30%;"><a
														href="#" class="datatable-sorter">Tên</a></th>
													<th data-sortable="true" style="width: 20%;"><a
														href="#" class="datatable-sorter">15'</a></th>
													<th data-sortable="true" style="width: 20%;"><a
														href="#" class="datatable-sorter">1T</a></th>
													<th data-sortable="true" style="width: 20%;"><a
														href="#" class="datatable-sorter">TB môn</a></th>
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
		</div>


	</div>



	<div class="modal add-student-modal">
		<div class="modal-container add-student-modal-container">

			<div class="icon-close js-modal-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Thêm học sinh mới </header>

			<div class="modal-body">
				<div class="model-input-item">
					<label for="student-name" class="modal-label">Tên:</label> <input
						type="text" id="student-name" class="modal-input"
						placeholder="Họ tên">
				</div>

				<div class="model-input-item">
					<label class="modal-label">Giới tính:</label>
					<div class="student-gender">
						<div class="student-gender-wrap">
							<label for="student-male" class="modal-label">Nam</label> <input
								type="radio" id="student-male" class="modal-input"
								name="gender-group" value="Nam">
						</div>

						<div class="student-gender-wrap">
							<label for="student-female" class="modal-label">Nữ</label> <input
								type="radio" id="student-female" class="modal-input"
								name="gender-group" value="Nữ">
						</div>

					</div>

				</div>

				<div class="model-input-item">
					<label for="student-year" class="modal-label">Năm sinh:</label> <input
						type="text" id="student-year" class="modal-input"
						placeholder="Năm sinh">
				</div>

				<div class="model-input-item">
					<label for="student-address" class="modal-label">Địa chỉ:</label> <input
						type="text" id="student-address" class="modal-input"
						placeholder="Địa chỉ">
				</div>

				<div class="model-input-item">
					<label for="student-email" class="modal-label">Email:</label> <input
						type="email" id="student-email" class="modal-input"
						placeholder="Email">
				</div>

			</div>

			<footer class="modal-footer">
				<button class="btn btn-primary cancel-add-student-btn">Hủy</button>
				<button class="btn btn-primary confirm-add-studen-btn">Xác
					nhận</button>
			</footer>
		</div>
	</div>


	<div class="modal edit-pass-modal">
		<div class="modal-container edit-pass-modal-container">

			<div class="icon-close js-modal-edit-pass-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Đổi mật khẩu </header>

			<div class="modal-body">
				<div class="model-input-item">
					<label for="new-password" class="modal-label">Mật khẩu mới:</label>
					<input type="text" id="new-password" class="modal-input"
						placeholder="Mật khẩu mới">
				</div>


				<div class="model-input-item">
					<label for="comfirm-new-password" class="modal-label">Xác
						nhận mật khẩu mới:</label> <input type="text" id="comfirm-new-password"
						class="modal-input" placeholder="Xác nhận mật khẩu mới">
				</div>

			</div>

			<footer class="modal-footer">
				<button class="btn btn-primary cancel-edit-pass-btn">Hủy</button>
				<button class="btn btn-primary confirm-edit-pass-btn">Xác
					nhận</button>
			</footer>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="./js/app.js"></script>
	<script src="./js/darkTheme.js"></script>
	<script src="./js/pagination.js"></script>
	<script src="./js/modalAddStudent.js"></script>
	<script src="./js/modalEditPass.js"></script>
	<script src="./js/showPass.js"></script>
</body>
</html>