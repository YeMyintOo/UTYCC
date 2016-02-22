<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>2nd/3rd/4th/5th/6th Year Register Form</title>
</head>
<body>
	<script type="text/javascript">
		function isSerialed() {
			var xmlHttp;
			var key = document.getElementById("serial").value;
			try {
				// Firefox, Opera 8.0+, Safari
				xmlHttp = new XMLHttpRequest();
			} catch (e) {
				// Internet Explorer
				try {
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						alert("Your browser does not support AJAX!");
						return false;
					}
				}
			}
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4) {
					document.getElementById("err_serial").innerHTML = xmlHttp.responseText;
				}
			}
			xmlHttp.open("GET", "/University/SRegister?key=" + key, true);
			xmlHttp.send(null);
		}
	</script>
	<center>
		<form action="/University/SRegister?type=years" method="post">
			<table>
				<tr>
					<td>Serial</td>
					<td><input type="text" id="serial" name="serial"
						onblur="isSerialed();" /></td>
					<td><label id="err_serial"></label></td>
				</tr>

				<tr>
					<td>Name (English)</td>
					<td><input type="text" name="ename" /></td>
					<td><label id="err_ename"></label></td>
				</tr>

				<tr>
					<td>Name (Myanmar)</td>
					<td><input type="text" name="mname" /></td>
					<td><label id="err_mname"></label></td>
				</tr>

				<tr>
					<td>Other Name</td>
					<td><input type="text" name="oname" /></td>
					<td><label id="err_oname"></label></td>
				</tr>

				<tr>
					<td>NRC Number</td>
					<td><input type="text" name="nrc" /></td>
					<td><label id="err_nrc"></label></td>
				</tr>

				<tr>
					<td>Politics</td>
					<td><input type="text" name="politics" /></td>
					<td><label id="err_politics"></label></td>
				</tr>

				<tr>
					<td>Religion</td>
					<td><input type="text" name="religion" /></td>
					<td><label id="err_religion"></label></td>
				</tr>

				<tr>
					<td>Birthday</td>
					<td><input type="text" name="birthday"></td>
					<td><label id="err_birthday"></label></td>
				</tr>

				<tr>
					<td>HomeTown</td>
					<td><input type="text" name="hometown" /></td>
					<td><label id="err_hometown"></label></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Add Student" /></td>
				</tr>

			</table>
		</form>
		<h5>
			<a href="#">Add Student From MS Access</a>
		</h5>
	</center>
	<h4><a href="/University/Contents/Admin.jsp">Back</a></h4>
</body>
</html>