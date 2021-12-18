<%@page import="java.text.DecimalFormat"%>
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
			<a href="Htcategory"><img src="img/12.png" style="height: 80px;    width: 160px;"></a>
		</li>
       <button href="Htcategory" class="btn btn-default dropdown-toggle"  data-toggle="dropdown"> <a  style="color: #03a9f4; font-weight: bold;">Sản phẩm</a>
   </button>
    <ul class="dropdown-menu">
    	   <%for(categorybean L:dscategory) {  %>
		  
		  <li class="nav-item">
	    <a class="nav-link" href="Htcategory?ml=<%= L.getId_category()%>"><%=L.getName()%></a>
	      </li>
	<%} %> 
    </ul>
	  <li class="nav-item">
	    <a class="nav-link" href="lienhe">Liên Hệ</a>
	</li>
	 <li class="nav-item">
	    <a class="nav-link" href="lichsucontroller">Chi tiết hóa đơn</a>
	</li>
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
            <a href="thongtin.jsp" >Xin chào: <%=kh.getHoTenKH()%> </a>
                 
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
<!-- danh muc san pham -->
   <div style="background-color: <?=($count++%2 == 0)?'#f7f9fa':''?>;">
 <div class="container">
  <h1 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">SẢN PHẨM</h1>
  <div class="container">
     <div class="row">
     <%
                     DecimalFormat f = new DecimalFormat("###,###,###");
                 %>
     <%for(productbean s: dsproduct) { %>
            <div class="col-md-3 col-6 product-item">
				<a href="htproductController?tt=<%= s.getId_product()%>"><img src="<%=s.getThumbnail()%>" style="width: 100%; height: 220px;"></a>
				<%-- <p style="font-weight: bold;"><%=s.getId_Category()%></p> --%>
				<a href=""><p style="font-weight: bold;"><%=s.getTitle()%></p></a>
				<p style="color: red; font-weight: bold;"><%=s.getDiscount()%>VND <del style="color: grey; font-weight: bold;"><%=s.getPrice()%> VND </del></p>
				
				<p><a class="btn btn-success" href="giohangcontroller?id_product=<%=s.getId_product()%>&thumbnail=<%=s.getThumbnail()%>&title=<%=s.getTitle()%>&discount=<%=s.getDiscount()%>" style="width: 100%; border-radius: 0px;"><i class="bi bi-cart-plus-fill"></i> Thêm giỏ hàng</a></p>
			</div>
			<%} %>
     </div>

     
  </div>
</div>
</div>


<!-- Start Brands -->
    <section class="bg-light py-5">
        <div class="container my-4">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Our Brands</h1>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        Lorem ipsum dolor sit amet.
                    </p>
                </div>
                <div class="col-lg-9 m-auto tempaltemo-carousel">
                    <div class="row d-flex flex-row">
                        <!--Controls-->
                        <div class="col-1 align-self-center">
                            <a class="h1" href="#multi-item-example" role="button" data-bs-slide="prev">
                                <i class="text-light fas fa-chevron-left"></i>
                            </a>
                        </div>
                        <!--End Controls-->

                        <!--Carousel Wrapper-->
                        <div class="col">
                            <div class="carousel slide carousel-multi-item pt-2 pt-md-0" id="multi-item-example" data-bs-ride="carousel">
                                <!--Slides-->
                                <div class="carousel-inner product-links-wap" role="listbox">

                                    <!--First slide-->
                                    <div class="carousel-item active">
                                           <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End First slide-->

                                    <!--Second slide-->
                                    <div class="carousel-item">
                                                    <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Second slide-->

                                    <!--Third slide-->
                                    <div class="carousel-item">
                                                <div class="row">
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                            <div class="col-3 p-md-5">
                                                <a href="#"><img class="img-fluid brand-img" src="img/abc.png" alt="Brand Logo"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--End Third slide-->

                                </div>
                                <!--End Slides-->
                            </div>
                        </div>
                        <!--End Carousel Wrapper-->

                        <!--Controls-->
                        <div class="col-1 align-self-center">
                            <a class="h1" href="#multi-item-example" role="button" data-bs-slide="next">
                                <i class="text-light fas fa-chevron-right"></i>
                            </a>
                        </div>
                        <!--End Controls-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--End Brands-->

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
<%
giohangbo gh=(giohangbo)session.getAttribute("gh");
%>
      <span class="cart_icon">
	  <span class="cart_count"><?=$count?></span>
	  
	<a href="htgiohangcontroller"> <span style="background-color:red; font-size: 20px" class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark"><%=gh.TongSP()%></span><img src="https://cdn-icons-png.flaticon.com/512/3737/3737173.png"></a>
       </span> 
<!-- Cart stop -->
<!--end  footer -->

<!-- Menu Stop --> 

</body>
</html>