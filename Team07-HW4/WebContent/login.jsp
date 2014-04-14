<%@page import="java.util.*"%>
<%@page import="udayjui.javaclasses.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Login</title>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
body {
	font-size: 90.5%;
	background-image:
		url('http://www.freevector.com/site_media/preview_images/FreeVector-Travel-Graphics.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
}

#body {
	margin: 10%;
	padding: 6%;
}
</style>

<style type="text/css">
<!--
.style1 {
	font-family: Georgia, "Times New Roman", Times, serif
}

.style5 {
	color: #CC0000;
}

.style6 {
	color: #000000;
}
-->
</style>



<script language="javascript">
	function checknull() {
		if (document.form1.username.value == "") {
			alert("Fill in the Username");
			document.form1.username.focus();
		} else if (document.form1.password.value == "") {
			alert("Fill in the Password");
			document.form1.pword.focus();
		} else {
			document.form1.submit();
		}
	}

	$(function() {
		$("input[type=button]").button().click(function(event) {
			event.preventDefault();
		});
	});

	$("#dialog-form").dialog({
		autoOpen : false,
		height : 300,
		width : 350,
		modal : true,
	});
</script>
</head>

<body>
	<%
		session.invalidate();
		Cookie cookie = null;
		Cookie[] cookies = null;
		// Get an array of Cookies associated with this domain
		cookies = request.getCookies();
		String uvalue = "";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (cookie.getName().equals("example")) {
					uvalue = cookie.getValue();
				}
			}
		}
	%>
	<h1 align="center" class="style6">Flight Ticket Reservation System</h1>
	<div id="dialog-form">
		<form id="form1" name="form1" method="post" action="<c:url value='/Login' />">
			<div id="body">
				<table width="330" border="3" align="center" bgcolor="#FAFAFA">
					<tr>
						<td colspan="2"><div align="center" class="style1">
								<h3 class="style6">Login</h3>
							</div></td>
					</tr>
					<tr>
						<td width="61"><span class="style5">Username</span></td>
						<td width="153"><input type="text" name="username"
							class="text ui-widget-content ui-corner-all" value="<%=uvalue%>"
							placeholder="Enter user name" /></td>

					</tr>
					<tr>
						<td><span class="style5">Password</span></td>
						<td><input type="password" name="password"
							class="text ui-widget-content ui-corner-all"
							placeholder="Enter password" /></td>
					</tr>
					<tr>
						<td colspan="2"><span class="style5"><a
								href="<%= response.encodeURL("register.jsp")%>">New User?</a></span> <input type="checkbox"
							name="remember" id="remember" value="remember" />Remember me!!!<br /></td>

					</tr>
				</table>

				<br /> <br />
				<center>
					<input type="button" name="Submit" value="Submit" id="myButton"
						onclick="javascript:checknull()" />
				</center>
			</div>
		</form>
	</div>
</body>
</html>
