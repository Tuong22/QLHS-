<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý học sinh</title>

<style>

.toast--success {
    border-color: #40E9C0;
}

.toast--success .toast__icon {
    color: #40E9C0;
}

.toast--error {
    border-color: #f33325;
}

.toast--error .toast__icon {
    color: #f33325;
}

.toast__icon {
    font-size: 24px;
}

.toast__icon,
.toast__close {
    padding: 0 16px;
}

.toast__body {
    flex-grow: 1;
}

.toast__title {
    font-size: 16px;
    font-weight: 600;
    color: #333;
}

.toast__msg {
    font-size: 14px;
    color: #888;
    margin-top: 6px;
    line-height: 1.5;
}

.toast__close {
    font-size: 16px;

}
</style>

</head>
<body>
	<h2>Thêm nhiều học sinh</h2>
	<c:if test="${not empty requestScope.messageErrorAge}">
		<div id="toast">
			<div class="toast toast--error">
				<div class="toast__icon">
					<i class="fa-solid fa-triangle-exclamation"></i>
				</div>
				<div class="toast__body">
					<h3 class="toast__title">Thất bại</h3>
					<p class="toast__msg">Thêm học sinh thất bại. Tuổi không hợp
						lệ.</p>
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
	<form action="<%=request.getContextPath()%>/InfoStudentsServlet">
		<input type="hidden" name="action" value="/insertListStudents">
		<div id="studentsContainer">
			<div class="student">
				<label>Tên học sinh:</label> <input type="text" name="tenHS"
					required /> <label>Giới tính:</label> <input type="text"
					name="gioiTinh" required /> <label>Năm sinh:</label> <input
					type="date" name="namSinh" required /> <label>Địa chỉ:</label> <input
					type="text" name="diaChi" required /> <label>Email:</label> <input
					type="email" name="email" required /> <br>
				<br>
			</div>
		</div>
		<button type="button" onclick="addStudent()">Thêm học sinh</button>
		<button type="submit">Lưu</button>
	</form>
	<script>
        function addStudent() {
            var container = document.getElementById("studentsContainer");
            var studentDiv = document.createElement("div");
            studentDiv.className = "student";

            studentDiv.innerHTML = `
                <label>Tên học sinh:</label>
                <input type="text" name="tenHS" required />
                <label>Giới tính:</label>
                <input type="text" name="gioiTinh" required />
                <label>Năm sinh:</label>
                <input type="date" name="namSinh" required />
                <label>Địa chỉ:</label>
                <input type="text" name="diaChi" required />
                <label>Email:</label>
                <input type="email" name="email" required />
                <button type="button" onclick="removeStudent(this)">Xóa</button>
                <br><br>
            `;
            container.appendChild(studentDiv);
        }

        function removeStudent(button) {
            var container = document.getElementById("studentsContainer");
            container.removeChild(button.parentElement);
        }
    </script>
</body>
</html>