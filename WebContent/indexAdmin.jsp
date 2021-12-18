<%@page import="bean.adminbean"%>
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
<title>HTTshopAdmin</title>

	<title>HTTshopAdmin</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="icon" type="image/png" href="https://tse3.mm.bing.net/th?id=OIP.t4ynHSrLoVeKiia7Vlf2lQHaHa&pid=Api&P=0&w=300&h=300" />

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="<?=$baseUrl?>../assets/css/dashboard.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">HTTSHOP</a>
  	<form action="Htcategory"  method="post" class="form-inline my-2 my-lg-0">
      <input name="txtfind" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
   	<%
      			adminbean kh= (adminbean)session.getAttribute("kh");
      	
           if(kh!=null){
     		 %>
     		     <div class="btn-group">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   <a href="#" >Xin chào: <%=kh.getTenDN()%> </a> 
                </button>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                 <a class="dropdown-item" href="DangXuatController">Đăng xuất</a>
                  </div>
                </div>
      <%  } else {    %>
	    <a class="nav-link"  data-target="#DangNhap" href="loginAdmin.jsp">Đăng Nhập</a>
	   <%  if(session.getAttribute("kt")!=null && session.getAttribute("kt").toString().equals("0")){%>
             		 <script>alert('Dang nhap sai');</script>
              <%} %>
           <%} %>
    </li>
  </ul>
</nav>	
<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="<?=$baseUrl?>">
              <i class="bi bi-house-fill"></i>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="categorycontroller">
              <i class="bi bi-folder"></i>
              Danh Mục Sản Phẩm
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="productcontroller">
              <i class="bi bi-file-earmark-text"></i>
              Sản Phẩm
            </a>
          </li>
         <li class="nav-item">
            <a class="nav-link" href="productcontroller">
              <i class="bi bi-file-earmark-text"></i>
              Sản Phẩm
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=$baseUrl?>feedback">
              <i class="bi bi-question-circle-fill"></i>
              Quản Lý Phản Hồi
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=$baseUrl?>user">
              <i class="bi bi-people-fill"></i>
              Quản Lý Người Dùng
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
       <!-- END -->
    </main>
  </div>
</div>
</body>
</html>