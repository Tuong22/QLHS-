<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<div class="sidebarnav-top scroll-sidebar p-0">
							<li class="sidebar-item mg-l-4"><a class="sidebar-link"
								href="#" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link  active"
								href="<%=request.getContextPath()%>/infoClassServlet"
								aria-expanded="false"> <span> <i
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
								href="./searchStudent.jsp" aria-expanded="false"> <span>
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
								href="<%=request.getContextPath()%>/tablePointServlet"
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

											<form class="d-flex flex-row justify-content-between"
												action="<%=request.getContextPath()%>/InfoClassServlet">
												<input type="hidden" name="action" value="/searchByKhoi">
												<div class="datatable-selection">


													<div id="class-semester" class="class-semester-selection">

														<label for="search-khoi">Khối: </label> <select
															id="search-khoi" name="search-khoi">
															<option></option>
															<option
																<c:if test="${nameKhoi == 'Khối 10'}">selected</c:if>>Khối
																10</option>
															<option
																<c:if test="${nameKhoi == 'Khối 11'}">selected</c:if>>Khối
																11</option>
															<option
																<c:if test="${nameKhoi == 'Khối 12'}">selected</c:if>>Khối
																12</option>
														</select>
													</div>
													<button type="submit"
														class="btn btn-primary search-class-btn mt-2">Tìm
														kiếm</button>

												</div>


												<div class="add-class">
													<button type="button"
														class="btn btn-primary add-class-btn mt-4">Thêm
														lớp</button>

													<button type="button"
														class="btn btn-primary list-of-class-btn mt-4">
														<a
															href="<%=request.getContextPath()%>/listStudentOfClass.jsp">
															Xem danh sách học sinh</a>
													</button>
												</div>
											</form>
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

													<c:forEach var="Lop" items="${DSTCK}">
														<tr data-index="0">
															<td><%=i++%></td>
															<td class="className-edit">${Lop.tenKhoi}<span>

																	<i
																	class="className-edit-icon fa fa-solid fa-pen-to-square"></i>
																	<i class="removeClass-icon fa fa-solid fa-trash-can"></i></td>
															</span>
															<td>${Lop.siSo}</td>
														</tr>
													</c:forEach>

												</tbody>
											</table>
											
											
											
											<!-- thông báo thêm lớp lỗi -->
											<c:if test="${not empty requestScope.messageErrorAddClass}">
												<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid  fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">${requestScope.messageErrorAddClass}</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
											</c:if>
											<!-- thông báo thêm lớp thành công -->
											<c:if test="${not empty requestScope.messageInfoAddClass}">
												<div id="toast">
													<div class="toast toast--success">
														<div class="toast__icon">
															<i class="fa-solid fa-circle-check"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thành công</h3>
															<p class="toast__msg">${requestScope.messageInfoAddClass}</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
											</c:if>
											
											<!-- thông báo sửa tên lớp thất bại-->
											<c:if test="${not empty requestScope.messageErrorUpdateClass}">
												<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid  fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">${requestScope.messageErrorUpdateClass}</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
											</c:if>
											<!-- thông báo sửa tên lớp thành công-->
											<c:if test="${not empty requestScope.messageInfoUpdateClass}">
												<div id="toast">
													<div class="toast toast--success">
														<div class="toast__icon">
															<i class="fa-solid fa-circle-check"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thành công</h3>
															<p class="toast__msg">${requestScope.messageInfoUpdateClass}</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
											</c:if>
										
											<!-- thông báo xóa lớp thất bại-->
											<c:if test="${not empty requestScope.messageErrorClass}">
												<div id="toast">
													<div class="toast toast--error">
														<div class="toast__icon">
															<i class="fa-solid  fa-triangle-exclamation"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thất bại</h3>
															<p class="toast__msg">${requestScope.messageErrorClass}</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
											</c:if>
											<!-- thông báo xóa lớp thành công-->
											<c:if test="${not empty requestScope.messageInfoClass}">
												<div id="toast">
													<div class="toast toast--success">
														<div class="toast__icon">
															<i class="fa-solid fa-circle-check"></i>
														</div>
														<div class="toast__body">
															<h3 class="toast__title">Thành công</h3>
															<p class="toast__msg">${requestScope.messageInfoClass}</p>
														</div>
														<div class="toast__close">
															<i class="fa-solid fa-xmark"></i>
														</div>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</div>





								<div class="card-body change-className hidden">
									<div class="card">
										<header class="change-className-top">
											<h5>Thay đổi tên lớp</h5>
										</header>
										<form action="<%=request.getContextPath()%>/InfoClassServlet">
											<input type="hidden" name="action" value="/update">
											<input type="hidden" name="tenKhoi" class="searchByKhoi">
											<div class="change-className-container">

												<div class="change-className-group">
													<label for="classNameOld">Tên lớp thay đổi:</label> <input
														type="text" id="classNameOld" name="nameOld" readonly>
												</div>
												<div class="change-className-group">
													<label for="change-className-input">Nhập tên lớp
														mới:</label> <input type="text" id="change-className-input"
														placeholder="Tên lớp mới" name="name">
												</div>
												<div class="change-className-group">
													<label for="numberOfSubject-input">Nhập sỉ số:</label> <input
														type="text" id="numberOfSubject-input" placeholder="Sỉ số"
														name="number">
												</div>
											</div>


											<div class="change-className-bottom">
												<div class="change-className-confirm">
													<button type="button"
														class="btn btn-primary btn-cancel change-className-cancel-btn">Hủy</button>
													<button type="submit"
														class="btn btn-primary change-className-confirm-btn">Xác
														nhận</button>
												</div>
											</div>
										</form>
									</div>
								</div>

								<div class="card-body remove-class hidden">
									<div class="card">
										<header class="remove-class-top">
											<h5>Bạn có chắc chắn xóa lớp</h5>
										</header>
										<form action="<%=request.getContextPath()%>/InfoClassServlet">
											<input type="hidden" name="action" value="/delete">
											<input type="hidden" name="tenKhoi" class="searchByKhoi">
											<div class="remove-class-container">

												<div class="remove-class-group">
													<input type="text" id="classNameRemove" name="nameRemove"
														readonly>
												</div>
											</div>


											<div class="remove-class-bottom">
												<div class="remove-class-confirm">
													<button type="button"
														class="btn btn-primary btn-cancel remove-class-cancel-btn">Hủy</button>
													<button type="submit"
														class="btn btn-primary remove-class-confirm-btn">Xác
														nhận</button>
												</div>
											</div>
										</form>
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

	<!-- Modal add class -->
	<div class="modal add-class-modal">
		<div class="modal-container add-class-modal-container">

			<div class="icon-close js-modal-add-class-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header"> Thêm lớp mới </header>
			<form action="<%=request.getContextPath()%>/InfoClassServlet">
				<input type="hidden" name="action" value="/insert"> <input
					class="searchByKhoi" type="hidden" name="tenKhoi">
				<div class="modal-body">
					<div class="model-input-item">
						<label for="new-class" class="modal-label">Tên lớp:</label> <input
							type="text" id="new-class" class="modal-input"
							placeholder="Tên lớp" name="newClassName">
					</div>


					<div class="model-input-item">
						<label for="number-of-student" class="modal-label">Sỉ số:</label>
						<input type="text" id="number-of-student" class="modal-input"
							placeholder="Sỉ số" name="newNumber">
					</div>

				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary btn-cancel cancel-add-class-btn">Hủy</button>
					<button type="submit" class="btn btn-primary confirm-add-class-btn">Xác
						nhận</button>
				</footer>
			</form>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>


	<script src="./js/app.js"></script>
	<script src="./js/classHandle.js"></script>
	<script src="./js/pagination.js"></script>

	<script>
		const addClass = document.querySelector('.add-class-btn')
		const modalAddClass = document.querySelector('.add-class-modal')
		const modalAddClassContainer = document
				.querySelector('.add-class-modal-container')
		const closeModalAddClassBtn = document
				.querySelector('.js-modal-add-class-close')
		const cancelAddClassBtn = document
				.querySelector('.cancel-add-class-btn')

		function Open() {
			modalAddClass.classList.add('open')
		}

		function Hide() {
			modalAddClass.classList.remove('open')
		}

		addClass.addEventListener('click', Open)

		closeModalAddClassBtn.addEventListener('click', Hide)
		cancelAddClassBtn.addEventListener('click', Hide)
		modalAddClass.addEventListener('click', Hide)
		modalAddClassContainer.addEventListener('click', function(event) {
			event.stopPropagation()
		})
	</script>
	<script>
		let input = document.querySelectorAll('.searchByKhoi')
		let select = document.getElementById('search-khoi')
		const options = select.options;
		console.log(input)
		select.addEventListener("change", function() {
			for (let i = 0; i < options.length; i++) {
				if (options[i].selected) {
					for (let e = 0; e < input.length; e++) {
						input[e].setAttribute("value", options[i].value)
					}
					break;
				}
			}
		})
		for (let i = 0; i < options.length; i++) {
				if (options[i].selected) {
					for (let e = 0; e < input.length; e++) {
						input[e].setAttribute("value", options[i].value)
					}
					break;
				}
		}
	</script>
</body>
</html>