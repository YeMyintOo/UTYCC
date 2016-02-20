<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome UTYCC</title>
</head>
<body>

	<center>
		<h2>Welcome To UTYCC</h2>
		<h4>Student Login</h4>
		<form action="" method="get">
			<table>
				<tr>
					<td>Serial:</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td><label id="error"></label></td>
					<td><input type="submit" value="Login" /></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>