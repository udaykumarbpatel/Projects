<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Login</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<style>
body {
	font-size: 90.5%;
}
</style>

<style type="text/css">
<!--
.style1 {
	font-family: Georgia, "Times New Roman", Times, serif
}

.style5 {
	font-size: 12px;
	color: #CC0000;
}

.style6 {
	color: #CC0000
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
	<h2 align="center" class="style6">Flight Ticket Reservation System</h2>

	<div id="dialog-form">
		<form id="form1" name="form1" method="post" action="Login">
			<table width="330" border="3" align="center"
				class="text ui-widget-content ui-corner-all">
				<tr>
					<td colspan="2"><div align="center" class="style1">
							<h3 class="style6">Login</h3>
						</div></td>
				</tr>
				<tr>
					<td width="61"><span class="style6">Username</span></td>
					<td width="153"><input type="text" name="username"
						class="text ui-widget-content ui-corner-all" placeholder="Enter user name" /></td>

				</tr>
				<tr>
					<td><span class="style6">Password</span></td>
					<td><input type="password" name="password"
						class="text ui-widget-content ui-corner-all" placeholder="Enter password"/></td>
				</tr>
				<tr>
					<td colspan="2"><span class="style5"><a
							href="register.jsp">New User?</a></span></td>
				</tr>
			</table>

			<center>
				<input type="button" name="Submit" value="Submit" id="myButton"
					onclick="javascript:checknull()" />
			</center>
		</form>
	</div>
</body>
</html>
