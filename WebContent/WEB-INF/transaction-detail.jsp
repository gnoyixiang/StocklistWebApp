<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.left {
	float: left;
}

.right {
	float: right;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${param.index==null}">
		<p>
			You have not selected any transaction to view. Click <a
				href="${pageContext.request.contextPath}/user/transaction-view">here</a>
			to view transactions.
		</p>
	</c:if>
	<c:if test="${param.index!=null && requestScope.transaction==null}">
		<p>
			The transaction index you have selected is out of range. Click <a
				href="${pageContext.request.contextPath}/user/transaction-view">here</a>
			to view transactions.
		</p>
	</c:if>
	<c:if test="${param.index!=null && requestScope.transaction!=null}">
		<c:set var="p" value="${requestScope.product}" />
		<h2>Transaction Detail</h2>
		<div class="container">
			<c:if test="${requestScope.index > 0}">
				<div class="left">
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/user/transaction-detail?index=${param.index-1}">&lt;&nbsp;Previous
					</a>
				</div>
			</c:if>
			<c:if test="${requestScope.index < requestScope.count-1}">
				<div class="right">
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/user/transaction-detail?index=${param.index+1}">
						Next&nbsp;&gt;</a>
				</div>
			</c:if>
		</div>
		<br>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Transaction ID</th>
				<th>Customer Name</th>
				<th>Consume Date</th>
				<th>Username</th>
			</tr>
			<tr>
				<th>${requestScope.transaction.transactionId}</th>
				<th>${requestScope.transaction.customer.customerName }</th>
				<th>${requestScope.transaction.consumeDate }</th>
				<th>${requestScope.transaction.username }</th>
			</tr>
		</table>
		<c:if test="${requestScope.tdList.size() == 0}">
			No items in transaction!
		</c:if>
		<c:if test="${requestScope.tdList.size() > 0}">
			<table class="table table-bordered table-striped table-hover">
				<tr>
					<th>Part Number</th>
					<th>Description</th>
					<th>Colour</th>
					<th style="text-align: right">Unit Price</th>
					<th style="text-align: right">Quantity</th>
					<th style="text-align: right">Total Price</th>
				</tr>
				<c:set var="grandTotal" value="${0.0}"></c:set>
				<c:forEach var="td" items="${requestScope.tdList}">
					<tr>
						<td>${td.partNumber}</td>
						<td>${td.product.description}</td>
						<td>${td.product.colour}</td>
						<td style="text-align: right">${String.format("$%.2f", td.product.unitPrice)}</td>
						<td style="text-align: right">${td.quantity}</td>
						<td style="text-align: right">${String.format("$%.2f", td.quantity * td.product.unitPrice)}</td>
						<c:set var="grandTotal"
							value="${grandTotal +  td.quantity * td.product.unitPrice }"></c:set>
					</tr>
				</c:forEach>
				<tr>
					<th colspan="5" style="text-align: right">Grand Total</th>
					<th style="text-align: right">${String.format("$%.2f", grandTotal)}</th>
				</tr>
			</table>
		</c:if>
	</c:if>
</body>
</html>