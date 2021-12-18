<%@page import="bo.giohangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="java.text.Format"%>
<%@page import="bo.productbo"%>
<%@page import="bo.categorybo"%>
<%@page import="bean.productbean"%>
<%@page import="bean.categorybean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HTTSHOP xin chào</title>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
	
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
	.breadcrumb {
		background-color: transparent;
		padding: 0px;
	}
	.breadcrumb li {
		margin-right: 10px;
	}
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
    productbean pb=(productbean)request.getAttribute("p");
	%>
<!-- Menu START -->
<div class="container">
	<ul class="nav">
		<li class="nav-item" style="margin-top: 0px !important;">
			<a href="Htcategory"><img src="img/12.png" style="height: 80px;    width: 160px;"></a>
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
< <div class="col-md-4">
            <a href="">            
                <img style="border:1px solid #ccc;padding:2px;border-radius:5px;" alt="" id="avatar-img" src="<?php echo $image[0]; ?>">
        
                <img style="border:1px solid #ccc;padding:2px;border-radius:5px;width:100%;height:auto;" alt="" id="avatar-img" src="img/user.png">
          
            </a>
        </div>
        <div class="info_author col-md-8" style="margin-left: 500px;
    margin-top: -347px;
    margin-bottom: 64px;">
            <ul class="list-group vnk_label">
                <li class="list-group-item"><label for="nickname">Họ Tên:</label> </li>
                <li class="list-group-item"><label for="user_url">Website:</label> <a rel="nofollow" href=""></a></li>
                <li class="list-group-item"><label for="user_url">Facebook:</label> <a rel="nofollow" href=""></a></li>
                <li class="list-group-item"><label for="user_url">Google+:</label> <a rel="nofollow" href=""></a></li>
                <li class="list-group-item"><label for="user_url">Twitter:</label> <a rel="nofollow" href=""></a></li>
                <li class="list-group-item"><label for="description">Chia sẻ về tôi</label></li>
            </ul>
        </div>
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
	Copyright © 2000-2021 HTTSHOP Watch.
	</div>
</footer>

   <%
giohangbo gh=(giohangbo)session.getAttribute("gh");
%>
      <span class="cart_icon">
	  <span class="cart_count"><?=$count?></span>
	  
	<a href="giohang.jsp"> <span style="background-color:red; font-size: 20px" class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"></span><img src="https://cdn-icons-png.flaticon.com/512/3737/3737173.png"></a>
       </span> 

</body>
</html>