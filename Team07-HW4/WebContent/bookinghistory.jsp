<%@page import="udayjui.javaclasses.Bookings"%>
<%@page import="udayjui.javaclasses.Users"%>
<%@page import="udayjui.javaclasses.Clients"%>


<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Booking History</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="b"%>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
body {
	font-size: 90.5%;
	background-image:
		url('http://upload.wikimedia.org/wikipedia/commons/1/17/BlankMap-World-noborders.png');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}
</style>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	font-family: "Times New Roman", Times, serif;
}

-->
<!--
.style2 {
	color: #CC0000
}

-->
.style5 {
	color: #DF3A01;
}

.style6 {
	color: #088A85;
}

-->
.style7 {
	color: #CC0000
}

-->
.style8 {
	font-weight: bold color:           ##0B615E
}
-->
</style>
<script language="javascript">
	$(function() {
		$("input[type=button]").button().click(function(event) {
			event.preventDefault();
		});
	});

	$("#dialog-form").dialog({
		autoOpen : false,
		height : 300,
		width : 350,
		modal : true,
	});
</script>
</head>

<body>

	<%
		Clients name = (Clients) session.getAttribute("Clients");
		if (name == null) {
			String encodedURL = response.encodeRedirectURL("login.jsp");
			response.sendRedirect(encodedURL);
		} else {
	%>

	<h1 align="center" class="style6">Flight Ticket Reservation System</h1>
	<p align="center" class="style1">
		Welcome ${Clients.user.fname} ${Clients.user.lname},
		${Clients.organization.org_name } ${Clients.organization.org_state }<a
			href="<b:url value='/login.jsp' />">(Logout)</a>
	</p>
	<center>This is your visit number : ${Clients.user.novisits }
	</center>
	<br />

	<h2 align="center" class="style6">Your Booking History</h2>
	<%
		@SuppressWarnings("unchecked")
			ArrayList<Bookings> bflights = (ArrayList<Bookings>) session
					.getAttribute("Bookedflights");
	%>
	<%
		if (bflights.size() > 0) {
	%>
	<table align="center" width="306" border="1" bgcolor="#FAFAFA">
		<tr>
			<th width="121" scope="col">Booking Number</th>
			<th width="112" scope="col">Flight Number</th>
			<th width="114" scope="col">Date</th>
			<th width="114" scope="col">Number of Seats</th>
			<th width="114" scope="col">Total Cost</th>
		</tr>

		<c:forEach var="name" items="${Bookedflights}">
			<tr>
				<td><center>${name.bookingid}</center></td>
				<td><center>${name.flightid}</center></td>
				<td><center>${name.dot}</center></td>
				<td><center>${name.seats}</center></td>
				<td><center>${name.totalcost}</center></td>
			</tr>
		</c:forEach>

	</table>

	<p>&nbsp;</p>
	<center>
		<input name="button_home" type="button" id="button_home" value="Home"
			onclick="window.location.href='flightsearch.jsp'" />
	</center>
	<%
		} else {
	%>
	<h2 align="center" class="style8">No Flights Found!</h2>

	<br />
	<br />
	<center>
		<input name="Submit" type="button" value="Back"
			onclick="window.location.href='<b:url value='/flightsearch.jsp' />'" />
	</center>
	<%
		}
		}
	%>
</body>
</html>
