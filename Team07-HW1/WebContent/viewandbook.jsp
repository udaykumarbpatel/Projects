<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - View and Book</title>
<style type="text/css">
<!--
.style1 {
	color: #CC0000
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
	<table width="804" border="3" align="center">
		<tr>
			<th>Flight Number</th>
			<th>Jet Type</th>
			<th>Source</th>
			<th>Destination</th>
			<th>Departing Time</th>
			<th>Arrival Time</th>
			<th>Number of Stops</th>
			<th>Seats</th>
		</tr>
		<tr>

			<td>
				<center>
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
				</center>
			</td>
			<td>
				<center>
					<%=(alphabet.charAt(randomValue.nextInt(alphabet.length())))%>
					<%=(Math.abs(randomValue.nextInt()) % 10)%>00
				</center>
			</td>
			<td>
				<center>
					<%
						flight = "";
						for (int i = 0; i < 3; i++) {
							flight = flight
									+ (alphabet.charAt(randomValue.nextInt(alphabet
											.length())));
						}
					%>
					<%=flight%>
				</center>
			</td>
			<td><center>
					<%
						flight = "";
						for (int i = 0; i < 3; i++) {
							flight = flight
									+ (alphabet.charAt(randomValue.nextInt(alphabet
											.length())));
						}
					%>
					<%=flight%>
				</center></td>
			<td>
				<center>
					<%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%>
				</center>
			</td>

			<td>
				<center>
					<%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%>
				</center>
			</td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%>
					Stop(s)
				</center></td>
			<td><center>
					<span class="style1"> <select name="adult" id="adult">
							<option value="1">&nbsp; 1</option>
							<option value="2">&nbsp; 2</option>
							<option value="3">&nbsp; 3</option>
							<option value="4">&nbsp; 4</option>
							<option value="5">&nbsp; 5</option>
							<option value="6">&nbsp; 6</option>
							<option value="7">&nbsp; 7</option>
							<option value="8">&nbsp; 8</option>
							<option value="9">&nbsp; 9</option>
					</select>
					</span>
				</center></td>
		</tr>
	</table>
	<p align="center" class="style1">&nbsp;</p>
	<center>
		<input type="submit" name="Select" value="Select" onclick="window.location.href='transaction.jsp'"/>
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="Back" value="Back" onclick="window.location.href='searchresults.jsp'"/>
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="Home" value="Home" onclick="window.location.href='flightsearch.jsp'"/>
	</center>

	<p align="center" class="style1">&nbsp;</p>
</body>
</html>
