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
<body style="background-color:#fcce95">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
    </c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Items</h4>
          <!---for showing success or failed--->
                        <c:if test="${not empty succMsg}">
                        <p class="text-center text-success">${succMsg }</p>
                        <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        
                        <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                        </c:if>
                        
						<form action="../add_books" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Item type Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="itemtypename">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Categories</label> <select
									class="form-control" id="inputState" name="categories">
									<option selected>---select---</option>
									<option value="New">New</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Status</label> <select
									class="form-control" id="inputState" name="status">
									<option selected>---select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" class="form-control" id="exampleFormControlFile1"
									name="bimg">
							</div>
							<button type="submit" class=btn btn-primary">Add</button>
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