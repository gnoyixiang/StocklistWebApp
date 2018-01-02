<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@page import="repository.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Transactions</title>

<script type="text/javascript">
	function createNewMessage(createNewSuccess){
		//if(createNewSuccess==null) alert("First time!");
		if(createNewSuccess!=null){
			if(createNewSuccess) alert("A new transaction has been created!");
			else alert("Create transaction failed!!!");
		}
	}
</script>

</head>
<body>
	<h2>View All Transactions</h2>
	<br>
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th>Transaction ID</th>
			<th>Customer Name</th>
			<th>Consume Date</th>
			<th>Username</th>
		</tr>
		<%
			List<Transaction> transList = (List<Transaction>) request.getAttribute("transList");
			for (int i = 0; i < transList.size(); i++) {
				Transaction t = transList.get(i);
				pageContext.setAttribute("t", t);
				pageContext.setAttribute("i", i);
		%>

		<tr>
			<td><a
				href="${pageContext.request.contextPath}/user/transaction-detail?index=${i}">${t.transactionId}</a></td>
			<td>${t.customer.customerName }</td>
			<td>${t.consumeDate }</td>
			<td>${t.username }</td>
		</tr>
		<%
			}
		%>

	</table>
	<%--
	<form action="/user/transaction-view" method="post">
		<div class="pagination pagination-centered">
			<ul>
				<li><a href="#">&lt;&lt;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&gt;&gt;</a></li>
			</ul>
		</div>
	</form> --%>
	<script type="text/javascript"> window.onload = createNewMessage(${requestScope.createNewSuccess}); </script>
</body>
</html>