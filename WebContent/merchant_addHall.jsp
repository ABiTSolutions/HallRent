<jsp:include page="session.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Add - Hall Renting Service</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="assets/css/font-awesome.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">

<link href="assets/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="assets/css/pages/dashboard.css" rel="stylesheet">
<link href="assets/css/pages/signin.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="assets/style.css" />
<script src="assets/bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.js"></script>
<script src="assets/script.js"></script>



<!-- Owl stylesheet -->
<link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
<script src="assets/owl-carousel/owl.carousel.js"></script>
<!-- Owl stylesheet -->


<!-- slitslider -->
<link rel="stylesheet" type="text/css"
	href="assets/slitslider/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="assets/slitslider/css/custom.css" />
<script type="text/javascript"
	src="assets/slitslider/js/modernizr.custom.79639.js"></script>
<script type="text/javascript"
	src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
<script type="text/javascript"
	src="assets/slitslider/js/jquery.slitslider.js"></script>
<!-- slitslider -->

</head>
<body>

	<!-- Header Starts -->
	<div class="navbar-wrapper">

		<div class="navbar-inverse" role="navigation">
			<div class="container">
				<div class="navbar-header">


					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>


				<!-- Nav Starts -->
				<div class="navbar-collapse  collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="about.jsp">About</a></li>
						<li><a href="contact.jsp">Contact</a></li>
						<li><a href="index.jsp">Logout</a></li>
					</ul>
				</div>
				<!-- #Nav Ends -->

			</div>
		</div>

	</div>
	<!-- #Header Starts -->


	<div class="container">

		<!-- Header Starts -->
		<div class="header">
			<h1 style="color: #514b4b;">Hall Renting Service</h1>
			<!-- <a href="index.php"><img src="images/logo.png" alt="Realestate"></a>

              <ul class="pull-right">
                <li><a href="buysalerent.php">Buy</a></li>
                <li><a href="buysalerent.php">Sale</a></li>         
                <li><a href="buysalerent.php">Rent</a></li>
              </ul> -->
		</div>
		<!-- #Header Starts -->
	</div>


	<!-- banner -->
	<div class="inside-banner">
		<div class="container">
			<span class="pull-right"><a href="index.jsp">Home</a> / Add
				Hall</span>
			<h2>Add Hall</h2>
		</div>
	</div>
	<!-- banner -->

	<div class="container">
		<div class="spacer">
			<div class="row register">
				<form action="AddHallServlet" method="post">
					<%
						String status = (String) request.getAttribute("checkIt");

						if (status != null) {
							if (status.equals("regSuccess")) {
					%>
					<h2>
						<p style="color: green">Details Successfully Posted...!!</p>
					</h2>
					<%
						}
						}
					%>
					<h4 style="color: #6bb30c;">Hall Details</h4>
					<br />
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Name
									of Hall:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="hall_name"
										placeholder="" value="">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Hall
									Type:</label>
								<div class="col-sm-8">
									<select class="form-control" name="hall_type">
										<option value="type">Select Type</option>
										<option value="AC Hall">AC Hall</option>
										<option value="Non AC Hall">Non AC Hall</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Area
									(sqft):</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="area_sqft"
										placeholder="" value="">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">No. of
									Rooms:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="no_of_rooms"
										value="">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">No. of
									floor:</label>
								<div class="col-sm-8">
									<select class="form-control" name="floors">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4/4+">4 / 4+</option>
									</select>
								</div>
							</div>

						</div>
						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Kitchen
									Room: </label>
								<div class="col-sm-8">
									<select class="form-control" name="kitchen_room">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Parking:</label>
								<div class="col-sm-8">
									<select name="parking" class="form-control">
										<option></option>
										<option value="Two wheeler">Two Wheeler</option>
										<option value="Four wheeler">Four Wheeler</option>
										<option value="Both(two and four)">Both</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Attached
									Lawn :</label>
								<div class="col-sm-8">
									<select class="form-control" name="lawn">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Comment:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="comment" value="">
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>

					<h4 style="color: #6bb30c;">Property Address</h4>
					<br />
					<div class="row">

						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">City</label>
								<div class="col-sm-8">
									<select class="form-control" name="city">
										<option value="city">Select City</option>
										<option value="Amravati">Amravati</option>
										<option value="Akola">Akola</option>
										<option value="Nagpur">Nagpur</option>
										<option value="Wardha">Wardha</option>
										<option value="Yavatmal">Yavatmal</option>
									</select>
								</div>
							</div>
							<!-- <div class="form-group">
					<label class="control-label col-sm-4" for="pwd">Locality:</label>
					<div class="col-sm-8">
					  <select class="form-control" name="locality">
  						<option value="locality">Select Locality</option>
						<option value="Badnera Road">Badnera Road</option>
						<option value="Central Amravati">Central Amravati</option>
						<option value="Paratwada Road">Paratwada Road</option>
						<option value="Old Bypass Road">Old Bypass Road</option>
					  </select>
					</div>
				  </div> -->
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Locality:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="locality"
										value="">
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Sub-Locality:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="sub_locality"
										value="">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Landmark:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="landmark"
										value="">
								</div>
							</div>

						</div>

						<div class="clearfix"></div>
					</div>

					<h4 style="color: #6bb30c;">Rent Details</h4>
					<br />
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Hall
									Rent</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="hall_rent"
										value="">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Maintenance
									Charge</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="maintenance"
										value="">
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Electricity
									Charge</label>
								<div class="col-sm-8">
									<select class="form-control" name="electricity">
										<option value="Include">Include</option>
										<option value="Not Include">Not Include</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Lawn
									Space</label>
								<div class="col-sm-8">
									<select class="form-control" name="lawn_space">
										<option value="Include">Include</option>
										<option value="Not Include">Not Include</option>
									</select>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>

					<h4 style="color: #6bb30c;">Services</h4>
					<br />
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Power
									Backup:</label>
								<div class="col-sm-8">
									<select class="form-control" name="power_backup">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Lift in
									building:</label>
								<div class="col-sm-8">
									<select class="form-control" name="lift_in_building">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Security:</label>
								<div class="col-sm-8">
									<select class="form-control" name="security">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Maintenance
									Staff:</label>
								<div class="col-sm-8">
									<select class="form-control" name="maintenance_staff">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>

					<h4 style="color: #6bb30c;">Add-On Services</h4>
					<br />
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Decoration:</label>
								<div class="col-sm-8">
									<select class="form-control" name="decoration">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Catering
									Service:</label>
								<div class="col-sm-8">
									<select class="form-control" name="catering">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>

					<h4 style="color: #6bb30c;">Contact Info</h4>
					<br />
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Name:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="contact_name"
										value="" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Mobile
									Number:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="mobile_no"
										value="" required="required" />
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Email
									Id:</label>
								<div class="col-sm-8">
									<input type="email" name="email_id" class="form-control"
										value="" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Address:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="address" value=""
										required="required" />
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
					<div class="row">

						<div class="form-group">
							<div class="col-sm-12">
								<input style="float: none; margin-left: 44.5%" type="submit"
									name="button" class="button btn btn-primary btn-large"
									value="Post >>" />
							</div>
						</div>
					</div>
				</form>
				<form action="dashboard_merchant.jsp">
					<div class="col-sm-12">
						<input style="float: none; margin-left: 44.5%" name="button"
							type="submit" class="button btn btn-primary btn-large"
							value="<< Back" />
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- /extra -->
	<jsp:include page="footer.jsp" />
	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-1.7.2.min.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="assets/js/base.js"></script>

</body>
</html>
