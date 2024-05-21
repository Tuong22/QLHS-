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
							<li class="sidebar-item"><a class="sidebar-link active" href="#"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-book-open"></i>
								</span> <span class="hide-menu">Môn</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link" href="./tablePoint.jsp"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>

							<li class="sidebar-item"><a class="sidebar-link" href="./report.jsp"
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

			<!-- Class start -->
			<div id="subject" class="container-fluid subject">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách môn
							</div>

							<div class="subject-list-wrap">
								<div class="card-body subject-list-data">

									<div class="datatable-wrapper">
										<div class="datatable-container">
											<table id="datatablesSubject" class="datatable-table">
												<thead>
													<tr>
														<th data-sortable="true" style="width: 20%;"><a
															href="#" class="datatable-sorter">STT</a></th>
														<th data-sortable="true" aria-sort="descending"
															class="datatable-descending" style="width: 60%;"><a
															href="#" class="datatable-sorter">Tên môn</a></th>
														<th data-sortable="true" style="width: 20%;"><a
															href="#" class="datatable-sorter">Hệ số</a></th>
													</tr>
												</thead>
												<tbody>
													<tr data-index="0">
														<td>1</td>
														<td class="subjectName-edit">Technical Author <i
															class="subjectName-edit-icon fa fa-solid fa-pen-to-square"></i>
														</td>
														<td>23</td>
													</tr>
													<tr data-index="0">
														<td>1</td>
														<td class="subjectName-edit">Tú Author <i
															class="subjectName-edit-icon fa fa-solid fa-pen-to-square"></i>
														</td>
														<td>23</td>
													</tr>
													<tr data-index="0">
														<td>1</td>
														<td class="subjectName-edit">tuấn Author <i
															class="subjectName-edit-icon fa fa-solid fa-pen-to-square"></i>
														</td>
														<td>23</td>
													</tr>
													<tr data-index="0">
														<td>1</td>
														<td class="subjectName-edit">hâh Author <i
															class="subjectName-edit-icon fa fa-solid fa-pen-to-square"></i>
														</td>
														<td>23</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="datatablefooter justify-content-end ">
											<button class="btn btn-primary add-subject-btn">Thêm
												môn</button>
										</div>
									</div>



								</div>
								<div class="card-body change-subjectName hidden">
									<div class="card">
										<header class="change-subjectName-top">
											<h5>Thay đổi tên môn</h5>
										</header>

										<div class="change-subjectName-container">
											<div class="change-subjectName-group">
												<label for="change-subjectName-input">Nhập tên môn
													mới:</label> <input type="text" id="change-subjectName-input"
													placeholder="Tên môn mới">
											</div>
										</div>


										<div class="change-subjectName-bottom">
											<div class="change-subjectName-confirm">
												<button
													class="btn btn-primary change-subjectName-cancel-btn">Hủy</button>
												<button
													class="btn btn-primary change-subjectName-confirm-btn">Xác
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

		</div>
		<!--  Main wrapper -->

	</div>



	<!-- Modal add subject -->
	<div class="modal add-subject-modal">
		<div class="modal-container add-subject-modal-container">

			<div class="icon-close js-modal-add-subject-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Thêm môn mới </header>

			<div class="modal-body">
				<div class="model-input-item">
					<label for="new-subject" class="modal-label">Tên môn:</label> <input
						type="text" id="new-subject" class="modal-input"
						placeholder="Tên môn">
				</div>


				<div class="model-input-item">
					<label for="number-of-subject" class="modal-label">Hệ số:</label> <input
						type="text" id="number-of-subject" class="modal-input"
						placeholder="Hệ số">
				</div>

			</div>

			<footer class="modal-footer">
				<button class="btn btn-primary cancel-add-subject-btn">Hủy</button>
				<button class="btn btn-primary confirm-add-subject-btn">Xác
					nhận</button>
			</footer>
		</div>
	</div>




	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>


	<script src="./js/app.js"></script>
	<script src="./js/pagination.js"></script>
	<script src="./js/editSubjectName.js"></script>
	<script src="./js/modalAddSubject.js"></script>
</body>
</html>