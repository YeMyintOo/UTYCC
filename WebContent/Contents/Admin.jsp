<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
</head>
<body>
	<script type="text/javascript">
		var head;
		if (window.XMLHttpRequest) {
			head = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			head = new ActiveXObject("MICROSOFT.XMLHTTP");
		}
		function isSerialed() {
			var key = document.getElementById("serial").value;
			var url = "/University/SRegister?key=" + key;
			head.open("GET", url);
			head.setRequestHeader("Context-type",
					"application/x-www-form-urlencoded");
			head.onreadystatechange = receiveMsg();
			head.send();
		}

		function receiveMsg() {
			if (head.readyState == 4 && head.status == 200) {
				alert("Request success");
			} else {
				alert("There was a problem with the request");
			}
		}
	</script>
	<center>
		<h2>Student Register Form</h2>
		<form action="/University/SRegister" method="post">
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
</body>
</html>