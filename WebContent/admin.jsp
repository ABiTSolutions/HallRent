<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin | Hall Renting Service</title>
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
<%
		Connection connection = null;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=SRSTP_DB", "sa",
				"admin@123");
		Statement statement = null;
		ResultSet resultset = null;
	%>
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
                <li><a href="contact.jsp">Contact</a></li>
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
    <span class="pull-right"><a href="admin.jsp">Home</a> / Admin</span>
    <h2>Welcome Admin</h2>
</div>
</div>
<!-- banner -->



<jsp:include page="footer.jsp" />

</body>
</html>