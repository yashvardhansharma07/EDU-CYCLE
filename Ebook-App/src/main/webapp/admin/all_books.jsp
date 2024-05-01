<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
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
<title>Admin : all books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<!---for showing success or failed--->
	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-primary">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Name</th>
				<th scope="col">Item type name</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list = dao.getAllBooks();
			for (BookDetails b : list) {
			%>
			<tr>
				<td><%=b.getItemid()%></td>
				<td><img src="../items/<%=b.getPhoto()%>" style="width: 50px;"></td>
				<td><%=b.getItemname()%></td>
				<td><%=b.getItemtypename()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getItemcategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getItemid()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>Edit</a> 
					<a href="../delete?id=<%=b.getItemid()%>" class="btn btn-sm btn-danger"> <i class="fas fa-trash-alt"></i>Delete</a></td>

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<div style="margin-top: 30px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
