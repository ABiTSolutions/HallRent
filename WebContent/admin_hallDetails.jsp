<jsp:include page="session.jsp" />
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Admin HallDetails - Hall Renting Service</title>
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
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
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
            <ul class="nav navbar-nav navbar-left">
						<div class="loginAs">
							<b>Hi, </b>
							<%=session.getAttribute("userNameLogin")%>
						</div>
					</ul>
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

  -->
</div>
<!-- #Header Starts -->
</div>


<!-- banner -->
<div class="inside-banner">
  <div class="container"> 
    <span class="pull-right"><a href="dashboard_admin.jsp">Back</a> / Hall Details</span>
    <h2>Hall Details </h2>
</div>
</div>
<!-- banner -->
	<div class="main" style="min-height: 65vh">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="widget widget-nopad">
						<br><div class="widget-header">
						<h3>Hall Details</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content" style="padding: 20px">
							<table>
							  <tr style="background: #64a30a; color: white; font-size:  16px;">
							    <th>Hall Name</th>
							    <th>Hall Rent</th>
							    <th>City</th>
							    <th>Contact Person</th>
							    <th>Mobile Number</th>
							    <th>Email Id</th>
							    <th>Merchant Name</th>
							  </tr>
						<%
						statement = connection.createStatement();
						resultset = statement.executeQuery("Select hd.Hall_Name, hd.Hall_Rent, hd.City, hd.Contact_Name, hd.Mobile_No, hd.EmailId, ld.UserName  from HallDetails hd Inner Join LoginDetails ld on ld.UserId = hd.UserId");
						while (resultset.next()) {
						%>
							  <tr>
							  	<th><%=resultset.getString("Hall_Name") %></th>
							  	<th><%=resultset.getString("Hall_Rent") %></th>
							  	<th><%=resultset.getString("City") %></th>
							  	<th><%=resultset.getString("Contact_Name") %></th>
							  	<th><%=resultset.getString("Mobile_No") %></th>
							  	<th><%=resultset.getString("EmailId") %></th>
							  	<th><%=resultset.getString("UserName") %></th>
							  </tr>
						<%
						}
						%>
							 </table>
						</div>
					</div>



					<!-- /widget -->
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp" />
<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="assets/js/jquery-1.7.2.min.js"></script> 
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/base.js"></script> 

</body>
</html>