<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.productbo"%>
<%@page import="bo.categorybo"%>
<%@page import="bean.productbean"%>
<%@page import="bean.categorybean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HTTSHOP xin chào</title>
	<link rel="shortcut icon" href="https://tse3.mm.bing.net/th?id=OIP.t4ynHSrLoVeKiia7Vlf2lQHaHa&pid=Api&P=0&w=300&h=300">

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

	<style type="text/css">
		.nav li {
			text-transform: uppercase;
			color: #28a745;
			margin-top: 20px;
		}
		.nav li a {
			color: #03a9f4;
			font-weight: bold;
		}

		.carousel-inner img {
			height: 420px;
			width: 100%;
		}

		.product-item:hover {
			background-color: #f5f6f7;
			cursor: pointer;
			margin-bottom: 10px;
		}

		footer {
			padding-top: 20px;
		}

		footer ul {
			list-style-type: none;
			padding: 0px;
			margin: 0px;
			padding-top: 10px;
			padding-bottom: 10px;
		}

		.cart_icon {
			position: fixed;
			z-index: 999999;
			right: 0px;
			top: 45%;
		}

		.cart_icon img {
			width: 45px;
		}

		.cart_icon .cart_count {
			background-color: red;
			color: white;
			font-size: 16px;
			padding-top: 2px;
			padding-bottom: 2px
			padding-left: 10px;
			padding-right: 10px;
			font-weight: bold;
			border-radius: 12px;
			position: fixed;
			right: 40px;
		}
	</style>
</head>
<body>
<%
Locale locale=new Locale("vi","VN");
NumberFormat format = NumberFormat.getInstance(locale);
categorybo lbo=new categorybo();
productbo sbo=new productbo();
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
    ArrayList<categorybean> dscategory=(ArrayList<categorybean>)request.getAttribute("dscategory");
    ArrayList<productbean> dsproduct=(ArrayList<productbean>)request.getAttribute("dsproduct");
	%>
<!-- Menu START -->
<div class="container">
	<ul class="nav">
		<li class="nav-item" style="margin-top: 0px !important;">
			<a href="index.jsp"><img src="img/12.png" style="height: 80px;    width: 160px;"></a>
		</li>
		
	   <%for(categorybean L:lbo.getcategory()) {  %>
		  
		  <li class="nav-item">
	    <a class="nav-link" href="Htcategory?ml=<%= L.getId_category()%>"><%=L.getName()%></a>
	      </li>
	<%} %> 
	
	
	<form action="Htcategory"  method="post" class="form-inline my-2 my-lg-0">
      <input name="txtfind" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
     <li class="nav-item">
       <%
      			khachhangbean kh= (khachhangbean)session.getAttribute("kh");
      	
           if(kh!=null){
     		 %>
     		     <div class="btn-group">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <a href="#" >Xin chào: <%=kh.getHoTenKH()%> </a> 
                </button>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                 <a class="dropdown-item" href="DangXuatController">Đăng xuất</a>
                  </div>
                </div>
      <%  } else {    %>
	    <a class="nav-link"  data-target="#DangNhap" href="login.jsp">Đăng Nhập</a>
	   <%  if(session.getAttribute("kt")!=null && session.getAttribute("kt").toString().equals("0")){%>
             		 <script>alert('Dang nhap sai');</script>
              <%} %>
           <%} %>
	</li>
  </ul>
	</ul>
</div>	
<!-- end header	 -->

<!-- banner -->
<div id="demo" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://cdna.artstation.com/p/assets/images/images/031/586/906/large/murugendra-hiremath-00001212.jpg?1604034460" alt="Los Angeles">
    </div>
    <div class="carousel-item">
      <img src="https://www.donghohanghieu.com/wp-content/uploads/2016/03/Raymond-weil.jpg" alt="Chicago">
    </div>
    <div class="carousel-item">
      <img src="https://iwatch24h.files.wordpress.com/2017/10/cropped-banner-dong-ho.jpg" alt="Chicago">
    </div>
  </div>

   <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
<!-- banner stop -->

<div class="container" style="margin-top: 20px; margin-bottom: 20px;">
	<form method="post" onsubmit="return completeCheckout();">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
			  <input required="true" type="text" class="form-control" id="usr" name="fullname" placeholder="Nhập họ * tên">
			</div>
			<div class="form-group">
			  <input required="true" type="email" class="form-control" id="email" name="email" placeholder="Nhập email">
			</div>
			<div class="form-group">
			  <input required="true" type="tel" class="form-control" id="phone" name="phone" placeholder="Nhập sđt">
			</div>
			<div class="form-group">
			  <input required="true" type="text" class="form-control" id="address" name="address" placeholder="Nhập địa chỉ">
			</div>
			<div class="form-group">
			  <label for="pwd">Nội dung:</label>
			  <textarea class="form-control" rows="3"></textarea>
			</div>
		</div>
		<div class="col-md-6">
			<table class="table table-bordered">
			<tr>
				<th>STT</th>
				<th>Tiêu Đề</th>
				<th>Giá</th>
				<th>Số Lượng</th>
				<th>Tổng Giá</th>
			</tr>
			<% if(session.getAttribute("gh")!=null)
						{ 
							giohangbo gh1=(giohangbo)session.getAttribute("gh");
							for(giohangbean g:gh1.ds ){%> 

          <tr>
			<td><%=g.getId_product()%></td>
			<td><%=g.getTitle()%></td>
			<td><%=(format.format(g.getDiscount()))%> VND</td>
			<td>
				<%=g.getSoLuong()%>
			</td>
			<td><%=(format.format(g.getDiscount()*g.getSoLuong()))%>VND</td>
				<%} %>

		</tr>
				
		</table>
	     <label> Tổng Tiền: <%= (format.format(gh1.TongTien() ))%> VNĐ</label> <hr style="margin-top:-2px">
		<a href="checkout.php"><button class="btn btn-success" style="border-radius: 0px; font-size: 26px; width: 100%;">THANH TOÁN</button></a>
		</div>
						
		<%} %>
	</div>
</form>
</div>

<script type="text/javascript">
	function completeCheckout() {
		$.post('api/ajax_request.php', {
			'action': 'checkout',
			'fullname': $('[name=fullname]').val(),
			'email': $('[name=email]').val(),
			'phone_number': $('[name=phone]').val(),
			'address': $('[name=address]').val(),
			'note': $('[name=note]').val()
		}, function() {
			window.open('complete.php', '_self');
		})

		return false;
	}
</script>


   <!-- 	footer -->
<footer style="background-color: #81d742 !important;">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h4>GIỚI THIỆU</h4>
				<ul>
					<li>HTT shop xin chào</li>
					<li><i class="bi bi-mailbox2"></i>hothithuytien14122000@gmail.com</li>
					<li><i class="bi bi-telephone-fill"></i> 0337705797</li>
					<li><i class="bi bi-map-fill"></i>Phú Lương - Phú Vang - Thừa Thiên Huế</li>
					<li>Nhà phân phối độc quyền các thương hiệu đồng hồ, kính mắt, bút ký nổi tiếng thế giới: Epos Swiss, Atlantic Swiss, Diamond D, Philippe Auguste, Jacques Lemans, Citizen, Aries Gold, dây da đồng hồ, dây đồng hồ đeo tay.</li>
				</ul>
			</div>
			<div class="col-md-4">
				<h4>SẢN PHẨM MỚI NHẤT</h4>
				<ul>
					<li>HTT shop xin chào</li>
					<li>Email: hothithuytien14122000@gmail.com</li>
					<li>Phone: 0337705797</li>
					<li>Nhà phân phối độc quyền các thương hiệu đồng hồ, kính mắt, bút ký nổi tiếng thế giới: Epos Swiss, Atlantic Swiss, Diamond D, Philippe Auguste, Jacques Lemans, Citizen, Aries Gold, dây da đồng hồ, dây đồng hồ đeo tay.</li>
				</ul>
			</div>
			<div class="col-md-4">
				<h4>TIN TỨC MỚI NHẤT</h4>
				<ul>
					<li>HTT shop xin chào</li>
					<li>hothithuytien14122000@gmail.com</li>
					<li>Phone: 0337705797</li>
					<li>Nhà phân phối độc quyền các thương hiệu đồng hồ, kính mắt, bút ký nổi tiếng thế giới: Epos Swiss, Atlantic Swiss, Diamond D, Philippe Auguste, Jacques Lemans, Citizen, Aries Gold, dây da đồng hồ, dây đồng hồ đeo tay.</li>
				</ul>
			</div>
		</div>
	</div>
	<div style="background-color: #3f9609; width: 100%; text-align: center; padding: 20px;">
	Copyright © 2008-2020 HTTSHOP Watch.
	</div>
</footer>
<!-- <script type="text/javascript">
	function addCart(productId, num) {
		$.post('api/ajax_request.php', {
			'action': 'cart',
			'id': productId,
			'num': num
		}, function(data) {
			location.reload()
		})
	}
</script> -->
<!-- Cart start -->

<!-- Cart stop -->
<!--end  footer -->
     <%
giohangbo gh=(giohangbo)session.getAttribute("gh");
%>
      <span class="cart_icon">
	  <span class="cart_count"><?=$count?></span>
	  
	<a href="giohang.jsp"> <span style="background-color:red; font-size: 20px" class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><%=gh.TongSP()%></span><img src="https://cdn-icons-png.flaticon.com/512/3737/3737173.png"></a>
       </span> 
<!-- Menu Stop --> 

</body>
</html>