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
<body>
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
							<li class="sidebar-item mg-l-4"><a
								class="sidebar-link active"
								href="<%=request.getContextPath()%>/changePasswordServlet"
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
								href="<%=request.getContextPath()%>/searchStudentServlet"
								aria-expanded="false"> <span> <i
										class="fa fa-solid fa-magnifying-glass"></i>
								</span> <span class="hide-menu">Tra cứu học sinh</span>
							</a></li>
							<li class="sidebar-item"><a class="sidebar-link"
								href="./subject.jsp" aria-expanded="false"> <span> <i
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


			<!-- Account start -->
			<div id="account" class="container-fluid account">

				<div class="row">
					<!-- Account admin -->
					<c:if test="${sessionScope.account.isAdmin == 1}">
						<div class="card account-info">
							<div class="account-info-content">
								<h3 class="account-info-heading">Thông tin tài khoản</h3>

								<div class="spacer"></div>
								<c:if test="${not empty requestScope.messageinfo}">
									<div id="toast">
										<div class="toast toast--success">
											<div class="toast__icon">
												<i class="fa-solid fa-circle-check"></i>
											</div>
											<div class="toast__body">
												<h3 class="toast__title">Thành công</h3>
												<p class="toast__msg">${requestScope.messageinfo}</p>
											</div>
											<div class="toast__close">
												<i class="fa-solid fa-xmark"></i>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${not empty requestScope.messageerror}">
									<div id="toast">
										<div class="toast toast--error">
											<div class="toast__icon">
												<i class="fa-solid  fa-triangle-exclamation"></i>
											</div>
											<div class="toast__body">
												<h3 class="toast__title">Thất bại</h3>
												<p class="toast__msg">${requestScope.messageerror}</p>
											</div>
											<div class="toast__close">
												<i class="fa-solid fa-xmark"></i>
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${not empty requestScope.messageInfoAddAccount}">
									<div id="toast">
										<div class="toast toast--success">
											<div class="toast__icon">
												<i class="fa-solid fa-circle-check"></i>
											</div>
											<div class="toast__body">
												<h3 class="toast__title">Thành công</h3>
												<p class="toast__msg">${requestScope.messageInfoAddAccount}</p>
											</div>
											<div class="toast__close">
												<i class="fa-solid fa-xmark"></i>
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${not empty requestScope.messageErrorAddAccount}">
									<div id="toast">
										<div class="toast toast--error">
											<div class="toast__icon">
												<i class="fa-solid  fa-triangle-exclamation"></i>
											</div>
											<div class="toast__body">
												<h3 class="toast__title">Thất bại</h3>
												<p class="toast__msg">${requestScope.messageErrorAddAccount}</p>
											</div>
											<div class="toast__close">
												<i class="fa-solid fa-xmark"></i>
											</div>
										</div>
									</div>
								</c:if>



								<table id="datatablesChangeRule" class="datatable-table">
									<thead>
										<tr>
											<th data-sortable="true"
												style="text-align: center; width: 10%"><a href="#"
												class="datatable-sorter">STT</a></th>
											<th data-sortable="true" aria-sort="descending"
												class="datatable-descending"
												style="text-align: center; width: 35%"><a href="#"
												class="datatable-sorter">Tên tài khoản</a></th>
											<th data-sortable="true"
												style="text-align: center; width: 35%"><a href="#"
												class="datatable-sorter">Mật khẩu</a></th>
											<th data-sortable="true"
												style="text-align: center; width: 20%"><a href="#"
												class="datatable-sorter">Thao tác</a></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="acc" items="${DSTK}">
											<tr>
												<td style="text-align: center;"><%=i++%></td>
												<td class="ps-4 name">${acc.username}</td>

												<td class="d-flex justify-content-between border-0 ps-4">${acc.password}</td>
												<td class="action" style="text-align: center;"><i
													class="role-user-icon fas fa-users"></i> <i
													class="edit-pass fa-solid fa-pen-to-square"></i> <i
													class="removeClass-icon fa fa-solid fa-trash-can"></i></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>

							<button type="button" class="btn btn-primary add-acc-btn">Tạo
								tài khoản</button>

							<footer class="account-info-footer">
								<span>Last update: </span>
								<p class="account-last-update"></p>
							</footer>
						</div>
					</c:if>

					<!-- Account not admin -->
					<c:if test="${sessionScope.account.isAdmin != 1}">
						<div class="card account-info col-7">
							<div class="account-info-content">
								<h3 class="account-info-heading">Thông tin tài khoản</h3>

								<div class="spacer"></div>


								<div class="account-info-group">
									<label><i class="account-icon fa-solid fa-user"></i>Tên
										tài khoản: </label> <input class="account-name-text ps-2"
										value="${sessionScope.account.username}" readonly>


								</div>

								<div class="account-info-group">
									<label><i class="account-icon fa-solid fa-key"></i>Mật
										khẩu: </label>
									<div class="account-pass d-flex">
										<input class="account-pass-text ps-2 border-0" type="password"
											id="password" value="${sessionScope.account.password}"
											readonly>
										<div class="pass-selection d-flex">
											<i class="show-pass fa-solid fa-eye"></i> <i
												class="hide-pass fa-solid fa-eye-slash hidden"></i> <i
												class="edit-pass fa-solid fa-pen-to-square"></i>
										</div>
									</div>
								</div>


							</div>

							<footer class="account-info-footer">
								<span>Last update: </span>
								<p class="account-last-update"></p>
							</footer>
						</div>
					</c:if>
				</div>
			</div>
			<!-- Account end -->

		</div>
		<!--  Main wrapper -->

	</div>

	<!-- Modal role account -->
	<div class="modal role-account-modal">

		<form action="<%=request.getContextPath()%>/changePasswordServlet">
			<input type="hidden" name="action" value="/roleAccount">
			<div class="modal-container role-account-modal-container">

				<div class="icon-close js-modal-role-account-close">
					<i class="modal-icon-close fa-solid fa-xmark"></i>
				</div>

				<header class="modal-header"> Phân quyền người dùng</header>

				<div class="modal-body">
					<div class="model-input-item">
						<label for="userNameRole" class="modal-label">Tên tài
							khoản:</label> <input type="text" id="userNameRole" class="modal-input"
							name="userNameRole" readonly>
					</div>
					<div class="model-input-item">
						<label for="role-user" class="modal-label">Phân quyền:</label> <select
							id="role-account" name="roleAccount">
							<option value="1">Admin</option>
							<option value="2">Headmaster</option>
							<option value="3">Teacher</option>
							<option value="4">Office</option>
						</select>
					</div>
				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary cancel-role-account-btn btn-cancel">Hủy</button>
					<button type="submit"
						class="btn btn-primary confirm-role-account-btn">Xác nhận</button>
				</footer>
			</div>
		</form>
	</div>


	<!-- Modal delete account -->
	<div class="modal delete-account-modal">

		<form action="<%=request.getContextPath()%>/changePasswordServlet">
			<input type="hidden" name="action" value="/deleteAccount">
			<div class="modal-container delete-account-modal-container">

				<div class="icon-close js-modal-delete-account-close">
					<i class="modal-icon-close fa-solid fa-xmark"></i>
				</div>

				<header class="modal-header">Xóa tài khoản</header>

				<div class="modal-body">
					<div class="model-input-item">
						<label for="userNameRoleDelete" class="modal-label">Tên tài
							khoản:</label> <input type="text" id="userNameRoleDelete" class="modal-input"
							name="userNameRoleDelete" readonly>
					</div>
				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary cancel-role-account-btn btn-cancel">Hủy</button>
					<button type="submit"
						class="btn btn-primary confirm-role-account-btn">Xác nhận</button>
				</footer>
			</div>
		</form>
	</div>


	<!-- Modal add account -->
	<div class="modal add-account-modal">

		<form action="<%=request.getContextPath()%>/changePasswordServlet">
			<input type="hidden" name="action" value="/addAccount">
			<div class="modal-container add-account-modal-container">

				<div class="icon-close js-modal-add-account-close">
					<i class="modal-icon-close fa-solid fa-xmark"></i>
				</div>

				<header class="modal-header"> Tạo tài khoản </header>

				<div class="modal-body">
					<div class="model-input-item">
						<label for="new-username" class="modal-label">Tài khoản
							mới:</label> <input type="text" id="new-username" class="modal-input"
							placeholder="username" name="newUsername">
					</div>

					<div class="model-input-item">
						<label for="new-password" class="modal-label">Mật khẩu
							mới:</label> <input type="text" id="new-password" class="modal-input"
							placeholder="password" name="newPassword">
					</div>

					<div class="model-input-item">
						<label for="role-user" class="modal-label">Phân quyền:</label> <select
							id="role-user" name="roleUser">
							<option value="1">Admin</option>
							<option value="2">Headmaster</option>
							<option value="3">Teacher</option>
							<option value="4">Office</option>
						</select>
					</div>

				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary cancel-add-account-btn btn-cancel">Hủy</button>
					<button type="submit"
						class="btn btn-primary confirm-add-account-btn">Xác nhận</button>
				</footer>
			</div>
		</form>
	</div>



	<!-- Modal edit password -->
	<div class="modal edit-pass-modal">

		<form action="<%=request.getContextPath()%>/changePasswordServlet">
			<input type="hidden" name="action" value="/updatePass">
			<div class="modal-container edit-pass-modal-container">

				<div class="icon-close js-modal-edit-pass-close">
					<i class="modal-icon-close fa-solid fa-xmark"></i>
				</div>

				<header class="modal-header"> Đổi mật khẩu </header>

				<div class="modal-body">
					<div class="model-input-item">
						<label for="new-password" class="modal-label">UserName:</label> <input
							type="text" id="username" class="modal-input" name="username"
							readonly>
					</div>
					<div class="model-input-item">
						<label for="new-password" class="modal-label">Mật khẩu
							mới:</label> <input type="text" id="new-password" class="modal-input"
							placeholder="Mật khẩu mới" name="newPass">
					</div>

					<div class="model-input-item">
						<label for="comfirm-new-password" class="modal-label">Xác
							nhận mật khẩu mới:</label> <input type="text" id="comfirm-new-password"
							class="modal-input" placeholder="Xác nhận mật khẩu mới"
							name="cNewPass">
					</div>

				</div>

				<footer class="modal-footer">
					<button type="button"
						class="btn btn-primary cancel-edit-pass-btn btn-cancel">Hủy</button>
					<button type="submit" class="btn btn-primary confirm-edit-pass-btn">Xác
						nhận</button>
				</footer>
			</div>
		</form>
	</div>



	<script src="https://code.jquery.com/jquery-3.4.0.min.js"></script>


	<script src="./js/app.js"></script>
	<script src="./js/pagination.js"></script>
	<script>
		const currentDate = new Date();
		const day = currentDate.getDate();
		const month = currentDate.getMonth() + 1;
		const year = currentDate.getFullYear();
		const formattedDate = day + "/" + month + "/" + year;
		document.querySelectorAll('.account-last-update').forEach(
				function(item) {
					item.textContent = formattedDate;
				});
	</script>

	<script>
		const roleAcc = document.querySelectorAll('.role-user-icon')
		console.log(roleAcc)
		const modalRoleAcc = document.querySelector('.role-account-modal')
		const modalRoleAccContainer = document
				.querySelector('.role-account-modal-container')
		const closeRoleAccBtn = document
				.querySelector('.js-modal-role-account-close')
		const CanceRoleAcclBtn = document
				.querySelector('.cancel-role-account-btn')


		function HideModal() {
			modalRoleAcc.classList.remove('open')
		}
		
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
		
		roleAcc.forEach(function(item){
			item.addEventListener('click', fuction(){
				var getUserNameRole = document.getElementById('userNameRole')
				getUserNameRole.setAttribute('value',getSibling(getParent(item, '.action'),'name'))	
				modalRoleAcc.classList.add('open')
			})
		})

		closeRoleAccBtn.addEventListener('click', HideModal)
		CanceRoleAcclBtn.addEventListener('click', HideModal)
		modalRoleAcc.addEventListener('click', HideModal)
		modalRoleAccContainer.addEventListener('click', function(event) {
			event.stopPropagation()
		})
	</script>
	

	<script>
		const editPass = document.querySelector('.edit-pass')
		const modalEditPass = document.querySelector('.edit-pass-modal')
		const modalEditPassContainer = document
				.querySelector('.edit-pass-modal-container')
		const closeBtn = document.querySelector('.js-modal-edit-pass-close')
		const CancelBtn = document.querySelector('.cancel-edit-pass-btn')

		function Open() {
			modalEditPass.classList.add('open')
		}

		function Hide() {
			modalEditPass.classList.remove('open')
		}

		editPass.addEventListener('click', Open)

		closeBtn.addEventListener('click', Hide)
		CancelBtn.addEventListener('click', Hide)
		modalEditPass.addEventListener('click', Hide)
		modalEditPassContainer.addEventListener('click', function(event) {
			event.stopPropagation()
		})

		const showPassIcon = document.querySelector('.show-pass')
		const hidePassIcon = document.querySelector('.hide-pass')
		const passwordField = document.querySelector('.account-pass-text')

		showPassIcon.addEventListener('click', function() {
			passwordField.type = 'text';
			showPassIcon.classList.add("hidden")
			hidePassIcon.classList.remove("hidden")
		})

		hidePassIcon.addEventListener('click', function() {
			passwordField.type = 'password';
			showPassIcon.classList.remove("hidden")
			hidePassIcon.classList.add("hidden")
		})
	</script>

	<script>
		const addAcc = document.querySelector('.add-acc-btn')
		const modalAddAcc = document.querySelector('.add-account-modal')
		const modalAddAccContainer = document
				.querySelector('.add-account-modal-container')
		const closeAddAccBtn = document
				.querySelector('.js-modal-add-account-close')
		const CanceAddAcclBtn = document
				.querySelector('.cancel-add-account-btn')

		function OpenModal() {
			modalAddAcc.classList.add('open')
		}

		function HideModal() {
			modalAddAcc.classList.remove('open')
		}

		addAcc.addEventListener('click', OpenModal)

		closeAddAccBtn.addEventListener('click', HideModal)
		CanceAddAcclBtn.addEventListener('click', HideModal)
		modalAddAcc.addEventListener('click', HideModal)
		modalAddAccContainer.addEventListener('click', function(event) {
			event.stopPropagation()
		})
	</script>


</body>
</html>