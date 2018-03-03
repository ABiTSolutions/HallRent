<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register | Hall Renting Service</title>
<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

 	<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" />
  <link rel="stylesheet" href="assets/style.css"/>
  <script src="assets/bootstrap/js/jquery-1.9.1.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
  <script src="assets/script.js"></script>



<!-- Owl stylesheet -->
<link rel="stylesheet" href="assets/owl-carousel/owl.carousel.css">
<link rel="stylesheet" href="assets/owl-carousel/owl.theme.css">
<script src="assets/owl-carousel/owl.carousel.js"></script>
<!-- Owl stylesheet -->


<!-- slitslider -->
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/slitslider/css/custom.css" />
    <script type="text/javascript" src="assets/slitslider/js/modernizr.custom.79639.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.ba-cond.min.js"></script>
    <script type="text/javascript" src="assets/slitslider/js/jquery.slitslider.js"></script>
<!-- slitslider -->

</head>
<body>

<div class="navbar-wrapper">

        <div class="navbar-inverse" role="navigation">
          <div class="container">
            <div class="navbar-header">


              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

            </div>


            <!-- Nav Starts -->
            <div class="navbar-collapse  collapse">
              <ul class="nav navbar-nav navbar-right">
               <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li class="active"><a href="contact.jsp">Contact</a></li>
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
    <span class="pull-right"><a href="index.jsp">Home</a> | Register</span>
    <h2>Register</h2>
</div>
</div>
<!-- banner -->


<div class="container">
<div class="spacer">
<div class="row register">
  <div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 ">

          <form class="" role="form" action="RegistrationServlet" method="post">	
          
          	<div class="login-fields" style="margin-left: 10%">
										<%
											String status = (String) request.getAttribute("checkIt");

											if (status != null) {
												if (status.equals("registered")) {
										%>
										<h2>
											<p style="color: red">Username Already
												Registered!</p>
										</h2>
										<%
											} else if (status.equals("regSuccess")) {
										%>
										<h2>
											<p style="color: green">Successfully Registered...!!</p>
										</h2>
										<%
											}
											}
										%>
          	
                <input type="text" class="form-control" placeholder="Full Name" name="name" required="required">
                <input type="email" class="form-control" placeholder="Enter Email" name="email" required="required">
                <input type="number" class="form-control" placeholder="Enter Contact Number" name="contactNo">  
                <input type="text" class="form-control" placeholder="Enter Username" name="userName" required="required">
                <input type="password" class="form-control" placeholder="Enter Password" name="password" required="required">
                <input type="password" class="form-control" placeholder="Confirm Password" name="confirmPassword" required="required">
                	<select class="form-control" name="role">
                		<option value="role">Select Role</option>
						<option value="merchant">Merchant</option>
						<option value="customer">Customer</option>
					  </select>

                <textarea rows="6" class="form-control" placeholder="Address" name="address"></textarea>
                </div>
     			<button type="submit" class="btn btn-success" name="Submit">Register</button>
          </form>


                
        </div>
  
</div>
</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>