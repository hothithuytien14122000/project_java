<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bo.productbo"%>
<%@page import="bo.categorybo"%>
<%@page import="bean.productbean"%>
<%@page import="bean.categorybean"%>
<%@page import="bean.adminbean"%>
<%@page import="java.util.ArrayList"%>

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
	<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#"><img src="img/12.png" style="height: 80px;    width: 160px;"></a>
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
                 <a class="dropdown-item" href="dangxuatAdmincontroller">Đăng xuất</a>
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
    <nav class="col-md-2 d-none d-md-block bg-light sidebar" style="margin-top: 90px;">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" href="adminlogin">
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
            <a class="nav-link" href="donhangAdmin">
              <i class="bi bi-minecart"></i>
              Quản Lý Đơn Hàng
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <i class="bi bi-question-circle-fill"></i>
              Quản Lý Phản Hồi
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="khachhangcontroller">
              <i class="bi bi-people-fill"></i>
              Quản Lý Người Dùng
            </a>
          </li>
        </ul>
      </div>
    </nav>
	<%
	Locale locale=new Locale("vi","VN");
	NumberFormat format = NumberFormat.getInstance(locale);
	productbo lbo=new productbo();
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	 ArrayList<categorybean> dss=(ArrayList<categorybean>)request.getAttribute("dsloai");
    ArrayList<productbean> ds=(ArrayList<productbean>)request.getAttribute("dssach");
	%>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="margin-top: 90px;" >
   <div class="row" style="margin-top: 20px;">
	<div class="col-md-12 table-responsive">
		<h3>Quản Lý Sản Phẩm</h3>

		<a href="htthhemsp"><button class="btn btn-success">Thêm Sản Phẩm</button></a>

		<table class="table table-bordered table-hover" style="margin-top: 20px;  overflow:inherit;">
			<thead>
				<tr>
					<th>STT</th>
					<th>Ảnh</th>
					<th>Tên Sản Phẩm</th>
					<th>Price</th>
					<th>Discount</th>
					<th>Danh Mục</th>
					<th style="width: 50px" colspan="2"> Tùy Chỉnh</th>
				</tr>
			</thead>
			<tbody>
				<%for(productbean L:lbo.getproduct()) {%>
				   
<tr>
					<th><%=L.getId_product() %></th>
					<td><img src="<%=L.getThumbnail() %>" style="height: 100px"/></td>
					<td><%=L.getTitle() %></td>
					<td><%=L.getPrice() %> VNĐ</td>
					<td><%=L.getDiscount() %> VNĐ</td>
						<td><%=L.getName() %></td>
					<td style="width: 50px">
						<a href=""><button class="btn btn-warning">Sửa</button></a>
					</td>
					<td style="width: 50px">
						<a href="deleteProductcontroller?masach=<%=L.getId_product() %>" onclick="return confirm('bạn chắc chắn xóa chứ!')" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> Xóa</a>
					</td>
				</tr>
				<%} %>

						</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	function deleteCategory(id) {
		option = confirm('Bạn có chắc chắn muốn xoá danh mục sản phẩm này không?')
		if(!option) return;




		$.post('form_api.php', {
			'id': id,
			'action': 'delete'
		}, function(data) {
			if(data != null && data != '') {
				alert(data);
				return;
			}
			location.reload()
		})
	}
</script>

    </main>
  </div>
</div>
</body>
</html>