<%@page import="udayjui.javaclasses.Cart"%>
<%@page import="udayjui.javaclasses.Flights"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Transcation</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
body {
	font-size: 90.5%;
	background-image:url('http://upload.wikimedia.org/wikipedia/commons/1/17/BlankMap-World-noborders.png');
	background-repeat:no-repeat;
background-attachment:fixed;
background-position:center;
}
</style>
<style type="text/css">
<!--
.style1 {
	font-weight: bold
}

-->
.style5 {
	
	color:#DF3A01;
}

.style6 {
	color:  #088A85;
}
-->
.style7 {
	color: #CC0000
}
-->
.style8 {
	color: #0B615E
}
-->

</style>
<script language="javascript">
	function checknull() {
		var iChars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?";
		var check = 0;
		if (document.form1.name.value == "") {
			alert("Fill in the Name of the Account Holder");
			document.form1.name.focus();
		} else if (document.form1.accountno.value == "") {
			alert("Fill in the Account number of the Account Holder");
			document.form1.accountno.focus();
		} else if (document.form1.routingno.value == "") {
			alert("Fill in the Routing number of the Account Holder");
			document.form1.routingno.focus();
		} else {
			for ( var i = 0; i < document.form1.name.value.length; i++) {
				if (iChars.indexOf(document.form1.name.value.charAt(i)) != -1) {
					check = 1;
				}
			}
			for ( var i = 0; i < document.form1.accountno.value.length; i++) {
				if (iChars.indexOf(document.form1.accountno.value.charAt(i)) != -1) {
					check = 1;
				}
			}
			for ( var i = 0; i < document.form1.routingno.value.length; i++) {
				if (iChars.indexOf(document.form1.routingno.value.charAt(i)) != -1) {
					check = 1;
				}
			}
			if (check == 1) {
				alert("Some Input field has special characters. \nThese are not allowed.\n Please remove them and try again.");
				document.form1.name.focus();
			} else {
				document.form1.submit();
			}
		}
	}
</script>
</head>

<body>
	<jsp:useBean id="nametodisplay" type="udayjui.javaclasses.Users"
		scope="session"></jsp:useBean>
	<h1 align="center" class="style6">Flight Ticket Reservation System</h1>
	<p align="center" class="style7">
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
	<h3 align="center" class="style8">Your Flight Details</h3>
	<center>
		<table width="788" border="1" align="center"
				bgcolor="#FAFAFA">
			<tr>

				<th width="112" scope="col">Flight Number</th>
				<th width="114" scope="col">Date</th>
				<th width="114" scope="col">Source</th>
				<th width="114" scope="col">Destination</th>
				<th width="116" scope="col">Departure Time</th>
				<th width="123" scope="col">Arrival Time</th>
				<th width="123" scope="col">Number of seats</th>
				<th width="110" scope="col">Total Cost</th>
			</tr>

			<%
			@SuppressWarnings("unchecked")
				ArrayList<Cart> flights = (ArrayList<Cart>) session.getAttribute("cart");
				for (int i = 0; i < flights.size(); i++) {
			%>
			<tr>

				<td><center><%=flights.get(i).getFlight().getOperator()
						+ flights.get(i).getFlight().getFlightnumber()%></center></td>
				<td><center><%=flights.get(i).getFlight().getDot()%></center></td>
				<td><center><%=flights.get(i).getFlight().getSource()%></center></td>
				<td><center><%=flights.get(i).getFlight().getDestination()%></center></td>
				<td><center><%=flights.get(i).getFlight().getDeparture()%></center></td>
				<td><center><%=flights.get(i).getFlight().getArrival()%></center></td>
				<td><center><%=flights.get(i).getSeats()%></center></td>
				<td><center>
						$
						<%=flights.get(i).getTotal_amt()%></center></td>
			</tr>
			<%
				}
			%>
		</table>

	</center>
	<h2 align="center" class="style8">Please provide your Bank Account
		details below</h2>

	<form id="form1" name="form1" method="post" action="Transaction">
		<table align="center" width="394" border="1" align="center"
				class="text ui-widget-content ui-corner-all">
			<tr>
				<td scope="col"><div align="center">Name of Account
						Holder</div></td>
				<td scope="col"><input name="name" type="text" id="name"
					placeholder="Enter full name" /></td>
			</tr>
			<tr>
				<td><div align="center">Account Number</div></td>
				<td><input name="accountno" type="text" id="accountno"
					placeholder="Enter Account number" /></td>
			</tr>
			<tr>
				<td><div align="center">Routing Number</div></td>
				<td><input name="routingno" type="text" id="routingno"
					placeholder="Enter Routing number" /></td>
			</tr>
		</table>
		<p align="center">
			<input name="button_confirm" type="button" value="Confirm" onclick="javascript:checknull()" /> <input
				name="button_cancel" type="button" value="Cancel"
				onclick="window.location.href='flightsearch.jsp'" />

		</p>
	</form>
	<p align="center" class="style1">&nbsp;</p>
</body>
</html>
