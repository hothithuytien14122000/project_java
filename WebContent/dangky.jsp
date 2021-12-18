<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Đăng Ký</title>
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
	<div  id="DangKy" class="container">
		<div class="panel panel-primary" style="width: 480px; margin: 0px auto; margin-top: 50px; background-color: white; padding: 10px; border-radius: 5px; box-shadow: 2px 2px #9ac9f5;">
			<div class="panel-heading">
				<h2 class="text-center">Đăng Ký Tài Khoản</h2>
				<h5 style="color: red;" class="text-center"><?=$msg?></h5>
			</div>
			<div class="panel-body">
				<form action="DangKyController" method="post" onsubmit="return validateForm();">
					<div class="form-group">
					  <label for="usr">Họ & Tên:</label>
					  <input required="true" type="text" class="form-control" id="usr" name="HotenKH" value="">
					</div>
					<div class="form-group">
					  <label for="usr">Địa Chỉ:</label>
					  <input required="true" type="text" class="form-control" id="usr" name="Diachi" value="">
					</div>
					<div class="form-group">
					  <label for="usr">Số Điện Thoại:</label>
					  <input required="true" type="text" class="form-control" id="usr" name="Dienthoai" value="">
					</div>
					<div class="form-group">
					  <label for="email">Email:</label>
					  <input required="true" type="email" class="form-control" id="email" name="Email" value="">
					</div>
					<div class="form-group">
					  <label for="usr">Tên Đăng Nhâp:</label>
					  <input required="true" type="text" class="form-control" id="usr" name="TenDN" value="">
					</div>
					<div class="form-group">
					  <label for="pwd">Mật Khẩu:</label>
					  <input required="true" type="password" class="form-control" id="pwd" name="Matkhau" minlength="3">
					</div>
					<div class="form-group">
					  <label for="confirmation_pwd">Xác Minh Mật Khẩu:</label>
					  <input required="true" type="password" class="form-control" id="confirmation_pwd" name="Matkhaunhatrlai" minlength="3">
					</div>
					<p>
						<a href="login.jsp">Tôi đã có tài khoản</a>
					</p>
					<button class="btn btn-success">Đăng Ký</button>
				</form>
			</div>
		</div>
	</div>

<script type="text/javascript">
	function validateForm() {
		$pwd = $('#pwd').val();
		$confirmPwd = $('#confirmation_pwd').val();
		if($pwd != $confirmPwd) {
			alert("Mật khẩu không khớp, vui lòng kiểm tra lại")
			return false
		}
		return true
	}
</script>
</body>
</html>