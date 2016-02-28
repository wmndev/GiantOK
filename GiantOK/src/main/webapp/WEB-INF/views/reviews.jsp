
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Giant Organic Kitchen</title>
<link rel="shortcut icon" href="resources/img/favicon.ico"
	type="image/icon" />
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- <link href="resources/css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" /> -->
<!-- Custom styles for this template -->
<link href="resources/css/main.css" rel="stylesheet">
<link href="resources/css/reviews.css" rel="stylesheet">
<link href="resources/css/font-awesome.min.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="resources/js/chart.js"></script>
<script src="resources/js/reviews.js"></script>
<script src="resources/js/bootstrap-rating-input.min.js"
	type="text/javascript"></script>


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
					<li><a href="home">Home</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<div class="container">
		<c:forEach var="dish" items="${dishes}">



			<div class="panel panel-default" style="margin-top: 20px;">
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-4">${dish.name}</div>
						<div class="col-xs-8">
							<span> 
							
							<c:if test="${empty dish.stats.totalRate}"><label style="width:150px;">N/R</label></c:if> 
							<c:if test="${not empty dish.stats.totalRate}"><label style="min-width:150px;">Rate: ${dish.stats.totalRate} of 5 stars</label></c:if> 
<%-- 							<input style="display: inline;" value="${dish.stats.totalRate}"
								type="number" name="your_awesome_parameter"
								id="X-some_id_${dish.id}" class="rating" data-max="5"
								data-min="1" /> --%>
								
								
								</span> <span style="margin-left: 10px;"> <a
								href="" data-id="${dish.id}" class="recipe-popover">Recipe</a>
							</span> <span style="margin-left: 10px;"> <a data-id="${dish.id}" href=""
								id="dish-reviews-link" class="reviews-popover">Reviews</a>
							</span> <span> <a href="#"
								class="dish-reviews-link btn btn-xs btn-info">Add
									review</a></span>
						</div>
					</div>

					<div class="panel panel-default hide-section margin-top-const">

						<div class="col-xs-12">
							<div id="msg-review-suc" class="alert alert-success alert-msg-suc" style="margin-top: 10px;"role="alert"></div>
							<form role="form" class="post-review-form">
								<input type="hidden" name="dish" value="${dish.id}" />
								<div class="form-group">
									<p class="help-block">Lets write a nice review</p>
									<label for="exampleInputEmail1">Name</label> <input name="name"
										type="text" class="form-control" id="name" />
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Review</label>
									<textarea id="reviewText" class="form-control textarea-review"
										name="review" rows="3"></textarea>
								</div>
								<div class="form-group">
									<label for="exampleInputFile">Rate</label> <input type="number"
										name="rate" id="rateNum" class="rating" data-max="5"
										data-min="1" data-icon-lib="fa" data-active-icon="fa-heart"
										data-inactive-icon="fa-heart-o"
										data-clearable-icon="fa-trash-o" />
								</div>

								<ul class="list-inline" style="width: 100%;">
									<li><input id="submitBtn"
										class="form-control btn btn-primary btn-submit" type="submit"></li>

									<li><a id="cancelBtn"
										class="form-control btn btn-danger btn-cancel" href="">Cancel</a></li>

								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>


		</c:forEach>
	</div>

	<div id="dishRecipeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h2 id="recipe-heading" class="form-signin-heading"></h2>
				</div>
				<div class="modal-body">
					<div class="row" style="white-space: pre-line;">
						<p id="recipe-content-p">${dish.recipe}</p>
					</div>
					<!-- /container -->
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>



	<div id="dishReviewsModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button> 
					<h2 id="reviews-heading" class="form-signin-heading"></h2>
				</div>
				<div class="modal-body">
				<div id="dishReviewsBody"></div>
					
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