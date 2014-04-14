<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Flight Ticket Reservation System - Registration</title>
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
	font-family: Georgia, "Times New Roman", Times, serif;
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
		} else if (document.form1.pword.value == "") {
			alert("Fill in the Password");
			document.form1.pword.focus();
		} else if (document.form1.pword.value != document.form1.cpword.value) {
			alert("Your Passwords Doesn't match");
			document.form1.cpword.focus();
		} else {
			document.form1.submit();
		}
	}

	$(function() {
		$("input[type=button],input[type=reset]").button().click(
				function(event) {
					event.preventDefault();
				});
	});

	$("#dialog-form").dialog({
		autoOpen : false,
		height : 300,
		width : 350,
		modal : true
	});
</script>
</head>

<body>
	<h2 align="center" class="style6">Flight Ticket Reservation System</h2>
	<form id="form1" name="form1" method="post" action="Registration">
		<table width="403" border="0" align="center">
			<tr>
				<td colspan="2"><div align="center" class="style1">
						<h3>Registration</h3>
					</div></td>
			</tr>
			<tr>
				<td width="148"><span class="style6">Username</span></td>
				<td width="239"><input name="username" type="text"
					id="username" class="text ui-widget-content ui-corner-all" placeholder="Enter user name" /></td>
			</tr>
			<tr>
				<td><span class="style6">Password</span></td>
				<td><input name="pword" type="password" id="pword"
					class="text ui-widget-content ui-corner-all" placeholder="Enter password"/></td>
			</tr>
			<tr>
				<td><span class="style6">Confirm Password</span></td>
				<td><input name="cpword" type="password" id="cpword"
					class="text ui-widget-content ui-corner-all" placeholder="Renter password"/></td>
			</tr>
			<tr>
				<td colspan="2"><span class="style6"></span></td>
			</tr>
			<tr>
				<td colspan="2"><span class="style6"></span></td>
			</tr>
			<tr>
				<td><span class="style6">First Name</span></td>
				<td><input name="fname" type="text" id="fname"
					class="text ui-widget-content ui-corner-all" placeholder="Enter first name"/></td>
			</tr>
			<tr>
				<td><span class="style6">Last Name</span></td>
				<td><input name="lname" type="text" id="lname"
					class="text ui-widget-content ui-corner-all" placeholder="Enter last name"/></td>
			</tr>
			<tr>
				<td><span class="style6">Address Line 1</span></td>
				<td><input name="aline1" type="text" id="aline1"
					class="text ui-widget-content ui-corner-all" placeholder="Enter address"/></td>
			</tr>
			<tr>
				<td><span class="style6">Address Line 2</span></td>
				<td><input name="aline2" type="text" id="aline2"
					class="text ui-widget-content ui-corner-all" placeholder="Enter address"/></td>
			</tr>
			<tr>
				<td><span class="style6">City</span></td>
				<td><input name="city" type="text" id="city"
					class="text ui-widget-content ui-corner-all" placeholder="Enter city" /></td>
			</tr>
			<tr>
				<td><span class="style6">State</span></td>
				<td><input name="state" type="text" id="state"
					class="text ui-widget-content ui-corner-all" placeholder="Enter state"/></td>
			</tr>
			<tr>
				<td><span class="style6">Country</span></td>
				<td><input name="country" type="text" id="country"
					class="text ui-widget-content ui-corner-all" placeholder="Enter country"/></td>
			</tr>
			<tr>
				<td><span class="style6">Contact</span></td>
				<td><input name="contact" type="text" id="contact"
					class="text ui-widget-content ui-corner-all" placeholder="Enter contact number"/></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>

		<center>
			<input name="signup" type="button" id="signup" value="Sign Up"
				onclick="javascript:checknull()" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="reset"
				type="reset" id="reset" value="Reset" />
		</center>
	</form>


</body>
</html>
