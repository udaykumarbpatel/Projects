<%@page import="udayjui.javaclasses.Flights"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Search Results</title>
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
	background-position: right;
}
</style>
<script type="text/javascript">
	function check() {
		var off_payment_method = document.getElementsByName('selectedflight');
		var ischecked_method = false;
		for ( var i = 0; i < off_payment_method.length; i++) {
			if (off_payment_method[i].checked) {
				ischecked_method = true;
			}
		}
		if (!ischecked_method) { //payment method button is not checked
			alert("Please select a flight!");
		} else {
			document.form1.submit();
		}
	}
</script>

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
-->
.style5 {
	color: #DF3A01;
}

.style6 {
	color: #088A85;
}

-->
.style7 {
	font-size: 18px;
	font-weight: bold;
	font-family: "Times New Roman", Times, serif;
	color: #088A85;
}
-->
</style>

<style type="text/css">
</style>

<script language="javascript">
	$("#dialog-form").dialog({
		autoOpen : false,
		height : 300,
		width : 350,
		modal : true,
	});
</script>



</head>

<body>
	<jsp:useBean id="nametodisplay" type="udayjui.javaclasses.Users"
		scope="session"></jsp:useBean>

	<h1 align="center" class="style6">Flight Ticket Reservation System</h1>
	<p align="center" class="style2">
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
	<div id="dialog-form">
		<form id="form1" name="form1" method="post" action="SearchResults">
			<center>
				<p class="style7">Search Result</p>
				<p>&nbsp;</p>
				<%
					@SuppressWarnings("unchecked")
					ArrayList<Flights> flights = (ArrayList<Flights>) session
							.getAttribute("flightResult");
				%>
				<%
					if (flights.size() > 0) {
				%>
				<table width="788" border="1" align="center" bgcolor="#FAFAFA">
					<tr>
						<th width="45" scope="col">Select option</th>
						<th width="112" scope="col">Flight Number</th>
						<th width="114" scope="col">Date</th>
						<th width="114" scope="col">Source</th>
						<th width="114" scope="col">Destination</th>
						<th width="116" scope="col">Departure Time</th>
						<th width="123" scope="col">Arrival Time</th>
						<th width="110" scope="col">Stops</th>
						<th width="110" scope="col">Cost</th>
					</tr>

					<%
						for (int i = 0; i < flights.size(); i++) {
					%>
					<tr>
						<td><center>
								<input name="selectedflight" type="radio"
									value="<%=flights.get(i).getOperator()
							+ flights.get(i).getFlightnumber()%>" />
							</center></td>
						<td><center><%=flights.get(i).getOperator()
							+ flights.get(i).getFlightnumber()%></center></td>
						<td><center><%=flights.get(i).getDot()%></center></td>
						<td><center><%=flights.get(i).getSource()%></center></td>
						<td><center><%=flights.get(i).getDestination()%></center></td>
						<td><center><%=flights.get(i).getDeparture()%></center></td>
						<td><center><%=flights.get(i).getArrival()%></center></td>
						<td><center><%=flights.get(i).getStops()%></center></td>
						<td><center>
								$
								<%=flights.get(i).getCost()%></center></td>
					</tr>
					<%
						}
					%>

				</table>

			</center>
		</form>
	</div>
	<br />
	<center>
		<input name="Submit" type="button" value="View and Book"
			onclick="javascript:check()" />
	</center>

	<%
		} else {
	%>

	No Flights Found!!:P
	<br />
	<br />
	<center>
		<input name="Submit" type="button" value="Back"
			onclick="window.location.href='flightsearch.jsp'" />
	</center>
	<%
		}
	%>
</body>
</html>
