<jsp:include page="session.jsp" />
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
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
	<%
		Connection connection = null;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HRS_DB", "sa",
				"admin@123");
		Statement statement = null;
		ResultSet resultset = null;
	%>
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
			<span class="pull-right"><a href="index.jsp">Home</a> / Update
				Hall</span>
			<h2>Update Hall Details</h2>
		</div>
	</div>
	<!-- banner -->

	<div class="container">
		<div class="spacer">
			<div class="row register">
				<form action="merchant_updateHall.jsp" method="post">

					<h4 style="color: #6bb30c;">Select Hall</h4>
					<br />
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Name
									of Hall:</label>
								<div class="col-sm-8">
									<select name="hallName" id="hallName"
										onchange="showEmp(this.value);" style="margin-top: 9%;">
										<option value="0">Select Hall Name</option>
										<%
											String userName = (String) session.getAttribute("user_Id");
											statement = connection.createStatement();
											resultset = statement.executeQuery("Select * from HallDetails where UserId = '" + userName + "' ");
											while (resultset.next()) {
										%>
										<option value="<%=resultset.getString(2)%>"><%=resultset.getString(2)%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="col-sm-3">
									<button style="margin-top: 9%;" name="submit"
										class="button btn btn-primary btn-large">Check</button>
								</div>
							</div>

						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
	<%
		String hallName = request.getParameter("hallName");
		statement = connection.createStatement();
		resultset = statement.executeQuery("Select * from HallDetails where Hall_Name = '" + hallName + "' ");
		while (resultset.next()) {
	%>
	<div class="container">
		<div class="spacer">
			<div class="row register">
				<form action="UpdateHallServlet" method="post">

					<h4 style="color: #6bb30c;">Hall Details</h4>
					
							<div class="form-group">
								<div class="col-sm-8">
									<input type="text" class="form-control" name="hall_id"
										value="<%=resultset.getString(1)%>" required="required" style="visibility:hidden"/>
								</div>
							</div>
					
					<div class="row">

						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Name of Hall:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="hall_name"
										placeholder="" value="<%=resultset.getString(2)%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Hall Type:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="hall_type">
										<option value="type">Select Type</option>
										<option value="AC Hall">AC Hall</option>
										<option value="Non AC Hall">Non AC Hall</option>
									</select> -->
									<select class="form-control" name="hall_type">
										<%
									if((resultset.getString(3)).equalsIgnoreCase("AC Hall")) {	
									%>
										<option selected value="AC Hall"><%=resultset.getString(3)%></option>
										<option value="Non AC Hall">Non AC Hall</option>
										<%
									} else {
									%>
										<option value="AC Hall">AC Hall</option>
										<option selected value="Non AC Hall"><%=resultset.getString(3)%></option>
										<% 
									}
									%>
									</select>

								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Area
									(sqft):</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="area_sqft"
										placeholder="" value="<%=resultset.getString(4)%>">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">No. of
									Rooms:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="no_of_rooms"
										value="<%=resultset.getString(5)%>">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">No. of
									Floor:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="floors">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4/4+">4 / 4+</option>
									</select> -->
									<select class="form-control" name="floors">
										<%
									if((resultset.getString(6)).equalsIgnoreCase("1")) {	
									%>
										<option selected value="1"><%=resultset.getString(6)%></option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4/4+">4/4+</option>
										<%
									} else if((resultset.getString(6)).equalsIgnoreCase("2")) {
									%>
										<option value="1">1</option>
										<option selected value="2"><%=resultset.getString(6)%></option>
										<option value="3">3</option>
										<option value="4/4+">4/4+</option>
										<%
									} else if((resultset.getString(6)).equalsIgnoreCase("3")) {
									%>
										<option value="1">1</option>
										<option value="2">2</option>
										<option selected value="3"><%=resultset.getString(6)%></option>
										<option value="4/4+">4/4+</option>
										<%
									} else if((resultset.getString(6)).equalsIgnoreCase("4/4+")) {
									%>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option selected value="4/4+"><%=resultset.getString(6)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>

						</div>
						<div class="col-md-6">

							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Kitchen
									Room: </label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="kitchen_room">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="kitchen_room">
										<%
									if((resultset.getString(7)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(7)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(7)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Parking:</label>
								<div class="col-sm-8">
									<!-- <select name="parking" class="form-control">
										<option></option>
										<option value="Two wheeler">Two Wheeler</option>
										<option value="Four wheeler">Four Wheeler</option>
										<option value="Both(two and four)">Both</option>
									</select> -->
									<select class="form-control" name="parking">
										<%
									if((resultset.getString(8)).equalsIgnoreCase("Two Wheeler")) {	
									%>
										<option selected value="Two Wheeler"><%=resultset.getString(8)%></option>
										<option value="Four wheeler">Four wheeler</option>
										<option value="Both(two and four)">Both</option>
										<%
									} else if((resultset.getString(8)).equalsIgnoreCase("Four wheeler")) {
									%>
										<option value="Two Wheeler">Two Wheeler</option>
										<option selected value="Four wheeler"><%=resultset.getString(8)%></option>
										<option value="Both(two and four)">Both</option>
										<%
									} else {
									%>
										<option value="Two Wheeler">Two Wheeler</option>
										<option value="Four wheeler">Four wheeler</option>
										<option selected value="Both(two and four)">Both</option>
										<% 
									}
									%>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Attached Lawn :</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="lawn">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="lawn">
										<%
									if((resultset.getString(9)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(9)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(9)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Comment:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="comment"
										value="<%=resultset.getString(10)%>">
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
									<!-- <select class="form-control" name="city">
										<option value="city">Select City</option>
										<option value="Amravati">Amravati</option>
										<option value="Akola">Akola</option>
										<option value="Nagpur">Nagpur</option>
										<option value="Wardha">Wardha</option>
										<option value="Yavatmal">Yavatmal</option>
									</select> -->
									<select class="form-control" name="city">
										<%
									if((resultset.getString(11)).equalsIgnoreCase("Amravati")) {	
									%>
										<option selected value="Amravati">Amravati</option>
										<option value="Akola">Akola</option>
										<option value="Nagpur">Nagpur</option>
										<option value="Wardha">Wardha</option>
										<option value="Yavatmal">Yavatmal</option>
										<%
									} else if((resultset.getString(11)).equalsIgnoreCase("Akola")) {
									%>
										<option value="Amravati">Amravati</option>
										<option selected value="Akola">Akola</option>
										<option value="Nagpur">Nagpur</option>
										<option value="Wardha">Wardha</option>
										<option value="Yavatmal">Yavatmal</option>
										<%
									} else if((resultset.getString(11)).equalsIgnoreCase("Nagpur")) {
									%>
										<option value="Amravati">Amravati</option>
										<option value="Akola">Akola</option>
										<option selected value="Nagpur">Nagpur</option>
										<option value="Wardha">Wardha</option>
										<option value="Yavatmal">Yavatmal</option>
										<%
									} else if((resultset.getString(11)).equalsIgnoreCase("Wardha")) {
									%>									
										<option value="Amravati">Amravati</option>
										<option value="Akola">Akola</option>
										<option value="Nagpur">Nagpur</option>
										<option selected value="Wardha">Wardha</option>
										<option value="Yavatmal">Yavatmal</option>
										<%
									} else if((resultset.getString(11)).equalsIgnoreCase("Yavatmal")) {
									%>									
										<option value="Amravati">Amravati</option>
										<option value="Akola">Akola</option>
										<option value="Nagpur">Nagpur</option>
										<option value="Wardha">Wardha</option>
										<option selected value="Yavatmal">Yavatmal</option>
										<% 
									}
									%>
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
								<label class="control-label col-sm-4" for="pwd">Locality:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="locality"
										value="<%=resultset.getString(12)%>">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Sub-Locality:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="sub_locality"
										value="<%=resultset.getString(13)%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Landmark:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="landmark"
										value="<%=resultset.getString(14)%>">
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
								<label class="control-label col-sm-4" for="pwd">Hall Rent</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="hall_rent"
										value="<%=resultset.getString(15)%>">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Maintenance Charge</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="maintenance"
										value="<%=resultset.getString(16)%>">
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Electricity Charge</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="electricity">
										<option value="select">Select</option>
										<option value="Include">Include</option>
										<option value="Not Include">Not Include</option>
									</select> -->
									<select class="form-control" name="electricity">
										<%
									if((resultset.getString(17)).equalsIgnoreCase("Include")) {	
									%>
										<option selected value="Include"><%=resultset.getString(17)%></option>
										<option value="Not Include">Not Include</option>
										<%
									} else {
									%>
										<option value="Include">Include</option>
										<option selected value="Not Include"><%=resultset.getString(17)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="email">Lawn Space</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="lawn_space">
										<option value="select">Select</option>
										<option value="Include">Include</option>
										<option value="Not Include">Not Include</option>
									</select> -->
									<select class="form-control" name="lawn_space">
										<%
									if((resultset.getString(18)).equalsIgnoreCase("Include")) {	
									%>
										<option selected value="Include"><%=resultset.getString(18)%></option>
										<option value="Not Include">Not Include</option>
										<%
									} else {
									%>
										<option value="Include">Include</option>
										<option selected value="Not Include"><%=resultset.getString(18)%></option>
										<% 
									}
									%>
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
								<label class="control-label col-sm-4" for="pwd">Power Backup:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="power_backup">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="power_backup">
										<%
									if((resultset.getString(19)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(19)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(19)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Lift in Building:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="lift_in_building">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="lift_in_building">
										<%
									if((resultset.getString(20)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(20)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(20)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Security:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="security">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="security">
										<%
									if((resultset.getString(21)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(21)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(21)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Maintenance Staff:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="maintenance_staff">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="maintenance_staff">
										<%
									if((resultset.getString(22)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(22)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(22)%></option>
										<% 
									}
									%>
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
									<!-- <select class="form-control" name="decoration">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="decoration">
										<%
									if((resultset.getString(27)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(27)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(27)%></option>
										<% 
									}
									%>
									</select>
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Catering
									Service:</label>
								<div class="col-sm-8">
									<!-- <select class="form-control" name="catering">
										<option value="Yes">Yes</option>
										<option value="No">No</option>
									</select> -->
									<select class="form-control" name="catering">
										<%
									if((resultset.getString(28)).equalsIgnoreCase("Yes")) {	
									%>
										<option selected value="Yes"><%=resultset.getString(28)%></option>
										<option value="No">No</option>
										<%
									} else {
									%>
										<option value="Yes">Yes</option>
										<option selected value="No"><%=resultset.getString(28)%></option>
										<% 
									}
									%>
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
										value="<%=resultset.getString(23)%>" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Mobile
									Number:</label>
								<div class="col-sm-8">
									<input type="number" class="form-control" name="mobile_no"
										value="<%=resultset.getString(24)%>" required="required" />
								</div>
							</div>

						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Email
									Id:</label>
								<div class="col-sm-8">
									<input type="email" name="email_id" class="form-control"
										value="<%=resultset.getString(25)%>" required="required" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-4" for="pwd">Address:</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="address" 
										value="<%=resultset.getString(26)%>" required="required" />
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
									value="Update" />
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
	<%
		}
	%>

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
