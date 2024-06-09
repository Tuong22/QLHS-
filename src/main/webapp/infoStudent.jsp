<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý học sinh</title>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@v5.3.0/dist/css/bootstrap.min.css">
<style <%@ include file="./css/style.css" %>></style>

</head>
<body style="background-color: #484848">
	<%
	int i = 1;
	%>
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
						Quản lý học sinh
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
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/infoClassServlet" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-chalkboard-user"></i>
								</span> <span class="hide-menu">Lớp</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link active"
								href="<%=request.getContextPath()%>/InfoStudentsServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-graduation-cap"></i>
								</span> <span class="hide-menu">Thông tin học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/searchStudentServlet" aria-expanded="false"> <span>
										<i class="fa fa-solid fa-magnifying-glass"></i>
								</span> <span class="hide-menu">Tra cứu học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/InfoSubjectServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-book-open"></i>
								</span> <span class="hide-menu">Môn</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/tablePointServlet" aria-expanded="false"> <span>
										<i class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>

							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/ReportServlet" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-file-excel"></i>
								</span> <span class="hide-menu">Báo cáo</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/ChangeRule" aria-expanded="false"> <span>
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
							<a href="" target="_blank">Admin</a>
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


			<!-- Info student start -->
			<div id="info-student" class="container-fluid info-student">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách học sinh
							</div>
							<div class="card-body">
								<div class="datatable-wrapper">
									<c:if test="${not empty requestScope.messagEerrorName}">
										<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">Thêm học sinh thất bại. Chưa nhập tên học sinh.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									
									<c:if test="${not empty requestScope.messageErrorGender}">
										<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">Thêm học sinh thất bại. Chưa nhập giới tính.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									
									<c:if test="${not empty requestScope.messageErrorAddress}">
										<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">Thêm học sinh thất bại. Chưa nhập địa chỉ.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									
									<c:if test="${not empty requestScope.messageErrorEmail}">
										<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">Thêm học sinh thất bại. Chưa nhập email.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									
									<c:if test="${not empty requestScope.messageErrorAge}">
										<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">Thêm học sinh thất bại. Tuổi không hợp lệ.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									
									<c:if test="${not empty requestScope.messageErrorEmailExist}">
										<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">Thêm học sinh thất bại. Email đã tồn tại.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									
									
									
									<c:if test="${not empty requestScope.messageInfo}">
										<div id="toast">
													<div class="toast toast--success">
														<div class="toast__icon">
															<i class="fa-solid fa-circle-check"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thành công</h3>
															<p class="toast__msg">Thêm học sinh thành công.</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
									</c:if>
									<div class="add-student">

										<button class="btn btn-primary add-student-btn">Thêm
											học sinh</button>
									</div>


									<div class="datatable-container">
										<table id="datatablesInfoStudent" class="datatable-table">
											<thead>
												<tr>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">STT</a></th>
													<th data-sortable="true" aria-sort="descending"
														class="datatable-descending" style="width: 20%;"><a
														href="#" class="datatable-sorter">Tên</a></th>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">Giới Tính</a></th>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">Năm</a></th>
													<th data-sortable="true" style="width: 25%;"><a
														href="#" class="datatable-sorter">Địa chỉ</a></th>
													<th data-sortable="true" style="width: 25%;"><a
														href="#" class="datatable-sorter">Email</a></th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="HocSinh" items="${DSHS}">
													<tr>
														<td><%=i++%></td>
														<td><c:out value="${HocSinh.tenHS}" /></td>
														<td><c:out value="${HocSinh.gioiTinh}" /></td>
														<td><c:out value="${HocSinh.namSinh}" /></td>
														<td><c:out value="${HocSinh.diaChi}" /></td>
														<td><c:out value="${HocSinh.email}" /></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Info student end -->

		</div>
		<!--  Main wrapper -->

	</div>


	<!-- Modal add student -->
	<div class="modal add-student-modal">
		<div class="modal-container add-student-modal-container">

			<div class="icon-close js-modal-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Thêm học sinh mới </header>

			<form action="<%=request.getContextPath()%>/InfoStudentsServlet">
				<input type="hidden" name="action" value="/insert">
				<div class="modal-body">
					<div class="model-input-item">
						<label for="student-name" class="modal-label">Tên:</label> <input
							type="text" id="student-name" class="modal-input"
							placeholder="Họ tên" name="studentName">
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
							placeholder="Năm sinh" name="studentYear">
					</div>

					<div class="model-input-item">
						<label for="student-address" class="modal-label">Địa chỉ:</label>
						<input type="text" id="student-address" class="modal-input"
							placeholder="Địa chỉ" name="studentAddress">
					</div>

					<div class="model-input-item">
						<label for="student-email" class="modal-label">Email:</label> <input
							type="email" id="student-email" class="modal-input"
							placeholder="Email" name="studentEmail">
					</div>

				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary cancel-add-student-btn btn-cancel">Hủy</button>
					<button type="submit"
						class="btn btn-primary confirm-add-studen-btn">Xác nhận</button>
				</footer>
			</form>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="./js/app.js"></script>
	<script src="./js/pagination.js"></script>
	<script src="./js/modalAddStudent.js"></script>

</body>
</html>