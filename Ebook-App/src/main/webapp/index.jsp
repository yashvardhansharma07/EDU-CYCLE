<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EduCycle: Index</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/15.jpg");
	height: 70vh;
	width: 100%;
	backround-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #d69b51;
}
</style>

</head>
<body style="background-color: #fcce95;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center" style="color:#33691e"><u>STATIONERY HUB</u></h2>
	</div>


	<!-- Start recent Item -->
	<div class="container">
		<h3 class="text-center">Recent Item</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getItemname()%></p>
						<p><%=b.getItemtypename()%></p>
						<p>

							<%
							if (b.getItemcategory().equals("Old")) {
							%>
							categories:<%=b.getItemcategory()%></p>
						<div class="row">

							<a href="view_book.jsp?bid=<%=b.getItemid()%>"
								class="btn btn-success btn-sm ml-5">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						categories:<%=b.getItemcategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-shopping-cart"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?itemid=<%=b.getItemid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-shopping-cart"></i>Add Cart</a>
							<%
							}
							%>
							<a href="view_book.jsp?bid=<%=b.getItemid()%>"
								class="btn btn-success btn-sm ml-1">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>


	</div>
	<!-- End recent Item -->

	<hr>

	<!-- Start new Item -->
	<div class="container">
		<h3 class="text-center">New Item</h3>
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBook();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">

				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getItemname()%></p>
						<p><%=b.getItemtypename()%></p>
						<p>
							categories:<%=b.getItemcategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-shopping-cart"></i>Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?itemid=<%=b.getItemid()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-shopping-cart"></i>Add Cart</a>
							<%
							}
							%>

							<a href="view_book.jsp?bid=<%=b.getItemid()%>"
								class="btn btn-success btn-sm ml-1">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>






		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>


	</div>
	<!-- End new Item -->

	<hr>


	<!-- Start old Item -->
	<div class="container">
		<h3 class="text-center">Old Item</h3>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">

				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="items/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getItemname()%></p>
						<p><%=b.getItemtypename()%></p>
						<p>
							categories:<%=b.getItemcategory()%></p>
						<div class="row">
							<a href="view_book.jsp?bid=<%=b.getItemid()%>"
								class="btn btn-success btn-sm ml-5">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>


	</div>
	<!-- End old Item -->


	<%@include file="all_component/footer.jsp"%>

</body>
</html>