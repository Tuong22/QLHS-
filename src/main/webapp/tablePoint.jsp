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
						class="logo-img" src="./image/logo.jpg" alt=""> Quản lý học
						sinh
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
								href="<%=request.getContextPath()%>/AccountServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="./class.jsp" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-chalkboard-user"></i>
								</span> <span class="hide-menu">Lớp</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="./infoStudent.jsp" aria-expanded="false"> <span>
										<i class="fa fa-solid fa-graduation-cap"></i>
								</span> <span class="hide-menu">Thông tin học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/SearchStudentServlet"
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
							<li class="sidebar-item"><a class="sidebar-link active"
								href="<%=request.getContextPath()%>/TablePointServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>

							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/ReportServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-file-excel"></i>
								</span> <span class="hide-menu">Báo cáo</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/ChangeRule"
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
							<a href="" target="_blank">${sessionScope.account.username}</a>
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

			<!-- Table point start -->
			<div id="table-point" class="container-fluid table-point">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Bảng điểm môn
							</div>
							<div class="card-body pb-2">
								<div class="datatable-wrapper">
									<div class="datatable-top">
										<form action="<%=request.getContextPath()%>/tablePointServlet">
											<input type="hidden" name="action" value="/pointStudent">
											<div class="datatable-selection">
												<div class="">
													<label>Lớp: </label> <select class="search-class"
														name="search-lop">
														<c:forEach var="c" items="${DSL}">
															<option
																<c:if test="${nameLop == c.tenLop}">selected</c:if>>${c.tenLop}</option>
														</c:forEach>

													</select>

												</div>
											</div>


											<div class="search-point d-flex justify-content-between">
												<span>
													<button type="submit"
														class="btn btn-primary search-point-btn">Tìm kiếm</button>

													<a href="./insertPoint.jsp"
													<c:if test="${sessionScope.account.isAdmin != 3 && sessionScope.account.isAdmin != 1}">
													                   aria-disabled="true" style="pointer-events: none; opacity: 0.5;"
													               </c:if>><button
															type="button" class="btn btn-primary search-point-btn">Nhập
															điểm</button></a>
												</span> <span>
													<button type="submit"
														class="btn btn-primary search-point-btn">In bảng
														điểm</button>
												</span>
											</div>
										</form>

									</div>
									<div class="datatable-container">
										<table id="datatablesPoint" class="datatable-table">
											<thead>
												<tr>
													<th style="width: 5%; text-align: center;">STT</th>
													<th style="width: 25%; text-align: center;">Tên</th>
													<th style="width: 7%; text-align: center;">Toán</th>
													<th style="width: 7%; text-align: center;">Văn</th>
													<th style="width: 7%; text-align: center;">Anh</th>
													<th style="width: 7%; text-align: center;">Lý</th>
													<th style="width: 7%; text-align: center;">Hóa</th>
													<th style="width: 7%; text-align: center;">Sinh</th>
													<th style="width: 7%; text-align: center;">Sử</th>
													<th style="width: 7%; text-align: center;">Địa</th>
													<th style="width: 7%; text-align: center;">GDCD</th>
													<th style="width: 7%; text-align: center;">TD</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="point" items="${DSD}">
													<tr data-index="0">
														<td style="text-align: center;"><%=i++%></td>
														<td>${point.tenHS}</td>
														<td>${point.mieng}</td>
														<td>${point.muoiLamPhut}</td>
														<td>${point.motTiet}</td>
														<td>${point.hocKy}</td>
														<td>${point.tbMon}</td>
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
			<!-- Table point end -->


		</div>
		<!--  Main wrapper -->

	</div>



	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="./js/app.js"></script>
	<script src="./js/pagination.js"></script>

</body>
</html>