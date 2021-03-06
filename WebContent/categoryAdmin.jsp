
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
                   <a href="#" >Xin ch??o: <%=kh.getTenDN()%> </a> 
                </button>
                 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                 <a class="dropdown-item" href="dangxuatAdmincontroller">????ng xu???t</a>
                  </div>
                </div>
      <%  } else {    %>
	    <a class="nav-link"  data-target="#DangNhap" href="loginAdmin.jsp">????ng Nh???p</a>
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
            <a class="nav-link active" href="menuAdmin.jsp">
              <i class="bi bi-house-fill"></i>
              Dashboard
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="categorycontroller">
              <i class="bi bi-folder"></i>
              Danh M???c S???n Ph???m
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="productcontroller">
              <i class="bi bi-file-earmark-text"></i>
              S???n Ph???m
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="donhangAdmin">
              <i class="bi bi-minecart"></i>
              Qu???n L?? ????n H??ng
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<?=$baseUrl?>feedback">
              <i class="bi bi-question-circle-fill"></i>
              Qu???n L?? Ph???n H???i
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="khachhangcontroller">
              <i class="bi bi-people-fill"></i>
              Qu???n L?? Ng?????i D??ng
            </a>
          </li>
        </ul>
      </div>
    </nav>
	<%
	categorybo lbo=new categorybo();
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		ArrayList<categorybean> dsloai =(ArrayList<categorybean>)request.getAttribute("dsloai");
	    ArrayList<productbean> ds=(ArrayList<productbean>)request.getAttribute("dssach");
	%>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="margin-top: 90px;" >
      <div class="row" style="margin-top: 20px;">
	<div class="col-md-12" style="margin-bottom: 20px;">
		<h3>Qu???n L?? Danh M???c S???n Ph???m</h3>
	</div>
	<div class="col-md-6">
		<form method="post" action="index.php" onsubmit="return validateForm();">
			<div class="form-group">
			  <label for="usr" style="font-weight: bold;">T??n Danh M???c:</label>
			  <input required="true" type="text" class="form-control" id="usr" name="name" value="<?=$name?>">
			  <input type="text" name="id" value="<?=$id?>" hidden="true">
			</div>
			<button class="btn btn-success">L??u</button>
		</form>
	</div>
	<div class="col-md-6 table-responsive">
		<table class="table table-bordered table-hover" style="margin-top: 20px;">
			<thead>
				<tr>
					<th>STT</th>
					<th>T??n Danh M???c</th>
					<th style="width: 50px" colspan="2"> T??y Ch???nh</th>
				</tr>
			</thead>
			<tbody>
				<%for(categorybean L:lbo.getcategory()) {%>
<tr>

					<th><%= L.getId_category()%></th>
					<td><%= L.getName()%></td>
					<td style="width: 50px">
						<a href=""><button class="btn btn-warning">S???a</button></a>
					</td>
					<td style="width: 50px">
						<a href="EditCategorycontroller?maloai=<%=L.getId_category() %>"onclick="return confirm('b???n ch???c ch???n x??a ch???!')" class="btn btn-danger"><i class="fa fa-trash"></i> X??a</a>
					</td>
			
				</tr>
						<%} %>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	function deleteCategory(id) {
		option = confirm('B???n c?? ch???c ch???n mu???n xo?? danh m???c s???n ph???m n??y kh??ng?')
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