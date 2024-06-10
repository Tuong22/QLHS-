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
					<div class="card account-info">
						<div class="account-info-content">
							<h3 class="account-info-heading">Thông tin tài khoản</h3>

							<div class="spacer"></div>

							<c:if test="${sessionScope.account.isAdmin == 1}">

								<table id="datatablesChangeRule" class="datatable-table">
									<thead>
										<tr>
											<th data-sortable="true" style="text-align: center;"><a
												href="#" class="datatable-sorter">STT</a></th>
											<th data-sortable="true" aria-sort="descending"
												class="datatable-descending" style="text-align: center;"><a
												href="#" class="datatable-sorter">Tên tài khoản</a></th>
											<th data-sortable="true" style="text-align: center;"><a
												href="#" class="datatable-sorter">Mật khẩu</a></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="acc" items="${DSTK}">
											<tr>
												<td style="text-align: center;"><%=i++%></td>
												<td
													class="changeRuleName-edit d-flex justify-content-between ps-4">
													${acc.username}</td>

												<td>${acc.password}<i
													class="edit-pass fa-solid fa-pen-to-square"></i>
													<i class="removeClass-icon fa fa-solid fa-trash-can"></i>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${sessionScope.account.isAdmin != 1}">
								<div class="account-info-group">
									<label><i class="account-icon fa-solid fa-user"></i>Tên
										tài khoản: </label>
									<div class="account-name">
										<p class="account-info-text">${sessionScope.account.username}</p>
									</div>

								</div>

								<div class="account-info-group">
									<label><i class="account-icon fa-solid fa-key"></i>Mật
										khẩu: </label>
									<div class="account-pass">
										<p class="account-info-text account-pass-text__hide">${sessionScope.account.password}</p>
										<p class="account-info-text account-pass-text__show hidden">admin</p>
										<div class="pass-selection">
											<i class="show-pass fa-solid fa-eye"></i> <i
												class="hide-pass fa-solid fa-eye-slash hidden"></i> <i
												class="edit-pass fa-solid fa-pen-to-square"></i>
												
										</div>
									</div>
								</div>
							</c:if>
						</div>


						<c:if test="${not empty requestScope.messageinfo}">
							<div class="alert alert-success">${requestScope.messageinfo}</div>
						</c:if>
						<c:if test="${not empty requestScope.messageerror}">
							<div class="alert alert-danger">${requestScope.messageerror}</div>
						</c:if>

						<c:if test="${not empty requestScope.messageInfoAddAccount}">
							<div class="alert alert-success">${requestScope.messageInfoAddAccount}</div>
						</c:if>

						<c:if test="${not empty requestScope.messageErrorAddAccount}">
							<div class="alert alert-danger">${requestScope.messageErrorAddAccount}</div>
						</c:if>

						<button type="button" class="btn btn-primary add-acc-btn">Tạo
							tài khoản</button>


						<footer class="account-info-footer">
							<span>Last update: </span>
							<p class="account-last-update">28/05/2024</p>
						</footer>

					</div>

				</div>
			</div>
			<!-- Account end -->

		</div>
		<!--  Main wrapper -->

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
							<option>1</option>
							<option>2</option>
							<option>3</option>
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
	<script src="./js/modalEditPass.js"></script>

	<script>
		document.addEventListener('DOMContentLoaded',
				function() {
					const addAccountModal = document
							.querySelector('.add-account-modal');
					const btnAddAcc = document.querySelector('.add-acc-btn');
					const closeIcon = document
							.querySelector('.js-modal-add-account-close');
					const cancelBtn = document
							.querySelector('.cancel-add-account-btn');
					btnAddAcc.addEventListener('click', function() {
						addAccountModal.style.display = 'block';
					});
					closeIcon.addEventListener('click', function() {
						addAccountModal.style.display = 'none';
					});
					cancelBtn.addEventListener('click', function() {
						addAccountModal.style.display = 'none';
					});
					window.addEventListener('click', function(event) {
						if (event.target == addAccountModal) {
							addAccountModal.style.display = 'none';
						}
					});
				});
	</script>


</body>
</html>