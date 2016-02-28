 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>   Giant Organic Kitchen</title>
<link rel="shortcut icon" href="resources/img/favicon.ico" type="image/icon" />
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="resources/js/chart.js"></script>
<script src="resources/js/home.js"></script>


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- Fixed navbar -->
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">GOK</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#dailyDish">Daily Dish</a></li>
					<li><a href="reviews">Reviews</a></li>
					<li><a href="#">About</a></li>
					<li><a id="signInHref" href="#"><i class="fa fa-user"></i></a></li>
					<!-- <li ><a id="modal-trigger" href="#">Order
							Now!</a></li> -->
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>


	<div id="hello">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 centered">
					<h1>The Giant Organic Kitchen</h1>
					<h2>Dishes that make you better</h2>
				</div>
				<!-- /col-lg-8 -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /hello -->

	<div id="dailyDish" class="green">
		<div id="dailyDish" class="container">
			<div class="row">
				<div class="col-lg-5 centered">
					<img src="http://i.imgur.com/gHGjQUV.png" alt="">

				</div>

				<div class="col-lg-7 centered">

					<h3>DAILY DISH!</h3>
					<h4><strong>${dish.name}</strong></h4>
					<p>${dish.description}</p>
					<div id="peek-recipe">
					want a peek at the
					<a href="#" id="dish-recipe-link" class="recipe-popover">recipe</a>? 
					</div>
					<a class="btn btn-info" id="modal-trigger">Order Now!</a>
				</div>
			</div>
		</div>
	</div>


	<section id="contact"></section>
	<div id="social">
		<div class="container">
			<div class="row centered">
				<div class="col-xs-12">
					<div class="col-xs-4">
						<a href="#"><i class="fa fa-facebook"></i></a>
					</div>
					<div class="col-xs-4">
						<a href="#"><i class="fa fa-twitter"></i></a>
					</div>
					<div class="col-xs-4">
						<a href="#"><i class="fa fa-envelope"></i></a>
					</div>
				</div>
			</div>
		</div>
		<!-- /container -->
	</div>
	<!-- /social -->


	<div id="f">
		<div class="container">
			<div class="row">
				<p>
					Crafted with <i class="fa fa-heart"></i> by Itai Wiseman
				</p>
			</div>
		</div>
	</div>




	<div id="signInModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2 class="form-signin-heading">Please sign in</h2>
				</div>
				<div class="modal-body">
					<div class="row">

						<form class="form-signin" role="form" action="j_spring_security_check" method="post">							
							<div class="form-group">
							<label for="inputEmail" class="sr-only">Username</label> <input
								type="text" id="j_username" name="j_username" class="form-control"
								placeholder="Username" required autofocus> 
								</div>
								<div class="form-group">
								<label
								for="inputPassword" class="sr-only">Password</label> <input
								type="password" id="j_password" name="j_password" class="form-control"
								placeholder="Password" required>
								</div>

							<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
								in</button>
						</form>

					</div>
					<!-- /container -->
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<div id="dishRecipeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2 class="form-signin-heading">${dish.name} Recipe</h2>
				</div>
				<div class="modal-body">
					<div class="row" style="white-space: pre-line;"><p>${dish.recipe}</p></div>
					<!-- /container -->
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>








	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Make your reservation</h4>
				</div>
				<div class="modal-body">
				<div id="msg-suc" class="alert alert-success" role="alert"></div>
					<div class="row">
						<form id="order-form" role="form">
							<div class="col-lg-12">
	
								<div class="form-group">
									<label for="InputName">Enter Name</label>
										<input type="text" class="form-control" name="InputName"
											id="InputName" placeholder="Enter Name" required>
									
								</div>
								<div class="form-group">
									<label for="InputEmail">Enter Email</label>
									
										<input type="email" class="form-control" id="InputEmailFirst"
											name="InputEmail" placeholder="Enter Email" required>
										
									
								</div>
								<div class="form-group">
									<label for="InputEmail">Enter Date</label>
									
										<input type="date" class="form-control" id="InputDate"
											name="InputDate" placeholder="Enter Date" required> 
									
								</div>
								<div class="form-group">
									<label for="InputMessage">Any Special instructions?</label>
									
										<textarea name="InputMessage" id="InputMessage"
											class="form-control" rows="5"></textarea>
										
									
								</div>
								<button type="submit" class="btn btn-primary">Order</button>
							</div>


						</form>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/bootstrap.js"></script>






</body>
</html>
