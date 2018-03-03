<jsp:include page="session.jsp" />
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Admin Dashboard - Hall Renting Service</title>
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
    <span class="pull-right"><a href="dashboard_admin.jsp">Back</a> / Merchant Details</span>
    <h2>Merchant Details </h2>
</div>
</div>
<!-- banner -->
	<div class="main" style="min-height: 65vh">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="widget widget-nopad">
						<br><div class="widget-header">
						<h3>Merchant Details</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content" style="padding: 20px">

							<form action="teacherApprovalStudent.jsp" method="POST">
								<div class="login-fields">
									<div class="span2">&nbsp;</div>
									<div class="span2">
										&nbsp;
										<div >
											<p style="text-align: right; font-size: 16px; font-weight: 600;">Select Merchant :</p>
										</div>
									</div>
									<div class="field span2">
										<select name="merchantName" id="merchantName"
										onchange="showEmp(this.value);" style="margin-top: 9%;">
										<option value="0">Select Merchant Name</option>
										<%
											statement = connection.createStatement();
											resultset = statement.executeQuery("Select * from Registration r Inner Join LoginDetails ld on r.UserName = ld.UserName where ld.UserRole = 'Merchant' and IsActive = 0 ");
											while (resultset.next()) {
										%>
										<option value="<%=resultset.getString(1)%>"><%=resultset.getString(1)%></option>
										<%
											}
										%>
									</select>
									</div>
									<!-- /field -->

									<div class="span2">
										<button style="margin-top: 12%; margin-right: -40%;" name="submit"
											class="button btn btn-primary btn-large">Check</button>
									</div>
								</div>
								<!-- /login-fields -->
							</form>

						</div>
					</div>



					<!-- /widget -->
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="widget widget-nopad">
						<div class="widget-header">
							<h3>Non Approved Merchant</h3>
						</div>
						<!-- /widget-header -->
						
						<div class="widget-content" style="padding: 20px">
							<table>
							  <tr style="background: #64a30a; color: white; font-size:  16px;">
							    <th>Name</th>
							    <th>Contact Number</th>
							    <th>Email Id</th>
							    <th>Address</th>
							  </tr>
						<%
						statement = connection.createStatement();
						resultset = statement.executeQuery("Select * from Registration r Inner Join LoginDetails ld on r.UserName = ld.UserName where ld.UserRole = 'Merchant' and IsActive = 0 ");
						while (resultset.next()) {
						%>
							  <tr>
							  	<th><%=resultset.getString(1) %></th>
							  	<th><%=resultset.getString(2) %></th>
							  	<th><%=resultset.getString(3) %></th>
							  	<th><%=resultset.getString(5) %></th>
							  </tr>
						<%
						}
						%>
							 </table>
						</div>
						
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="widget widget-nopad">
						<div class="widget-header">
							<h3>Approved Merchant</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content" style="padding: 20px">
							<table>
							  <tr style="background: #64a30a; color: white; font-size:  16px;">
							    <th>Name</th>
							    <th>Contact Number</th>
							    <th>Email Id</th>
							    <th>Address</th>
							  </tr>
						<%
						statement = connection.createStatement();
						resultset = statement.executeQuery("Select * from Registration r Inner Join LoginDetails ld on r.UserName = ld.UserName where ld.UserRole = 'Merchant' and IsActive = 1 ");
						while (resultset.next()) {
						%>
							  <tr>
							  	<th><%=resultset.getString(1) %></th>
							  	<th><%=resultset.getString(2) %></th>
							  	<th><%=resultset.getString(3) %></th>
							  	<th><%=resultset.getString(5) %></th>
							  </tr>
						<%
						}
						%>
							 </table>
						</div>
					</div>
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