<jsp:include page="session.jsp" />
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details | Hall Renting Service</title>
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

<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 4px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    background: #f2f3f5;
}
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
    <span class="pull-right"><a href="search_hall.jsp">Back</a> / Details</span>
    <h2>Hall Details</h2>
</div>
</div>
<!-- banner -->

<div class="container">
<div class="properties-listing spacer">

<div class="row">
<div class="col-lg-3 col-sm-4 ">



<div class="hot-properties hidden-xs">
<h4>Hot Properties</h4>
<div class="row">
                <div class="col-lg-4 col-sm-5"><img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties"></div>
                <div class="col-lg-8 col-sm-7">
                  <h5><a href="property-detail.php">Jay Bharat</a></h5>
                  <p class="price">45,000</p> </div>
              </div>
<div class="row">
                <div class="col-lg-4 col-sm-5"><img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties"></div>
                <div class="col-lg-8 col-sm-7">
                  <h5><a href="property-detail.php">Mahesh Bhawan</a></h5>
                  <p class="price">50,000</p> </div>
              </div>

<div class="row">
                <div class="col-lg-4 col-sm-5"><img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties"></div>
                <div class="col-lg-8 col-sm-7">
                  <h5><a href="property-detail.php">Vinay Villa</a></h5>
                  <p class="price">40,000</p> </div>
              </div>

<div class="row">
                <div class="col-lg-4 col-sm-5"><img src="images/properties/1.jpg" class="img-responsive img-circle" alt="properties"></div>
                <div class="col-lg-8 col-sm-7">
                  <h5><a href="property-detail.php">Shehnai</a></h5>
                  <p class="price">35,000</p> </div>
              </div>

</div>


</div>

<div class="col-lg-9 col-sm-8">

<div class="row">
	<%
/* 	String username = (String) session.getAttribute("userName"); */
	statement = connection.createStatement();
	String name = (String) session.getAttribute("hall_name");
	resultset = statement.executeQuery("Select * from HallDetails where Hall_Name= '" + name + "' ");
	while (resultset.next()) {
		String hallName = resultset.getString(2);
		session.setAttribute("hall_name", hallName);
		String hallRent = resultset.getString(15);
		session.setAttribute("hall_rent", hallRent);
		String city = resultset.getString(11);
		String locality = resultset.getString(12);
		String sublocality = resultset.getString(13);
		String landmark = resultset.getString(14);
		session.setAttribute("location", locality +" "+ sublocality +" "+ landmark +" "+ city);
		String contactName = resultset.getString(23);
		session.setAttribute("contactName", contactName);
		String contactNumber = resultset.getString(24);
		session.setAttribute("contactNumber", contactNumber);
		String contactEmail = resultset.getString(25);
		session.setAttribute("contactEmail", contactEmail);
		String contactAddress = resultset.getString(26);
		session.setAttribute("contactAddress", contactAddress);
		session.setAttribute("hall_type", resultset.getString(3));
		session.setAttribute("area", resultset.getString(4));
		session.setAttribute("rooms", resultset.getString(5));
		session.setAttribute("floors", resultset.getString(6));
		session.setAttribute("kitchen", resultset.getString(7));
		session.setAttribute("parking", resultset.getString(8));
		session.setAttribute("lawn", resultset.getString(9));
		session.setAttribute("maintenance", resultset.getString(16));
		session.setAttribute("electricity", resultset.getString(17));
		session.setAttribute("lawn_space", resultset.getString(18));
		session.setAttribute("power_backup", resultset.getString(19));
		session.setAttribute("lift", resultset.getString(20));
		session.setAttribute("security", resultset.getString(21));
		session.setAttribute("staff", resultset.getString(22));
		session.setAttribute("decoration", resultset.getString(27));
		session.setAttribute("catering", resultset.getString(28));
		
	}
	%>
		<div class="col-lg-8">
  <div class="property-images">
    <!-- Slider Starts -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators hidden-xs">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1" class=""></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
        <li data-target="#myCarousel" data-slide-to="3" class=""></li>
      </ol>
      <div class="carousel-inner">
        <!-- Item 1 -->
        <div class="item active">
          <img src="images/properties/4.jpg" class="properties" alt="properties" />
        </div>
        <!-- #Item 1 -->

        <!-- Item 2 -->
        <div class="item">
          <img src="images/properties/2.jpg" class="properties" alt="properties" />
         
        </div>
        <!-- #Item 2 -->

        <!-- Item 3 -->
         <div class="item">
          <img src="images/properties/1.jpg" class="properties" alt="properties" />
        </div>
        <!-- #Item 3 -->

        <!-- Item 4 -->
        <div class="item ">
          <img src="images/properties/3.jpg" class="properties" alt="properties" />
          
        </div>
        <!-- # Item 4 -->
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>

  </div>
  
  		<div class="profile">
  			<h2><%=session.getAttribute("hall_name") %> Hall</h2>
  			<br>
  			<h3> Hall Details</h3>
  			<table>
  				<tr>
  					<th>AC/Non AC :</th>
  					<th><%=session.getAttribute("hall_type") %></th>
  				</tr>
  				<tr>
  					<th>Area :</th>
  					<th><%=session.getAttribute("area") %> sqft</th>
  				</tr>
  				<tr>
  					<th>No of Rooms :</th>
  					<th><%=session.getAttribute("rooms") %></th>
  				</tr>
  				<tr>
  					<th>No of Floors :</th>
  					<th><%=session.getAttribute("floors") %> </th>
  				</tr>
  				<tr>
  					<th>Kitchen Room Avalability :</th>
  					<th><%=session.getAttribute("kitchen") %> </th>
  				</tr>
  				<tr>
  					<th>Parking For :</th>
  					<th><%=session.getAttribute("parking") %> </th>
  				</tr>
  				<tr>
  					<th>Attached Lawn :</th>
  					<th><%=session.getAttribute("lawn") %> </th>
  				</tr>
  				</table>
  				<br>
  				<h3>Rent Details</h3>
  				<table>
  				<tr>
  					<th>Hall Rent :</th>
  					<th>&#8377; <%=session.getAttribute("hall_rent") %> </th>
  				</tr>
  				<tr>
  					<th>Maintenance Charge :</th>
  					<th>&#8377; <%=session.getAttribute("maintenance") %> </th>
  				</tr>
  				<tr>
  					<th>Electricity Charge :</th>
  					<th><%=session.getAttribute("electricity") %> </th>
  				</tr>
  				<tr>
  					<th>Lawn Charges (If Attached) :</th>
  					<th><%=session.getAttribute("lawn_space") %> </th>
  				</tr>
  				</table>
  				<br>
  				<h3>Include Services</h3>
  				<table>
  				<tr>
  					<th>Power Backup :</th>
  					<th><%=session.getAttribute("power_backup") %> </th>
  				</tr>
  				<tr>
  					<th>Lift in Building :</th>
  					<th><%=session.getAttribute("lift") %> </th>
  				</tr>
  				<tr>
  					<th>Security :</th>
  					<th><%=session.getAttribute("security") %> </th>
  				</tr>
  				<tr>
  					<th>Maintenance Staff :</th>
  					<th><%=session.getAttribute("staff") %> </th>
  				</tr>
  				</table>
  				<br>
  				<h3>Add-On Services (Payable)</h3>
  				<table>
  				<tr>
  					<th>Decoration :</th>
  					<th><%=session.getAttribute("decoration") %> </th>
  				</tr>
  				<tr>
  					<th>Catering Service :</th>
  					<th><%=session.getAttribute("catering") %> </th>
  				</tr>
  			</table>
  		</div>
  </div>
  <!-- #Slider Ends -->
  
  
  
  <div class="col-lg-4">
  <div class="col-lg-12  col-sm-6">
<div class="property-info">
	<p class="price">&#8377; <%=session.getAttribute("hall_rent") %></p>
  	<p class="area"><span class="glyphicon glyphicon-map-marker"></span><%=session.getAttribute("location") %></p>
  
  <div class="profile">
  <span class="glyphicon glyphicon-user"></span> Contact Details
  <p><%=session.getAttribute("contactName") %><br><%=session.getAttribute("contactNumber") %><br><%=session.getAttribute("contactEmail") %><br><%=session.getAttribute("contactAddress") %></p>
  </div>
</div>

</div>

  </div>
	
     


     
      
</div>
</div>
</div>
</div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>