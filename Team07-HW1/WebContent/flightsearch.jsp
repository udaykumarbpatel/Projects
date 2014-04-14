<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Search Flight</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
<style type="text/css">
<!--
.style1 {
	color: #CC0000
}
-->
</style>

<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>

</head>

<body>
	<h2 align="center" class="style1">Flight Ticket Reservation System</h2>
	<p align="center" class="style1">
		Welcome
		<%
		String name = (String) request.getAttribute("name");
	%>
		<%=name%>
		<a href="login.jsp">(Logout)</a>
	</p>
	<form id="form1" name="form1" method="post" action="">
		<table width="385" border="0" align="center">

			<tr>
				<td colspan="2"><div align="center" class="style1">
						<h4>
							<u>PLAN YOUR TRIP WITH US</u>
						</h4>
					</div></td>
			</tr>
			<tr>

				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td width="135"><span class="style1">Source</span></td>
				<td width="234"><input name="leave" type="text" id="leave" /></td>
			</tr>
			<tr>
				<td><span class="style1">Destination</span></td>
				<td><input name="going" type="text" id="going" /></td>
			</tr>
			<tr>
				<td><span class="style1">Date of Travel </span></td>
				<td><input type="text" id="datepicker" /></td>
			</tr>
			<tr>
				<td><span class="style1">Adult (18 and above)</span></td>
				<td><span class="style1"> <select name="adult"
						id="adult">
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
				</span></td>
			</tr>
			<tr>
				<td><span class="style1">Children</span></td>
				<td><span class="style1"> <select name="child"
						id="child">
							<option value="0">&nbsp; 0</option>
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
				</span></td>
			</tr>
			<tr>
				<td><span class="style1">Class</span></td>
				<td><span class="style1"> <select name="class"
						id="class">
							<option value="0">&nbsp; Economy</option>
							<option value="1">&nbsp; Business</option>
							<option value="2">&nbsp; First Class</option>
					</select>
				</span></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>
	</form>


	<center>
		<input type="submit" name="Submit" value="Search" onclick="window.location.href='searchresults.jsp'" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="Bookinghistory" value="Booking History" onclick="window.location.href='bookinghistory.jsp'"/>
	</center>



	<p>&nbsp;</p>
</body>
</html>
