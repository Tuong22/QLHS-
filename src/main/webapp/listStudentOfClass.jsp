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
	int e = 1;
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
								href="account.jsp" aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link active"
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
			<div id="list-student-of-class"
				class="container-fluid list-student-of-class">
				<div class="row">
					<div class="align-items-stretch">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Danh sách học sinh lớp
							</div>

							<div class="list-student-wrap d-flex flex-column">
								<div class="card-body">
									<div class="datatable-wrapper">
										<div class="datatable-top d-flex flex-column">

											<form class="d-flex flex-row justify-content-between"
												action="<%=request.getContextPath()%>/listStudentOfClassServlet">
												<input type="hidden" name="action" value="/show">
												<div class="datatable-top-group">
													<label for="search-Class" style="margin-right: 20px;">Tên
														lớp: </label> <select class="search-class" name="search-lop"
														style="margin-bottom: 50px;">
														<c:forEach var="c" items="${DSL}">
															<option <c:if test="${searchClass == c.tenLop}">selected</c:if>>${c.tenLop}</option>
														</c:forEach>

													</select>
												</div>



												<div class="datatable-top-group">
													<p class="">
														Sỉ số:
														<c:out value="${siso}" />
													</p>
												</div>
												<div class="add-class">
													<button type="submit"
														class="btn btn-primary show-list-student-of-class mb-1">Xem</button>
												</div>
										</div>

										</form>
										<div class="datatable-container">
											<table id="datatablesListStudent" class="datatable-table">
												<thead>
													<tr>
														<th data-sortable="true" style="width: 10%;"><a
															href="#" class="datatable-sorter">STT</a></th>
														<th data-sortable="true" aria-sort="descending"
															class="datatable-descending" style="width: 20%;"><a
															href="#" class="datatable-sorter">Tên</a></th>
														<th data-sortable="true" style="width: 15%;"><a
															href="#" class="datatable-sorter">Giới Tính</a></th>
														<th data-sortable="true" style="width: 15%;"><a
															href="#" class="datatable-sorter">Năm sinh</a></th>
														<th data-sortable="true" style="width: 20%;"><a
															href="#" class="datatable-sorter">Địa chỉ</a></th>
														<th data-sortable="true" style="width: 20%;"><a
															href="#" class="datatable-sorter">Email</a></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="HocSinh" items="${HS}">
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


										<div class="datatablefooter justify-content-between">
											<button
												class="btn btn-primary list-student-of-class-cancel-btn">
												<a href="./class.jsp">Quay lại</a>
											</button>
											<button
												class="btn btn-primary list-student-of-class-confirm-btn">
												<a>Thêm học sinh</a>
											</button>
										</div>

										<c:if
											test="${not empty requestScope.messageErrorInsertToClass}">
											<div id="toast">
												<div class="toast toast--error">
													<div class="toast__icon">
														<i class="fa-solid fa-triangle-exclamation"></i>
													</div>
													<div class="toast__body">
														<h3 class="toast__title">Thất bại</h3>
														<p class="toast__msg">Thêm học sinh thất bại.</p>
													</div>
													<div class="toast__close">
														<i class="fa-solid fa-xmark"></i>
													</div>
												</div>
											</div>
										</c:if>
										<c:if
											test="${not empty requestScope.messageInfoInsertToClass}">
											<div id="toast">
												<div class="toast toast--success">
													<div class="toast__icon">
														<i class="fa-solid fa-circle-check"></i>
													</div>
													<div class="toast__body">
														<h3 class="toast__title">Thành công</h3>
														<p class="toast__msg">Thêm học sinh vào lớp thành
															công.</p>
													</div>
													<div class="toast__close">
														<i class="fa-solid fa-xmark"></i>
													</div>
												</div>
											</div>
										</c:if>

									</div>
								</div>


								<div id="listStudentNotClass" class="datatable-container hidden"
									style="width: 85%; margin: auto;">
									<header class="modal-header"> Danh sách học sinh chưa
										có lớp </header>

									<form class="d-flex flex-column"
										action="<%=request.getContextPath()%>/listStudentOfClassServlet">
										<input type="hidden" name="action" value="/addStdNotClass">
										<table id="datatablesListStudent" class="datatable-table">
											<thead>
												<tr>
													<th data-sortable="true" style="width: 8%;"><a
														href="#" class="datatable-sorter">STT</a></th>
													<th data-sortable="true" aria-sort="descending"
														class="datatable-descending" style="width: 20%;"><a
														href="#" class="datatable-sorter">Tên</a></th>
													<th data-sortable="true" style="width: 15%;"><a
														href="#" class="datatable-sorter">Giới Tính</a></th>
													<th data-sortable="true" style="width: 10%;"><a
														href="#" class="datatable-sorter">Năm sinh</a></th>
													<th data-sortable="true" style="width: 22%;"><a
														href="#" class="datatable-sorter">Địa chỉ</a></th>
													<th data-sortable="true" style="width: 25%;"><a
														href="#" class="datatable-sorter">Email</a></th>
													<th data-sortable="true"><input
														class="listStudentNotClass-input" type="hidden"
														name="listStudentNotClass"> <input
														class="className-input" type="hidden" name="className"></th>

												</tr>
											</thead>
											<tbody>

												<c:forEach var="HocSinh" items="${DSHSNotClass}">
													<tr>
														<td><%=e++%></td>
														<td><c:out value="${HocSinh.tenHS}" /></td>
														<td><c:out value="${HocSinh.gioiTinh}" /></td>
														<td><c:out value="${HocSinh.namSinh}" /></td>
														<td><c:out value="${HocSinh.diaChi}" /></td>
														<td class="stdNotClass-email"><c:out
																value="${HocSinh.email}" /></td>
														<td class="choose-student-to-class"><label><input
																class="choose-student-to-class-input" type="checkbox"
																name="selectStudent"></label></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>

										<footer class="modal-footer" style="padding: 15px 0">
											<button type="button"
												class="btn btn-primary cancel-list-students-btn">Hủy</button>
											<button type="submit" class="btn btn-primary "
												id="confirm-list-students-btn">Xác nhận</button>
										</footer>
									</form>

								</div>


							</div>

						</div>
					</div>


				</div>
			</div>
			<!-- Class end -->

			<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
			<script src="./js/app.js"></script>
			<script src="./js/pagination.js"></script>
			<script>
				const addListStudentBtn = document
						.querySelector(".list-student-of-class-confirm-btn")
				addListStudentBtn.addEventListener('click', function() {
					document.getElementById("listStudentNotClass").classList
							.remove('hidden')
				})
			</script>
			<script> 
			function getParent(element, selector) {
				while (element.parentElement) {
					if (element.parentElement.matches(selector)) {
						return element.parentElement
					}
					element = element.parentElement
				}
			}
			
			function getSibling(element, className) {
			    const parent = element.parentElement;
			    if (!parent) return null; // Kiểm tra nếu không có phần tử cha
			    
			    const siblings = parent.children;
			    for (let i = 0; i < siblings.length; i++) {
			        if (siblings[i] !== element && siblings[i].classList.contains(className)) {
			            return siblings[i];
			        }
			    }
			    
			    return null; // Trả về null nếu không tìm thấy phần tử ngang cấp với class truyền vào
			}
			
			document.getElementById('confirm-list-students-btn').addEventListener('click', function() {
			    const checkboxes = document.querySelectorAll('input[name="selectStudent"]:checked');
			    let selectedValues = "";
			    checkboxes.forEach((checkbox) => {
			    	checkbox.setAttribute("value", getSibling(getParent(checkbox, ".choose-student-to-class"), 'stdNotClass-email').textContent)
			    });
			    checkboxes.forEach((checkbox) => {
			        selectedValues += checkbox.value + ",";
			    });
			    document.querySelector(".listStudentNotClass-input").setAttribute("value", selectedValues)
			    document.querySelector(".className-input").setAttribute("value", document.querySelector(".search-class").value)
			    console.log(document.querySelector(".className-input").value);
			});
			</script>
</body>
</html>