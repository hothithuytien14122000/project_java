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
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
            <a class="nav-link" href="productcategory">
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
            <a class="nav-link" href="<?=$baseUrl?>order">
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
	Locale locale=new Locale("vi","VN");
	NumberFormat format = NumberFormat.getInstance(locale);
	productbo lbo=new productbo();
	response.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	 ArrayList<categorybean> dsl=(ArrayList<categorybean>)request.getAttribute("dsloai");
    ArrayList<productbean> ds=(ArrayList<productbean>)request.getAttribute("dssach");
	%>
    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4" style="margin-top: 90px;" >
<div class="row" style="margin-top: 20px;">
	<div class="col-md-12 table-responsive">
		<h3>Th??m/S???a S???n Ph???m</h3>
		<div class="panel panel-primary">
			<div class="panel-body">
				<form action="addProduct" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-md-9 col-12">
						<div class="form-group">
						  <label for="usr">T??n S???n Ph???m:</label>
						  <input required="true" type="text" class="form-control" id="usr" name="txttitle" value="">
						  <input type="text" name="id" value="" hidden="true">
						</div>
						<div class="form-group">
						  <label for="pwd">N???i Dung:</label>
						  <textarea class="form-control" rows="5" name="txtdescription" id="description"></textarea>
						</div>
						<div class="col-md-3 col-12" style="border: solid grey 1px; padding-top: 10px; padding-bottom: 10px; max-width: 100%;">
						<div class="form-group">
						  <label for="thumbnail">Thumbnail:</label>
						  <input type="file" class="form-control" id="thumbnail" name="thumbnail" accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
						  <img id="thumbnail_img" src="" style="max-height: 160px; margin-top: 5px; margin-bottom: 15px;">
						</div>

						<div class="form-group">
						  <label for="usr">Danh M???c S???n Ph???m:</label>
						  <select class="form-control" name="id_ctegory" id="category_id" required="true">
						  <%for(categorybean loai:dsl){%>
						  	<option value="<%=loai.getId_category()%>"><%=loai.getName() %></option>
                         <!--  <option selected value=""></option>
                          <option value=""></option> -->
                          <%} %>
						  </select>
						</div>
						<div class="form-group">
						  <label for="price">Gi??:</label>
						  <input required="true" type="number" class="form-control" id="price" name="txtprice" value="">
						</div>
						<div class="form-group">
						  <label for="discount">Gi???m Gi??:</label>
						  <input required="true" type="text" class="form-control" id="discount" name="txtdiscount" value="">
						</div>
					</div>
						<br><button class="btn btn-success" style="margin-left: 72%;">L??u S???n Ph???m</button>
					</div>
			
				</div>
				</form>
			</div>
		</div>
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