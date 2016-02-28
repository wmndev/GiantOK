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
<link href="resources/css/console.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/chart.js"></script>
<script src="resources/js/console.js"></script>
<script type="text/javascript"
    src="http://viralpatel.net/blogs/demo/jquery/jquery.shorten.1.0.js"></script>


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
					<li><a href="#orders">Orders</a></li>
					<li><a class="#dishes" href="#dishes">Dishes</a></li>
					<li><a id="logoutHref" href="j_spring_security_logout">Logout</a></li>
					<!-- <li ><a id="modal-trigger" href="#">Order
							Now!</a></li> -->
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>


	<div id="orders" class="row">
		<div class="container">
			<h3 class="centered">Latest Orders</h3>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Special Instructions</th>
							<th>Supply On date</th>
						</tr>
					</thead>
					<tbody>
							<c:forEach var="orderVal" items="${orders}">
								<tr>
									<td>${orderVal.id}</td>
									<td>${orderVal.name}</td>
									<td>${orderVal.email}</td>
									<td>${orderVal.specialInructions}</td>
									<td>${orderVal.supplyDate}</td>
								</tr>
							</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div id="dishes" class="row">
			<div class="container">

				<h3 class="centered">Dishes</h3>

				<div>
					<table class="table">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Description</th>
								<th>Recipe</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dishVal" items="${dishes}">
								<tr>
									<td>${dishVal.id}</td>
									<td>${dishVal.name}</td>
									<td><div class="comment">${dishVal.description}</div></td>
									<td><div class="comment">${dishVal.recipe}</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>




				</div>
				<a id="new-dish-btn" class="btn btn-xs btn-default">New Dish</a>
			</div>

		</div>
	</div>
	<!-- container -->


	<div id="newDishModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Create a new Daily Dish</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<form id="new-dish-form" role="form">
							<div class="col-lg-12">
								<div class="form-group">
									<label for="InputName">Enter dish name</label> <input
										type="text" class="form-control" name="dishName" id="dishName"
										placeholder="Dish Name" required>
								</div>

								<div class="form-group">
									<label for="InputMessage">Dish Description</label>
									<textarea name="dishDesc" id="dishDesc" class="form-control"
										rows="5"></textarea>
								</div>

								<div class="form-group">
									<label for="InputMessage">Enter recipe</label>
									<textarea name="dishRecipe" id="dishRecipe"
										class="form-control" rows="5"></textarea>
								</div>
								<div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="InputMessage">Available from</label> <input
												type="date" class="form-control" name="dishFrom"
												id="dishFrom" placeholder="From" required>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="InputMessage">Available till</label> <input
												type="date" class="form-control" name="dishTo" id="dishTo"
												placeholder="To" required>
										</div>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">Create</button>
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


</body>
</html>
