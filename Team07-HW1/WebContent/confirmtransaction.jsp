<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Confirm Transcation</title>
<style type="text/css">
<!--
.style1 {
	font-weight: bold
}
-->
</style>
</head>

<body>

	<h2 align="center" class="style1">Flight Ticket Reservation System</h2>
	<p align="center" class="style1">
		Welcome &nbsp;&nbsp;&nbsp;
	</p>
	<a href="login.jsp">(Logout)</a>
	<%!Random randomValue = new Random();%>
	<h2 align="center" class="style1">Confirmation</h2>
	<h3 align="center" class="style1">Your purchase has been
		successfully submitted</h3>
	<table align="center" width="496" border="1">
		<tr>
			<td width="157">Flight Number</td>
			<td width="155"><center>
					<%
						String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
						String flight = "";
						for (int i = 0; i < 2; i++) {
							flight = flight
									+ (alphabet.charAt(randomValue.nextInt(alphabet
											.length())));
						}
					%>
					<%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%>
				</center></td>
			</td>
		</tr>
		<tr>
			<td width="157">Ticket Number</td>
			<td width="155"><center>
					<%=(Math.abs(randomValue.nextInt()) % 10000000)%>
				</center></td>
		</tr>
		<tr>
			<td>Date</td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
					2013
				</center></td>
		</tr>
		<tr>
			<td>Departure Time</td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></center></td>

		</tr>
		<tr>
			<td>Arrival Time</td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></center></td>
		</tr>
		<tr>
			<td>Number of Stops</td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%>
					Stop(s)
				</center></td>
		</tr>
		<tr>
			<td>Total amount paid</td>
			<td><center>
					$
					<%=(Math.abs(randomValue.nextInt()) % 5999)%></center></td>
		</tr>
	</table>

	<center>
		<input name="button_home" type="button" id="button_home" value="Home" onclick="window.location.href='flightsearch.jsp'"/>
	</center>

	<p align="center">&nbsp;</p>
</body>
</html>
