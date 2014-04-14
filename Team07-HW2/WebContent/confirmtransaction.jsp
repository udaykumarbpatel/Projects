<%@page import="udayjui.javaclasses.Email"%>
<%@page import="udayjui.javaclasses.Users"%>
<%@page import="udayjui.javaclasses.Flights"%>
<%@page import="udayjui.javaclasses.Cart"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Confirm Transcation</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://code.jquery.com/jquery-1.4.1-vsdoc.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
body {
	font-size: 90.5%;
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
	font-weight: bold
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
	font-weight: bold color:                  ##0B615E
}
-->
</style>

<script type="text/javascript">
	function printDiv(divID) {
		//var divElements = document.getElementById(divID).innerHTML;
		//var oldPage = document.body.innerHTML;
		window.print();
		window.location.href='flightsearch.jsp';
		
	}

	function changeVal() {
		var NameValue = document.forms["FormName"]["nameValidation"].value;
		document.forms["FormName"]["nameValidation"].value = NameValue;
	}

	$(function() {
		$("input[type=button, type=submit]").button().click(function(event) {
			event.preventDefault();
		});
	});
</script>

</head>

<body>
	<jsp:useBean id="nametodisplay" type="udayjui.javaclasses.Users"
		scope="session"></jsp:useBean>



	<h1 align="center" class="style6">Flight Ticket Reservation System</h1>
	<p align="center" class="style1">
		Welcome
		<jsp:getProperty property="fname" name="nametodisplay" />
		<a href="login.jsp">(Logout)</a>
	</p>
	<form id="form2" name="form2" method="post" action="BookingHistory">
		<center>
			This is your visit number :
			<jsp:getProperty property="novisits" name="nametodisplay" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="Bookinghistory" value="Booking History" />
		</center>
	</form>

	<h2 align="center" class="style8">Confirmation</h2>

	<%
		String str = (String) session.getAttribute("isAccountExist");
		if (str == null) {
	%>

	<div id="print_area">
		<form id="clicking">
			<h3 align="center" class="style8">Your purchase has been
				successfully submitted</h3>

			<%
				@SuppressWarnings("unchecked")
					ArrayList<Cart> flights = (ArrayList<Cart>) session
							.getAttribute("cart");
					for (int i = 0; i < flights.size(); i++) {
			%>

			<table align="center" width="496" border="1" align="center"
				bgcolor="#FAFAFA">

				<tr>
					<td width="157">Flight Number</td>
					<td width="155"><%=flights.get(i).getFlight().getOperator()
							+ flights.get(i).getFlight().getFlightnumber()%></td>
				</tr>
				<tr>
					<td width="157">Ticket Number</td>
					<td width="155"><%=flights.get(i).getBookid()%></td>
				</tr>
				<tr>
					<td>Date</td>
					<td><%=flights.get(i).getFlight().getDot()%></td>
				</tr>
				<tr>
					<td>Source</td>
					<td><%=flights.get(i).getFlight().getSource()%></td>

				</tr>
				<tr>
					<td>Destination</td>
					<td><%=flights.get(i).getFlight().getDestination()%></td>
				</tr>
				<tr>
					<td>Departure Time</td>
					<td><%=flights.get(i).getFlight().getDeparture()%></td>

				</tr>
				<tr>
					<td>Arrival Time</td>
					<td><%=flights.get(i).getFlight().getArrival()%></td>
				</tr>

				<tr>
					<td>Total amount paid</td>
					<td>$ <%=flights.get(i).getTotal_amt()%></td>
				</tr>

			</table>
			<br />
			<table align="center" border="1" align="center">
				<tr>
					<td width="157">Name</td>
					<td width="157">Age</td>
					<td width="157">Sex</td>
				</tr>
				<%
					for (int j = 0; j < flights.get(i).getSeats(); j++) {
				%>
				<tr>
					<td width="155"><input type="text" name="name"
						id="nameValidation" onchange="changeVal();"
						placeholder="Enter Name of the Passenger" value="" /></td>
					<td width="155"><input type="text" name="age"
						id="nameValidation" onchange="changeVal();"
						placeholder="Enter age of the Passenger" value="" /></td>
					<td width="155"><input type="text" name="sex"
						id="nameValidation" onchange="changeVal();" placeholder="Enter Sex"
						value="" /></td>
				</tr>
				<%
					}
				%>
			</table>
			<br />
			<%
				}
					Users u = (Users) session.getAttribute("nametodisplay");
					new Email(u.getEmail());				
					session.removeAttribute("cart");
			%>
			<center>
				<input name="button_home" type="button" id="button_home"
					value="Home" onclick="window.location.href='flightsearch.jsp'" />
				<input name="button_print" type="button" id="printing"
					value="Print Ticket" onclick="javascript:printDiv('print_area')"/>
			</center>
		</form>
	</div>


	<%
		} else if (str.equals("f")) {
	%>
	<h3 align="center" class="style8">Error</h3>
	<h3 align="center" class="style8">Account Details are Incorrect !</h3>
	<br />
	<br />
	<br />
	<center>
		<input name="button_home" type="button" id="button_home" value="Back"
			onclick="window.location.href='transaction.jsp'" />
	</center>
	<%
		} else if (str.equals("t")) {
	%>
	<h3 align="center" class="style8">Error</h3>
	<h3 align="center" class="style8">Balance Insufficient!</h3>
	<br />
	<br />
	<br />
	<center>
		<input name="button_home" type="button" id="button_home" value="Back"
			onclick="window.location.href='transaction.jsp'" />
	</center>
	<%
		}
	%>
	<p align="center">&nbsp;</p>
</body>
</html>
