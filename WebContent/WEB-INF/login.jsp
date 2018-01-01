<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<script type="text/javascript">
	function loginMessage(loginFail){
		if(loginFail!=null){
			if(loginFail) alert("Login failed!");
		}
	}
</script>
</head>
<body>
	<form class="form-horizontal well" method="post"
		action="${pageContext.request.contextPath }/login">
		<fieldset>
			<div class="form-actions" style="background-color: transparent">
				<h2>Login</h2>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputUsername">Username</label>
				<div class="controls">
					<input type="text" class="input-xlarge" id="inputUsername"
						name="username" required>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
					<input type="password" class="input-xlarge" id="inputPassword"
						name="password" required>
				</div>
			</div>
			<div class="form-actions" style="background-color: transparent">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
		</fieldset>
	</form>
	<script type="text/javascript"> window.onload = loginMessage(${requestScope.loginFail}); </script>
</body>
</html>