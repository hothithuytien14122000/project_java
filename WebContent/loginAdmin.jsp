<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng Nhập</title>
	<meta charset="utf-8">
	<link rel="icon" type="image/png" href="https://tse3.mm.bing.net/th?id=OIP.t4ynHSrLoVeKiia7Vlf2lQHaHa&pid=Api&P=0&w=300&h=300" />

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url(img/backround.jpg); background-size: cover; background-repeat: no-repeat;">
	<div class="container" id="DangNhap" >
		<div class="panel panel-primary" style="width: 480px; margin: 0px auto; margin-top: 50px; background-color: white; padding: 10px; border-radius: 5px; box-shadow: 2px 2px #9ac9f5;">
			<div class="panel-heading">
				<h2 class="text-center">Đăng Nhập</h2>
				<h5 style="color: red;" class="text-center"></h5>
			</div>
			<div class="panel-body">
				<form action="adminlogin" method="post">
					<div class="form-group">
					  <label for="text">Tên DN</label>
					  <input required="true" type="text" class="form-control" id="text" name="TenDN" value="">
					</div>
					<div class="form-group">
					  <label for="pwd">Mật Khẩu:</label>
					  <input required="true" type="password" class="form-control" id="pwd" name="Matkhau" minlength="3">
					</div>
					<p>
						<a data-target="#DangKy" href="dangky.jsp">Đăng ký tài khoản mới</a>
					</p>
					<button class="btn btn-success">Đăng Nhập</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>