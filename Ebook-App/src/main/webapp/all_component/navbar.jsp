<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #ef6c00"> </div>


	<div class="container-fluid p-4 bg-light">
		<div class="row">
			<div class="col-md-3 text-primary">
				<h3 style="color:#795548">
					<i class="fas fa-book"></i>EDU-CYCLE 
				</h3>
			</div>
			<div class="col-md-6">
				<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
					<input class="form-control mr-sm-2" type="search" name="ch"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>


			<c:if test="${not empty userobj }">
				<div class="col-md-3">


					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-sign-in-alt"></i>${userobj.name }</a> <a href="logout"
						class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Logout</a>
				</div>
			</c:if>

			<c:if test="${empty userobj }">
				<div class="col-md-3">
					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-sign-in-alt"></i>Login</a> <a href="register.jsp"
						class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Register</a>
				</div>
			</c:if>
		</div>
	</div>

	<style type="text/css">
.navbar .nav-item:hover .nav-link {
	background-color: white;
	color: #ef6c00;
	border-radius: 15px;
}
</style>


	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #ef6c00;">
		<a class="navbar-brand" href="#"><i class="fas fa-home"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_recent_book.jsp"><i class="fas fa-book-open"></i>Recent
						Item</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="all_new_book.jsp"><i class="fas fa-book-open"></i>New
						Item</a></li>

				<li class="nav-item active"><a class="nav-link disabled"
					href="all_old_book.jsp"><i class="fas fa-book-open"></i>Old
						Item</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">

				<a href="checkout.jsp" class="btn btn-light"><i
					class="fas fa-cart-plus text-primary"></i>Cart</a>



				<a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				
					<i class="fas fa-phone-alt"></i>Contact Us
				</a>

			</form>
		</div>
	</nav>