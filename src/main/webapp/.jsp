<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/registration.css">

</head>
<body>
    <div class="main">

        <form action="" method="POST" class="form" id="sign-up-form">
            <h3 class="heading">Đăng ký</h3>

            <div class="spacer"></div>

            <div class="form-group">
                <i class="user-icon fa-solid fa-user"></i>
                <input id="nameaccount" name="nameaccount" rules="required" type="text" placeholder="Tên tài khoản" class="form-control">
                <div></div>
                <span class="form-message"></span>
            </div>

            <div class="form-group">
                <i class="user-icon fa-solid fa-file-signature"></i>
                <input id="fullname" name="fullname" rules="required" type="text" placeholder="Họ và tên" class="form-control">
                <div></div>
                <span class="form-message"></span>
            </div>

            <div class="form-group">
                <i class="user-icon fa-solid fa-envelope"></i>
                <input id="email" name="email" rules="required|email" type="text" placeholder="Email" class="form-control">
                <span class="form-message"></span>
            </div>

            <div class="form-group">
                <i class="key-icon fa-solid fa-key"></i>
                <input id="password" name="password" rules="required|min:8" type="password" placeholder="Mật khẩu" class="form-control">
                <span class="form-message"></span>
            </div>

            <div class="form-group">
                <i class="key-icon fa-solid fa-phone"></i>
                <input id="password_confirmation" rules="required" name="password_confirmation" placeholder="Số điện thoại"
                    type="password" class="form-control">
                <span class="form-message"></span>
            </div>

            <button class="form-submit sign-in">Đăng ký tài khoản</button>
            <p class="have-Account">Nhấn vào <a href="./signIn.jsp" class="change-signin">đây</a> để đăng nhập</p>
            
        </form>

    </div>

</body>
</html>