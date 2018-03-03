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

<div class="main" style="min-height: 65vh">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="widget widget-nopad">
						<div class="widget-header">
							<i class="icon-list-alt"></i>
							<h3>Select Student</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content" style="padding: 20px">

							<form action="teacherApprovalStudent.jsp" method="POST">
								<div class="login-fields">
									<div class="span2">&nbsp;</div>
									<div class="span2">
										&nbsp;
										<div >
											<p style="text-align: right; font-size: 16px; font-weight: 600;">Name:</p>
										</div>
									</div>
									<div class="field span2">
										<select name="studentName" id="studentName"
											onchange="showEmp(this.value);" style="margin-top: 9%;">
											<option value="0">Select Student Name</option>
											<%
												statement = connection.createStatement();
												resultset = statement.executeQuery("Select UserName from LoginDetails where Approval = '0'");
												while (resultset.next()) {
											%>
											<option value="<%=resultset.getString("UserName")%>"><%=resultset.getString("UserName")%></option>
											<%
												}
											%>
										</select>
									</div>
									<!-- /field -->

									<div class="span2">
										<button style="margin-top: 9%;" name="submit"
											class="button btn btn-primary btn-large">Check</button>
									</div>
								</div>
								<!-- /login-fields -->
							</form>

						</div>
					</div>



					<!-- /widget -->
				</div>
				<%
					String username = request.getParameter("studentName");
					statement = connection.createStatement();
					resultset = statement
							.executeQuery("Select * from StudentRegistration where UserName = '" + username + "' ");
					while (resultset.next()) {
				%>
				<div class="row">
					<div class="span12" style="margin-left: 0">
						<div class="widget widget-nopad">
							<div class="widget-header">
								<i class="icon-list-alt"></i>
								<h3>Registration Details</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content" style="padding: 20px">

								<form action="TeacherApprovalServlet" method="POST">

									<div class="login-fields" style="margin-left: 10%">
									
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

									<!-- /login-fields -->
									<input style="float: none; margin-left: 46%" name="submit"
										type="submit" class="button btn btn-success btn-large"
										value="Approve" />

								</form>
							</div>
						</div>
						<!-- /widget -->
					</div>

					<!-- /span6 -->
				</div>
				<!-- /row -->
				<%
					}
				%>
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
	</div>

<jsp:include page="footer.jsp" />

</body>
</html>