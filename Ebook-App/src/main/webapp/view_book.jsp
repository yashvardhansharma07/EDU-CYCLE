<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #fcce95">
	<%@ include file="all_component/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
	BookDetails b=dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="items/<%=b.getPhoto() %>" style="height: 150px; width: 100px"><br>
				<h4 class="mt-4">Item Name : <span class="text-success"><%=b.getItemname() %></span> </h4>
				<h4>ItemType Name: <span class="text-success"><%=b.getItemtypename() %></span></h4>
				<h4>Category: <span class="text-success"><%=b.getItemcategory() %></span></h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getItemname() %></h2>
				
				<%
				if ("Old".equals(b.getItemcategory()))
				{
			    %>
					<h5 class="text-primary"> Contact to Seller</h5>
					<h5 class="text-primary"><i class="far fa-enevelope"></i>Email: <%=b.getEmail() %></h5>
				
				<%} %> 
				
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-3x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-3x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-truck fa-3x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				
				<%
				if ("Old".equals(b.getItemcategory()))
				{
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a> 
					<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
				</div>
				<%}else{ %>
				<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add Cart</a> 
					<a href="" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>

				</div>
				<%} %>
			</div>

		</div>
	</div>
</body>
</html>