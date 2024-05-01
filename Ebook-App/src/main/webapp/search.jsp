<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Items</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #d69b51;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getBookBySearch(ch);
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="items/<%=b.getPhoto()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getItemname()%></p>
						<p><%=b.getItemtypename()%></p>
						<p>

							<%
							if (b.getItemcategory().equals("Old")) {
							%>
						    categories:<%=b.getItemcategory()%></p>
						<div class="row">
							
							  <a href="" class="btn btn-success btn-sm ml-5">View details</a> 
							  <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						categories:<%=b.getItemcategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i
								class="fas fa-shopping-cart"></i>Add Cart</a> 
								<a href="" class="btn btn-success btn-sm ml-1">View details</a>
								 <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
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
	</div>
</body>
</html>