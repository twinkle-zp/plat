<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%--解决静态资源路径问题--%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Wish shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/product.css">
<link rel="stylesheet" type="text/css" href="styles/product_responsive.css">
	<link rel="stylesheet" href="css/layui.css">
</head>
<body>

<div class="super_container">
	
	<!-- Header -->

	<jsp:include page="header.jsp"/>

	<!-- Menu -->

	<div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
		<div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
		<div class="logo menu_mm"><a href="#">Wish</a></div>
		<div class="search">
			<form action="#">
				<input type="search" class="search_input menu_mm" required="required">
				<button type="submit" id="search_button_menu" class="search_button menu_mm"><img class="menu_mm" src="images/magnifying-glass.svg" alt=""></button>
			</form>
		</div>
		<nav class="menu_nav">
			<ul class="menu_mm">
				<li class="menu_mm"><a href="index.html">home</a></li>
				<li class="menu_mm"><a href="#">clothes</a></li>
				<li class="menu_mm"><a href="#">accessories</a></li>
				<li class="menu_mm"><a href="#">lingerie</a></li>
				<li class="menu_mm"><a href="#">contact</a></li>
			</ul>
		</nav>
	</div>


	<!-- Product -->

	<div class="product">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="current_page">
						<ul>
							<li><a href="goods.jsp">Woman's Fashion</a></li>
							<li><a href="goods.jsp">Swimsuits</a></li>
							<li>2 Piece Swimsuits</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row product_row">

				<!-- Product Image -->
				<div class="col-lg-7">
					<div class="product_image">
						<div class="product_image_large"><img src="${goods.image}" alt=""></div>

					</div>
				</div>

				<!-- Product Content -->
				<div class="col-lg-5">
					<div class="product_content">
						<div class="product_name">${goods.name}</div>
						<div class="product_price">￥${goods.price}</div>
						<div class="rating rating_4" data-rating="4">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<!-- In Stock -->
						<div class="in_stock_container">
							<span></span>
						</div>
						<div class="product_text">
							<p>上架时间:${goods.dateString}</p>
						<!-- Product Quantity -->
						<div class="product_quantity_container">
							<span>${goods.description}</span>

						</div>
						<!-- Product Size -->
						<div class="product_size_container">
							<span></span>
							<div class="button cart_button"><a href="goods/contact?id=${goods.id}">联系卖家</a></div>
						</div>
					</div>
				</div>
			</div>



</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/product_custom.js"></script>
</body>
</html>