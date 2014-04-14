<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Transcation</title>
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
		Welcome &nbsp;&nbsp;&nbsp; <a href="login.jsp">(Logout)</a>
	</p>
	<%!Random randomValue = new Random();%>
	<h4 align="center" class="style1">Your Flight Details</h4>
	<table align="center" width="881" border="1">
		<tr>
			<th width="119" scope="col">Flight Number</th>
			<th width="131" scope="col">Ticket Number</th>
			<th width="127" scope="col">Date</th>
			<th width="111" scope="col">Departure Time</th>
			<th width="100" scope="col">Arrival Time</th>
			<th width="125" scope="col">Number of Stops</th>
			<th width="122" scope="col">Estimated Cost</th>
		</tr>
		<tr>
			<td><center>
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
			<td><center>
					<%=(Math.abs(randomValue.nextInt()) % 10000000)%>
				</center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
					2013
				</center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%>
					Stop(s)
				</center></td>
			<td><center>
					$
					<%=(Math.abs(randomValue.nextInt()) % 5999)%></center></td>
		</tr>
	</table>

	<h2 align="center" class="style1">Please provide your Bank Account
		details below</h2>

	<table align="center" width="394" border="1">
		<tr>
			<td scope="col"><div align="center">Name of Account Holder</div></td>
			<td scope="col"><input name="textfield_nameAccnt" type="text"
				id="nameAccnt" placeholder="Enter full name" /></td>
		</tr>
		<tr>
			<td><div align="center">Account Number</div></td>
			<td><input name="textfield_accountNo" type="text" id="accountNo"
				placeholder="Enter Account number" /></td>
		</tr>
		<tr>
			<td><div align="center">Routing Number</div></td>
			<td><input name="textfield_routingNo" type="text" id="routingNo"
				placeholder="Enter Routing number" /></td>
		</tr>
	</table>

	<p align="center">
		<input name="button_confirm" type="submit" value="Confirm" onclick="window.location.href='confirmtransaction.jsp'" /> 
			<input name="button_cancel" type="submit" value="Cancel" onclick="window.location.href='flightsearch.jsp'" />

	</p>

	<p align="center" class="style1">&nbsp;</p>
</body>




</html>
