<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>



<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>Stock Trader</title>
</head>
<body class="mb-5">
	<div class="container mt-4">



		<div class="jumbotron jumbotron-fluid" style="padding: 2%">
			<div class="container">
				<h2 class="display-4">Trading_point</h2>
				<hr>
				<p class="lead">A seamless experience to stock trading and long
					term investment.</p>

				<p class="lead">
					<a class="btn btn-primary btn-lg" href="#">Learn
						more</a>
				</p>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-3 mt-5">
				<div class="list-group">
					<h5>
						<a style="pointer-events: none; cursor: default;" href="#"
							class="list-group-item list-group-item-action active">Menu</a>
					</h5>
					<a href="<c:url value="/home"></c:url>"
						class="list-group-item list-group-item-action list-group-item-secondary">Stocks</a>
					<a href="<c:url value="/stocks"></c:url>"
						class="list-group-item list-group-item-action list-group-item-secondary">Buy/Sell
						stocks</a> <a href="<c:url value="/brokerage"></c:url>"
						class="list-group-item list-group-item-action list-group-item-secondary">Brokerage
						Calculator</a>
				</div>
			</div>
			<div class="col-md-9">

				<c:if test="${name=='nifty'}">
					<br>
					<form action="sendData" method="post">
						<div class="form-group">
							<input  class="form-control"
								placeholder="search a stock" autocomplete="off" name="stock" />
						</div>

						<div class="form-group text-center">

							<button class="btn btn-outline-primary">Search</button>

						</div>

					</form>


					<br>
					<br>

					<div class="row">
						<div class="col-sm-6 d-flex align-items-stretch">


							<div class="card" style="width: 18rem;">
								<img class="card-img-top pd-4"
									src="https://www1.nseindia.com/global/resources/images/Nifty50_Logo_image.jpg"
									alt="Card image cap">
								<div class="card-body">

									<p class=" card-text">Price : ${price_nifty}</p>

									<p class="card-text">Open : ${open_nifty}</p>
									<p class="card-text">High : ${high_nifty}</p>
									<p class="card-text">Low : ${low_nifty}</p>
									<c:if test="${not empty change_nifty}">
										<p class="card-text">Change : ${change_nifty}</p>
									</c:if>
									<p class="card-text">Exchange : NSE</p>



									<div class="text-center">
										<a href="https://www1.nseindia.com/"
											class="btn btn-primary text-center" target="_blank">More
											Info</a>

									</div>




									<br>

									<div class="text-center">
										<p>
											<small>${disc}</small><Small style="color: red;">Disclaimer</Small>
										</p>


									</div>




								</div>
							</div>






						</div>
						<div class="col-sm-6">
							<div class="card" style="width: 18rem;">
								<img class="card-img-top pd-4"
									src="https://socialimages.sakalmediagroup.com/sakaltimes-prod/s3fs-public/news-story/cover-images/1sensex_49.jpg"
									alt="sensex image">
								<div class="card-body">

									<p class="card-text">Price : ${price_sensex}</p>
									<p class="card-text">Open : ${open_sensex}</p>
									<p class="card-text">High : ${high_sensex}</p>
									<p class="card-text">Low : ${low_sensex}</p>
									<c:if test="${not empty change_sensex}">
										<p class="card-text">Change : ${change_sensex}</p>
									</c:if>

									<p class="card-text">Exchange : BSE</p>


									<div class="text-center">
										<a href="https://www.bseindia.com/"
											class="btn btn-primary text-center" target="_blank">More
											Info</a>
									</div>
									<br>

									<div class="text-center">
										<p>
											<small>${disc}</small><Small style="color: red;">Disclaimer</Small>
										</p>
									</div>
								</div>
							</div>

						</div>

					</div>





				</c:if>

				<c:if test="${name=='stock'}">


					<div class="row justify-content-center">
						<div class="card" style="width: 18rem;">
							<div class="card-body">

								<div class="card-header">
									<h5 class="text-center" style="text-transform: uppercase;">${s}</h5>

								</div>
								<br>

								<c:if test="${empty price_stock}">
									<p class="card-text text-center">Stock not found</p>
								</c:if>

								<c:if test="${not empty price_stock}">
									<p class="card-text">Price : ${price_stock}</p>
									<p class="card-text">Open : ${open_stock}</p>
									<p class="card-text">High : ${high_stock}</p>
									<p class="card-text">Low : ${low_stock}</p>
									<p class="card-text">Prev. close : ${close_stock}</p>
									
									<p class="card-text">P/E ratio : ${PE_ratio}</p>
									<p class="card-text">52-wk high: ${high_ultimate}</p>
									<p class="card-text">52-wk low : ${low_ultimate}</p>
									<c:if test="${not empty change_stock}">
										<p class="card-text">Change : ${change_stock}</p>
									</c:if>

								</c:if>

								<br>


							</div>
						</div>
					</div>

					<br>

					<div class="form-group text-center">

						<a href="<c:url value="/home"></c:url>"
							class="btn btn-outline-primary">Go Back</a>

					</div>

				</c:if>

				<c:if test="${page=='Buy/Sell stocks'}">
					<h1 class="text-center">
						<span style="color: #47b83e;">Buy</span> / <span
							style="color: #c2261b;">sell</span> stocks
					</h1>
					<hr>
					<br>
					<div class="row justify-content-center">


						<div class="card" style="width: 40rem;">
							<div class="card-body">
								<form>
									<div class="form-row">
										<div class="form-group col-md-4">
											<label>Stock name</label> <input type="text"
												class="form-control">
										</div>
										<div class="form-group col-md-4">
											<label>Quantity</label> <input type="number"
												class="form-control">
										</div>

										<div class="form-group col-md-4">
											<label for="inputState">Transition type</label> <select
												id="inputState" class="form-control">
												<option>Buy</option>
												<option>Sell</option>
											</select>
										</div>
										<br>
										<div class="form-check">
											<input class="form-check-input" type="radio"
												name="exampleRadios" id="exampleRadios1" value="option1"
												checked> <label class="form-check-label"
												for="exampleRadios1"> NSE</label>
										</div>
										<div class="form-check ml-2">
											<input class="form-check-input" type="radio"
												name="exampleRadios" id="exampleRadios2" value="option2">
											<label class="form-check-label" for="exampleRadios2">
												BSE</label>
										</div>
										<br> <br>
										<div class="form-group col-md-10">
											<label for="inputState">Product</label> <select
												id="inputState" class="form-control">
												<option>Delivery</option>
												<option>Intraday</option>
											</select>
										</div>
										<div class="form-group col-md-6">
											<label for="inputState">Complexity</label> <select
												id="inputState" class="form-control">
												<option>CO</option>
												<option>BO</option>
												<option>AMO</option>
												<option>SIMPLE</option>

											</select>
										</div>


									</div>
									<button type="submit" class="btn btn-primary">Execute
										order</button>
								</form>
							</div>
						</div>
					</div>

				</c:if>
				<c:if test="${page=='brokerage'}">
					<div class="text-center">
						<h1>Brokerage calculator</h1>

						<hr>
					</div>
					<br>
					<div class="row">
						<div class="col-sm-6">
							<div class="card" style="width: 18rem;">
								<div class="card-header text-center">
									<h4>Intraday equity</h4>

								</div>

								<div class="card-body">
									<form action="sendBrokerage" method="post">
										<div class="form-row">
											<div class="form-group col-md-4">
												<label for="inputEmail4">BUY</label> <input type="number"
													name="buy" class="form-control" value="${buy}" required />
											</div>
											<div class="form-group col-md-4">
												<label for="inputPassword4">SELL</label> <input
													type="number" name="sell" class="form-control"
													value="${sell}" required >
											</div>
											<div class="form-group col-md-4">
												<label for="inputEmail4">QUANTITY</label> <input
													type="number" name="quantity" class="form-control"
													id="inputEmail4" value="${quantity}" required >
											</div>
											<div class="form-group col-md-12">
												<label for="inputState">Exchange</label> <select
													class="form-control">
													<option selected>NSE</option>
													<option>BSE</option>
												</select>
											</div>
										</div>


										<p>
											Turnover<span style="float: right;">${turnover}</span>
										</p>
										<hr>
										<p>
											Brokerage<span style="float: right;">${br}</span>
										</p>
										<hr>
										<p>
											SST tax<span style="float: right;">${sst}</span>
										</p>
										<hr>
										<p>
											Exchange charges<span style="float: right;">${ec}</span>
										</p>
										<hr>
										<p>
											Clearing charges<span style="float: right;">${c}</span>
										</p>
										<hr>
										<p>
											GST<span style="float: right;">${gst}</span>
										</p>
										<hr>
										<p>
											Total tax<span style="float: right;">${total}</span>
										</p>
										<hr>
										<p>
											Point to breakeven<span style="float: right;">${p}</span>
										</p>
										<hr>

										<br> <br>

										<p>
											<strong>Net profit or loss</strong><span style="float: right;"><strong>${pl}</strong></span>
										</p>


										<button type="submit" class="btn btn-primary">Calculate</button>

									</form>


								</div>
							</div>



						</div>
						<div class="col-sm-6">
							<div class="card" style="width: 18rem;">
								<div class="card-header text-center">
									<h4>Delivery equity</h4>

								</div>

								<div class="card-body">
									<form action="sendDeliveryBrokerage" method="post">
										<div class="form-row">
											<div class="form-group col-md-4">
												<label for="inputEmail4">BUY</label> <input type="number"
													name="buy" class="form-control" value="${buy1}" required />
											</div>
											<div class="form-group col-md-4">
												<label for="inputPassword4">SELL</label> <input
													type="number" name="sell" class="form-control"
													value="${sell1}" required >
											</div>
											<div class="form-group col-md-4">
												<label for="inputEmail4">QUANTITY</label> <input
													type="number" name="quantity" class="form-control"
													id="inputEmail4" value="${quantity1}"required >
											</div>
											<div class="form-group col-md-12">
												<label for="inputState">Exchange</label> <select
													class="form-control">
													<option selected>NSE</option>
													<option>BSE</option>
												</select>
											</div>
										</div>


										<p>
											Turnover<span style="float: right;">${turnover1}</span>
										</p>
										<hr>
										<p>
											Brokerage<span style="float: right;">${br1}</span>
										</p>
										<hr>
										<p>
											SST tax<span style="float: right;">${sst1}</span>
										</p>
										<hr>
										<p>
											Exchange charges<span style="float: right;">${ec1}</span>
										</p>
										<hr>
										<p>
											Clearing charges<span style="float: right;">${c1}</span>
										</p>
										<hr>
										<p>
											GST<span style="float: right;">${gst1}</span>
										</p>
										<hr>
										<p>
											Total tax<span style="float: right;">${total1}</span>
										</p>
										<hr>
										<p>
											Point to breakeven<span style="float: right;">${p1}</span>
										</p>
										<hr>

										<br> <br>

										<p>
											<strong>Net profit or loss</strong><span style="float: right;"><strong>${pl1}</strong></span>
										</p>


										<button type="submit" class="btn btn-primary">Calculate</button>

									</form>


								</div>
							</div>



						</div>











					</div>

				</c:if>



			</div>

		</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>