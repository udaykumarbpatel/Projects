<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Search Results</title>
<script type="text/javascript">
	function check() {
		var off_payment_method = document.getElementsByName('radiobutton1');
		var ischecked_method = false;
		for ( var i = 0; i < off_payment_method.length; i++) {
			if (off_payment_method[i].checked) {
				ischecked_method = true;
			}
		}
		if (!ischecked_method) { //payment method button is not checked
			alert("Please select a flight!");
		} else {
			window.location.href='viewandbook.jsp';
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
</style>

<style type="text/css">
</style>

</head>

<body>

	<h2 align="center" class="style2">Flight Ticket Reservation System</h2>
	<p align="center" class="style2">
		Welcome &nbsp;&nbsp;&nbsp; <a href="login.jsp">(Logout)</a>
	</p>
	<%!Random randomValue = new Random();%>
	<form id="form1" name="form1" method="post" action="">
		<center>
			<p class="style1">Search Result</p>
			<p>&nbsp;</p>
			<table width="788" border="1">
				<tr>
					<th width="45" scope="col">Select option</th>
					<th width="112" scope="col">Flight Number</th>
					<th width="114" scope="col">Date</th>
					<th width="116" scope="col">Departure Time</th>
					<th width="123" scope="col">Arrival Time</th>
					<th width="122" scope="col">Number of Stops</th>
					<th width="110" scope="col">Cost</th>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton2" />
						</center></td>
					<td>
						<%
							String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
							String flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 4)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton2" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton3" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton4" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton5" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton6" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton7" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton8" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton9" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>
				<tr>
					<td><center>
							<input name="radiobutton1" type="radio" value="radiobutton10" />
						</center></td>
					<td>
						<%
							flight = "";
							for (int i = 0; i < 2; i++) {
								flight = flight
										+ (alphabet.charAt(randomValue.nextInt(alphabet
												.length())));
							}
						%> <%=flight%><%=(Math.abs(randomValue.nextInt()) % 1000)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 30 + 1)%>/<%=(Math.abs(randomValue.nextInt()) % 12 + 1)%>/
						2013</td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 24)%>:<%=(Math.abs(randomValue.nextInt()) % 60)%></td>
					<td><%=(Math.abs(randomValue.nextInt()) % 3 + 1)%> Stop(s)</td>
					<td>$ <%=(Math.abs(randomValue.nextInt()) % 5999)%></td>
				</tr>

			</table>
		</center>

	</form>
	<center>
		<input name="Submit" type="button" value="View and Book"
			onclick="javascript:check()" />
	</center>


</body>
</html>
