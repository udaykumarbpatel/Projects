<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
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
</style>
</head>

<body>

	<h2 align="center" class="style2">Flight Ticket Reservation System</h2>
	<p align="center" class="style2">
		Welcome &nbsp;&nbsp;&nbsp; <a href="login.jsp">(Logout)</a>
	</p>
	<%!Random randomValue = new Random();%>
	<h2 align="center" class="style1">Your Booking History</h2>
	<table align="center" width="306" border="1">
		<tr>
			<th width="121" scope="col">Ticket Number</th>
			<th width="63" scope="col">Date</th>
		</tr>
		<tr>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 10000000)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
					2013
				</center></td>

		</tr>
		<tr>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 10000000)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
					2013
				</center></td>
		</tr>
		<tr>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 10000000)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
					2013
				</center></td>
		</tr>
		<tr>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 10000000)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
					2013
				</center></td>
		</tr>
		<tr>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 10000000)%></center></td>
			<td><center><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/2013
				</center></td>
		</tr>
	</table>
	<p>&nbsp;</p>
	<center>
		<input name="button_home" type="button" id="button_home" value="Home"
			onclick="window.location.href='flightsearch.jsp'" />
	</center>

</body>
</html>
