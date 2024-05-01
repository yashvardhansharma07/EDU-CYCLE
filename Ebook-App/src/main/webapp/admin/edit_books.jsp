<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #fcce95">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Items</h4>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDetails b = dao.getBookById(id);
						%>

						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getItemid()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname"
									value="<%=b.getItemname()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Item type Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="itemtypename"
									value="<%=b.getItemtypename()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Status</label> <select
									class="form-control" id="inputState" name="status">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>

									<option value="Active">Active</option>
									<option value="Inactive">Active</option>

									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class=btnbtn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 30px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>