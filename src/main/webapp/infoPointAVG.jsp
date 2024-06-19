<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
								href="<%=request.getContextPath()%>/changePasswordServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<c:if test="${sessionScope.account.isAdmin != 5}">
								<li class="sidebar-item"><a class="sidebar-link"
									href="<%=request.getContextPath()%>/infoClassServlet"
									aria-expanded="false"> <span> <i
											class="fa fa-solid fa-chalkboard-user"></i>
									</span> <span class="hide-menu">Lớp</span>
								</a></li>
							</c:if>

							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/InfoStudentsServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-graduation-cap"></i>
								</span> <span class="hide-menu">Thông tin học sinh</span>
							</a></li>

							<c:if test="${sessionScope.account.isAdmin != 5}">
								<li class="sidebar-item"><a class="sidebar-link"
									href="<%=request.getContextPath()%>/searchStudentServlet"
									aria-expanded="false"> <span> <i
											class="fa fa-solid fa-magnifying-glass"></i>
									</span> <span class="hide-menu">Tra cứu học sinh</span>
								</a></li>
								<li class="sidebar-item"><a class="sidebar-link"
									href="<%=request.getContextPath()%>/InfoSubjectServlet"
									aria-expanded="false"> <span> <i
											class="fa fa-solid fa-book-open"></i>
									</span> <span class="hide-menu">Môn</span>
								</a></li>
							</c:if>
							<li class="sidebar-item"><a class="sidebar-link active"
								href="<%=request.getContextPath()%>/tablePointServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-table"></i>
								</span> <span class="hide-menu">Bảng điểm</span>
							</a></li>
							<c:if test="${sessionScope.account.isAdmin != 5}">

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
						</c:if>
						<c:if test="${sessionScope.account.isAdmin == 5}">
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
						</c:if>
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
								class="fa-solid fa-bars ms-auto no-print"></i>
						</a></li>
						<li class="nav-item"><a
							class="nav-link nav-icon-hover ms-auto no-print"
							href="javascript:void(0)"> <i
								class="fa-regular fa-bell ms-auto no-print"></i>
								<div class="notification ms-auto no-print"></div>
						</a></li>
					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end ms-auto no-print">
							<a href="" target="_blank">${sessionScope.account.username}</a>
							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover ms-auto no-print"
								href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
								aria-expanded="false"> <img
									src="./image/captain_yami-sukehiro.jpg" alt="" width="35"
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
								<c:if test="${sessionScope.account.isAdmin != 5}">
									<i class="fas fa-table me-1"></i> BẢNG ĐIỂM MÔN LỚP
								</c:if>
								<c:if
									test="${sessionScope.account.username == sessionScope.hs.maHS}">
									<i class="fas fa-table me-1"></i> BẢNG ĐIỂM MÔN HỌC SINH
							</c:if>
							</div>

							<div class="card-body">
								<div class="datatable-wrapper">
									<c:if test="${sessionScope.account.isAdmin != 5}">
										<div class="datatable-top">
											<form
												action="<%=request.getContextPath()%>/tablePointServlet">
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

													<div class="">
														<label>Học kỳ: </label> <select id="search-hk"
															name="search-hk">
															<option <c:if test="${nameHocKy == '1'}">selected</c:if>>1</option>
															<option <c:if test="${nameHocKy == '2'}">selected</c:if>>2</option>
														</select>
													</div>

													<div class="">
														<label>Môn: </label> <select id="search-mon"
															name="search-mon">
															<c:forEach var="subject" items="${DSMH}">
																<option
																	<c:if test="${nameMon == subject.tenMH}">selected</c:if>>${subject.tenMH}</option>
															</c:forEach>
														</select>
													</div>
												</div>

												<div class="search-point">
													<a href="./tablePoint.jsp"><button type="button" class="btn btn-primary search-point-btn">Quay lại</button></a>
													<button type="button" class="btn btn-primary search-point-btn">Xem</button>
												</div>
											</form>

										</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="./js/app.js"></script>
</body>
</html>