<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>1st Year Register Form</title>
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

		function showPoliticsResult(str) {
			var xmlHttp;
			if (str.length == 0) {
				document.getElementById("livepolitics").innerHTML = "";
				document.getElementById("livepolitics").style.border = "0px";
				return;
			}
			if (window.XMLHttpRequest) {
				// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlHttp = new XMLHttpRequest();
			} else { // code for IE6, IE5
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {

					var jsonObj = JSON.parse(xmlHttp.responseText);
					document.getElementById("livepolitics").innerHTML = jsonObj;
				}
			}
			xmlHttp.open("GET", "/University/Hpolitics?key=" + str, true);
			xmlHttp.send();
		}
	</script>


	<center>
		<h2>Student Register Form</h2>

		<form action="/University/SRegister?type=1year" method="post">
			<table>
				<tr>
					<td>Serial</td>
					<td><input type="text" id="serial" onblur="isSerialed();"
						name="serial" /></td>
					<td><label id="err_serial"></label></td>
				</tr>

				<tr>
					<td>Name (English|Myanmar)</td>
					<td><input type="text" name="ename" />|<input type="text"
						name="mname" /></td>
					<td><label id="err_ename"></label></td>
				</tr>
				<tr>
					<td>NRC Number</td>
					<td><input type="text" name="nrc" /></td>
					<td><label id="err_nrc"></label></td>
				</tr>

				<tr>
					<td>Mark(10)</td>
					<td><input type="text" name="mark" /></td>
					<td></td>
				</tr>

				<tr>
					<td>Politics & Religion</td>
					<td><input type="text" name="politics"
						onkeyup="showPoliticsResult(this.value)" />
						<div id="livepolitics"></div></td>
					<td><input type="text" name="religion" /></td>
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
					<td>Father's Name (English/Myanmar)</td>
					<td><input type="text" name="fename" />|<input type="text"
						name="fmname" /></td>
				</tr>
				<tr>
					<td>Father's NRC</td>
					<td><input type="text" name="fnrc" /></td>
				</tr>
				<tr>
					<td>Father's Politics & Religion</td>
					<td><input type="text" name="fpolitics" />|<input type="text"
						name="freligion" /></td>
				</tr>
				<tr>
					<td>Father's Job</td>
					<td><input type="text" name="fjob" /></td>
				</tr>
				<tr>
					<td>Mother's Name (English/Myanmar)</td>
					<td><input type="text" name="mename" />|<input type="text"
						name="mmname" /></td>
				</tr>
				<tr>
					<td>Mother's NRC</td>
					<td><input type="text" name="mnrc" /></td>
				</tr>
				<tr>
					<td>Mother's Politics & Religion</td>
					<td><input type="text" name="mpolitics" />|<input type="text"
						name="mreligion" /></td>
				</tr>
				<tr>
					<td>Mother's Job</td>
					<td><input type="text" name="mjob" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Register New Student" /></td>
				</tr>
			</table>
		</form>
		<h5>
			<a href="#">Add Student From MS Access</a>
		</h5>
	</center>
	<h4>
		<a href="/University/Contents/Admin.jsp">Back</a>
	</h4>
</body>
</html>