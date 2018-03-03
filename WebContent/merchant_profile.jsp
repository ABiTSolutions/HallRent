<jsp:include page="session.jsp" />
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Profile - Hall Renting Service</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<link href="assets/css/pages/signin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<style>
.row {
	margin-left: 0 !important;
	margin-right: 0 !important;
}
</style>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

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
    <span class="pull-right"><a href="index.jsp">Home</a> / Profile</span>
    <h2>My Profile</h2>
</div>
</div>
<!-- banner -->

<div class="container">
<div class="spacer">
<div class="row register">
  <div class="col-lg-6 col-lg-offset-3 col-sm-6 col-sm-offset-3 col-xs-12 ">

          <form class="" role="form" action="ProfileUpdateServlet" method="post">	
          
          	<div class="login-fields" >
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
											<p style="color: green">Successfully Updated...!!</p>
										</h2>
										<%
											}
											}
										%>
          	<%
								String userid = (String) session.getAttribute("user_Id");
								statement = connection.createStatement();
								resultset = statement.executeQuery("SELECT * FROM LoginDetails ld INNER JOIN Registration reg ON ld.UserName = reg.UserName WHERE ld.UserId = '" + userid + "' ");
								while (resultset.next()) {
									
				%>
                <input type="text" class="form-control" placeholder="Full Name" name="name" value="<%=resultset.getString("Name") %>" required="required">
                <input type="email" class="form-control" placeholder="Enter Email" name="email" value="<%=resultset.getString("EmailId") %>" required="required">
                <input type="number" class="form-control" placeholder="Enter Contact Number" name="contactNo" value="<%=resultset.getString("ContactNo") %>">  
                <input type="text" class="form-control" placeholder="Enter Username" name="userName" value="<%=resultset.getString("UserName") %>" readonly="readonly" required="required">
                <input type="text" class="form-control" placeholder="User Role" name="userRole" value="<%=resultset.getString("UserRole") %>" readonly="readonly" required="required">
                <textarea rows="6" class="form-control" placeholder="Address" name="address" value="<%=resultset.getString("Address") %>"></textarea>
                <% } %>
                </div>
     			<button type="submit" class="btn btn-success" name="Submit">Update</button>
          </form>


                
        </div>
  
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
