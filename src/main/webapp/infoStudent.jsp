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
								href="<%=request.getContextPath()%>/changePasswordServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-user"></i>
								</span> <span class="hide-menu">Tài Khoản</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="<%=request.getContextPath()%>/infoClassServlet"
								aria-expanded="false"> <span> <i
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

									<c:if test="${not empty requestScope.messageErrorAge}">
										<div id="toast">
											<div class="toast toast--error">
												<div class="toast__icon">
													<i class="fa-solid fa-triangle-exclamation"></i>
												</div>
												<div class="toast__body">
													<h3 class="toast__title">Thất bại</h3>
													<p class="toast__msg">Thêm học sinh thất bại. Tuổi
														không hợp lệ.</p>
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
													<p class="toast__msg">Thêm học sinh thất bại. Email đã
														tồn tại.</p>
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

									<c:if
										test="${not empty requestScope.messageErrorUpdateStudent}">
										<div id="toast">
											<div class="toast toast--error">
												<div class="toast__icon">
													<i class="fa-solid fa-circle-check"></i>
												</div>
												<div class="toast__body">
													<h3 class="toast__title">Thất bại</h3>
													<p class="toast__msg">Sửa thông tin không thành công.</p>
												</div>
												<div class="toast__close">
													<i class="fa-solid fa-xmark"></i>
												</div>
											</div>
										</div>
									</c:if>
									<div class="add-student">
										<a href="./addListStudents.jsp"><button class="btn btn-primary add-student-btn"
											<c:if test="${sessionScope.account.isAdmin != 1 && sessionScope.account.isAdmin != 4}">
													                   aria-disabled="true" style="pointer-events: none; opacity: 0.5;"
													               </c:if>>Thêm
											học sinh</button></a>
									</div>

									<div class="datatable-container">
										<table id="datatablesInfoStudent" class="datatable-table">
											<thead>
												<tr>
													<th data-sortable="true"
														style="width: 6%; margin-left: 20px; text-align: center;"><a
														href="#" class="datatable-sorter">STT</a></th>
													<th data-sortable="true" aria-sort="descending"
														class="datatable-descending"
														style="width: 20%; text-align: center;"><a href="#"
														class="datatable-sorter">Tên</a></th>
													<th data-sortable="true"
														style="width: 12%; text-align: center;"><a href="#"
														class="datatable-sorter">Giới Tính</a></th>
													<th data-sortable="true"
														style="width: 14%; text-align: center;"><a href="#"
														class="datatable-sorter">Ngày sinh</a></th>
													<th data-sortable="true"
														style="width: 20%; text-align: center;"><a href="#"
														class="datatable-sorter">Địa chỉ</a></th>
													<th data-sortable="true"
														style="width: 28%; text-align: center;"><a href="#"
														class="datatable-sorter">Email</a></th>
												</tr>
											</thead>
											<tbody>

												<c:forEach var="HocSinh" items="${DSHS}">
													<tr>
														<td><%=i++%></td>
														<td class="name"><c:out value="${HocSinh.tenHS}" /></td>
														<td class="gender"><c:out value="${HocSinh.gioiTinh}" /></td>
														<td class="year"><c:out value="${HocSinh.namSinh}" /></td>
														<td class="address"><c:out value="${HocSinh.diaChi}" /></td>
														<td class="email d-flex justify-content-between border-0"><c:out
																value="${HocSinh.email}" /> <i
															class="edit-infoStudent fa-solid fa-pen-to-square"
															<c:if test="${sessionScope.account.isAdmin != 1 && sessionScope.account.isAdmin != 4}">
													                   aria-disabled="true" style="pointer-events: none; opacity: 0.5;"
													               </c:if>></i>
														</td>
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
	<!--  
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
							type="date" id="student-year" class="modal-input"
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
	-->

	<!-- Modal update student -->
	<div class="modal update-student-modal">
		<div class="modal-container update-student-modal-container">

			<div class="icon-close js-update-student-modal-close">
				<i class="modal-icon-close fa-solid fa-xmark"></i>
			</div>

			<header class="modal-header">Sửa thông tin học sinh</header>

			<form action="<%=request.getContextPath()%>/InfoStudentsServlet">
				<input type="hidden" name="action" value="/update">
				<div class="modal-body">
					<div class="model-input-item">
						<label for="student-name-new" class="modal-label">Tên:</label> <input
							type="text" id="student-name-new" class="modal-input"
							placeholder="Họ tên" name="studentName" readonly>
					</div>

					<div class="model-input-item">
						<label class="modal-label">Giới tính:</label>
						<div class="student-gender">
							<div class="student-gender-wrap">
								<label for="student-male-new" class="modal-label">Nam</label> <input
									type="radio" id="student-male-new" class="modal-input"
									name="gender-group-new" value="Nam" disabled>
							</div>

							<div class="student-gender-wrap">
								<label for="student-female-new" class="modal-label">Nữ</label> <input
									type="radio" id="student-female-new" class="modal-input"
									name="gender-group-new" value="Nữ" disabled>
							</div>

						</div>

					</div>

					<div class="model-input-item">
						<label for="student-year-new" class="modal-label">Năm
							sinh:</label> <input type="date" id="student-year-new"
							class="modal-input" placeholder="Năm sinh" name="studentYearNew">
					</div>

					<div class="model-input-item">
						<label for="student-address-new" class="modal-label">Địa
							chỉ:</label> <input type="text" id="student-address-new"
							class="modal-input" placeholder="Địa chỉ"
							name="studentAddressNew">
					</div>

					<div class="model-input-item">
						<label for="student-email-new" class="modal-label">Email:</label>
						<input type="email" id="student-email-new" class="modal-input"
							placeholder="Email" name="studentEmailNew">
					</div>

				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary btn-cancel cancel-update-student-btn">Hủy</button>
					<button type="submit"
						class="btn btn-primary confirm-update-studen-btn">Xác
						nhận</button>
				</footer>
			</form>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="./js/app.js"></script>
	<script src="./js/pagination.js"></script>
	<script src="./js/modalAddStudent.js"></script>
	<script>
		const updateStudentIcons = document
				.querySelectorAll('.edit-infoStudent')
		const modalUpdateStudent = document
				.querySelector('.update-student-modal')
		const modalUpdateStudentContainer = document
				.querySelector('.update-student-modal-container')
		const modalUpdateStudentClose = document
				.querySelector('.js-update-student-modal-close')
		const cancelUpdateStudentBtn = document
				.querySelector('.cancel-update-student-btn')

		const studentNameNew = document.getElementById("student-name-new")
		const studentGenderNew = document
				.querySelectorAll('input[name="gender-group-new"]');
		const studentYearNew = document.getElementById("student-year-new")
		const studentAddressNew = document
				.getElementById("student-address-new")
		const studentEmailNew = document.getElementById("student-email-new")

		var studentNameCurr
		var studentGenderCurr
		var studentYearCurr
		var studentAddressCurr
		var studentEmailCurr

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
			if (!parent)
				return null; // Kiểm tra nếu không có phần tử cha

			const siblings = parent.children;
			for (let i = 0; i < siblings.length; i++) {
				if (siblings[i] !== element
						&& siblings[i].classList.contains(className)) {
					return siblings[i];
				}
			}

			return null; // Trả về null nếu không tìm thấy phần tử ngang cấp với class truyền vào
		}

		function Hide() {
			modalUpdateStudent.classList.remove('open')
		}

		updateStudentIcons.forEach(function(updateStudentIcon) {
			updateStudentIcon.addEventListener('click', function() {
				studentNameCurr = getSibling(getParent(updateStudentIcon,
						".email"), 'name')
				studentGenderCurr = getSibling(getParent(updateStudentIcon,
						".email"), 'gender')
				studentYearCurr = getSibling(getParent(updateStudentIcon,
						".email"), 'year')
				studentAddressCurr = getSibling(getParent(updateStudentIcon,
						".email"), 'address')
				studentEmailCurr = getParent(updateStudentIcon, ".email")

				studentNameNew.setAttribute("value",
						studentNameCurr.textContent)
				studentGenderNew.forEach(function(item) {
					item.removeAttribute("checked", "")
				})
				studentGenderNew.forEach(function(item) {
					if (item.value == studentGenderCurr.textContent) {
						item.setAttribute("checked", "")
					}
				})
				studentYearNew.setAttribute("value",
						studentYearCurr.textContent)
				studentAddressNew.setAttribute("value",
						studentAddressCurr.textContent)
				studentEmailNew.setAttribute("value",
						studentEmailCurr.textContent)
				modalUpdateStudent.classList.add('open')
			})
		})

		modalUpdateStudentClose.addEventListener('click', Hide)
		cancelUpdateStudentBtn.addEventListener('click', Hide)
		modalUpdateStudent.addEventListener('click', Hide)
		modalUpdateStudentContainer.addEventListener('click', function(event) {
			event.stopPropagation()
		})
	</script>

</body>
</html>