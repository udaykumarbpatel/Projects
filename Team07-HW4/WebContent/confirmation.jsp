<%@page import="udayjui.javaclasses.Cart"%>
<%@page import="udayjui.javaclasses.Flights"%>
<%@page import="udayjui.javaclasses.Users"%>
<%@page import="udayjui.javaclasses.Email"%>
<%@page import="udayjui.javaclasses.Clients"%>


<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function printDiv(divID) {
		window.print();
		window.location.href = '<b:url value='/flightsearch.jsp' />';
	}

	function changeVal() {
		var NameValue = document.forms["FormName"]["nameValidation"].value;
		document.forms["FormName"]["nameValidation"].value = NameValue;
	}
</script>
</head>
<body>
	<div id="print_area">
		<%
			Clients name = (Clients) session.getAttribute("Clients");
			if (name == null) {
				String encodedURL = response.encodeRedirectURL("login.jsp");
				response.sendRedirect(encodedURL);
			} else {
		%>
		<form id="clicking">
			<h3 align="center" class="style8">Your purchase has been
				successfully submitted</h3>

			<c:forEach var="name" items="${cart}">
				<table align="center" width="496" border="1" align="center"
					bgcolor="#FAFAFA">
					<tr>
						<td width="157">Flight Number</td>
						<td width="155">${name.flight.operator}
							${name.flight.flightnumber}</td>
					</tr>
					<tr>
						<td width="157">Ticket Number</td>
						<td width="155">${name.bookid}</td>
					</tr>
					<tr>
						<td>Date</td>
						<td>${name.flight.dot}</td>
					</tr>
					<tr>
						<td>Source</td>
						<td>${name.flight.source}</td>

					</tr>
					<tr>
						<td>Destination</td>
						<td>${name.flight.destination}</td>
					</tr>
					<tr>
						<td>Departure Time</td>
						<td>${name.flight.departure}</td>
					</tr>
					<tr>
						<td>Arrival Time</td>
						<td>${name.flight.arrival}</td>
					</tr>
					<tr>
						<td>Total amount paid</td>
						<td>$ ${name.total_amt}</td>
					</tr>
				</table>
				<br />
				<table align="center" border="1" align="center">
					<tr>
						<td width="157">Name</td>
						<td width="157">Age</td>
						<td width="157">Sex</td>
					</tr>

					<c:set var="cmbIndex" value="${name.seats}">
					</c:set>
					<%
						int test = (Integer) (pageContext.getAttribute("cmbIndex"));
								pageContext.setAttribute("resp", test);
					%>
					<c:forEach var="seat" begin="1" end="${resp}">
						<tr>
							<td width="155"><input type="text" name="name"
								id="nameValidation" onchange="changeVal();"
								placeholder="Enter Name of the Passenger" value="" /></td>
							<td width="155"><input type="text" name="age"
								id="nameValidation" onchange="changeVal();"
								placeholder="Enter
							age of the Passenger" value="" /></td>
							<td width="155"><input type="text" name="sex"
								id="nameValidation" onchange="changeVal();"
								placeholder="Enter Sex" value="" /></td>
						</tr>
					</c:forEach>

				</table>
				<br />
			</c:forEach>
			<%
				new Email(name.getUser().getEmail());
					session.removeAttribute("cart");
			%>
			<center>
				<input name="button_home" type="button" id="button_home"
					value="Home"
					onclick="window.location.href='<c:url value='/flightsearch.jsp' />'" />
				<input name="button_print" type="button" id="printing"
					value="Print Ticket" onclick="javascript:printDiv('print_area')" />
			</center>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>
