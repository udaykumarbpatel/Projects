<%@page import="udayjui.javaclasses.Users"%>
<%@page import="udayjui.javaclasses.Flights"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Search Flight</title>
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

<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

</head>

<body>

	<jsp:useBean id="nametodisplay" class="udayjui.javaclasses.Users"
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
	<form id="form1" name="form1" method="post" action="FlightSearch">

		<table width="385" border="0" align="center">

			<tr>
				<td colspan="2"><div align="center" class="style6">
						<h3>
							<u>PLAN YOUR TRIP WITH US</u>
						</h3>
					</div></td>
			</tr>
			<tr>

				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td width="135"><span class="style5">Source</span></td>
				<td width="234"><input name="leave" type="text" id="leave" /></td>
			</tr>
			<tr>
				<td><span class="style5">Destination</span></td>
				<td><input name="going" type="text" id="going" /></td>
			</tr>
			<tr>
				<td><span class="style5">Date of Travel </span></td>
				<td><input name="date" type="text" id="datepicker" /></td>
			</tr>
			<tr>
				<td><span class="style5">Adult (18 and above)</span></td>
				<td><span class="style1"> <select name="adult"
						id="adult">
							<option value="1">&nbsp; 1</option>
							<option value="2">&nbsp; 2</option>
							<option value="3">&nbsp; 3</option>
							<option value="4">&nbsp; 4</option>
							<option value="5">&nbsp; 5</option>
							<option value="6">&nbsp; 6</option>
					</select>
				</span></td>
			</tr>
			<tr>
				<td><span class="style5">Children</span></td>
				<td><span class="style1"> <select name="child"
						id="child">
							<option value="0">&nbsp; 0</option>
							<option value="1">&nbsp; 1</option>
							<option value="2">&nbsp; 2</option>
							<option value="3">&nbsp; 3</option>
							<option value="4">&nbsp; 4</option>
							<option value="5">&nbsp; 5</option>
							<option value="6">&nbsp; 6</option>
					</select>
				</span></td>
			</tr>
			<tr>
				<td><span class="style5">Class</span></td>
				<td><span class="style1"> <select name="class"
						id="class">
							<option value="0">&nbsp; Economy</option>
							<option value="1">&nbsp; First Class</option>
					</select>
				</span></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>
		<center>
			<input type="submit" name="Submit" value="Search" />
		</center>
	</form>
</body>
</html>
