<%@page import="udayjui.javaclasses.Flights"%>
<%@page import="udayjui.javaclasses.Clients"%>

<%@page import="udayjui.javaclasses.Users"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - View and Book</title>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

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
</style>
<script language="javascript">
	function addtocart() {
		if (document.form1.username.value == "") {
			alert("Fill in the Username");
			document.form1.username.focus();
		} else if (document.form1.password.value == "") {
			alert("Fill in the Password");
			document.form1.pword.focus();
		} else {
			document.form1.submit();
		}
	}

	function gohome() {
		window.location.href = 'flightsearch.jsp'
	}

	function goback() {
		window.location.href = 'searchresults.jsp';
	}

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
		${Clients.organization.org_name } ${Clients.organization.org_state } <a href="<c:url value='/login.jsp' />">(Logout)</a>
	</p>
	<form id="form2" name="form2" method="post" action="<c:url value='/BookingHistory' />">
		<center>
			This is your visit number : ${Clients.user.novisits }
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="Bookinghistory" value="Booking History" />
		</center>
	</form>
	<form id="form1" name="form1" method="post" action="<c:url value='/ViewandBook' />">
		<table width="804" border="3" align="center" bgcolor="#FAFAFA">
			<tr>
				<th>Flight Number</th>
				<th>Jet Type</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Departing Time</th>
				<th>Arrival Time</th>
				<th>Stops</th>
				<th>Cost</th>
				<th>Seats</th>


			</tr>
			<tr>
				<td><center>${selectflight.operator} ${selectflight.flightnumber}</center></td>
				<td><center>${selectflight.operator}</center></td>
				<td><center>${selectflight.source}</center></td>
				<td><center>${selectflight.destination}</center></td>
				<td><center>${selectflight.departure}</center></td>
				<td><center>${selectflight.arrival}</center></td>
				<td><center>${selectflight.stops}</center></td>

				<td><center>
						$
						${selectflight.cost}</center></td>
				<td><center>
						<span class="style1"> <select name="adult" id="adult">
								<option value="1">&nbsp; 1</option>
								<option value="2">&nbsp; 2</option>
								<option value="3">&nbsp; 3</option>
								<option value="4">&nbsp; 4</option>
								<option value="5">&nbsp; 5</option>
								<option value="6">&nbsp; 6</option>
						</select>
						</span>
					</center></td>
				<td>
					<center>
						<input type="submit" name="submit" value="Select"
							onclick="form.action='<c:url value='/ViewandBook' />'" />
					</center>
					<center>
						<input type="submit" name="addcart" value="Add to cart"
							onclick="form.action='<c:url value='/AddCart' />'" />
					</center>
				</td>

			</tr>
		</table>
		<p align="center" class="style1">&nbsp;</p>
		<center>
			<input type="button" name="addtocart" value="Confirm Transaction"
				onclick="window.location.href='<c:url value='/transaction.jsp' />'" />
			&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <input
				type="button" name="Home" value="Home"
				onclick="window.location.href='<c:url value='/flightsearch.jsp' />'" />
		</center>
	</form>
	<%
		}
	%>
</body>
</html>
