<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Detail</title>
<style type="text/css">
th, td {
	text-align: center !important;
}

.left {
	float: left;
}

.right {
	float: right;
}
</style>
</head>
<body>
	<c:if test="${param.index==null}">
		<p>
			You have not selected any product to view. Click <a
				href="${pageContext.request.contextPath}/user/product-catalog">here</a>
			to browse catalog.
		</p>
	</c:if>
	<c:if test="${param.index!=null && requestScope.product==null}">
		<p>
			The product index you have selected is out of range. Click <a
				href="${pageContext.request.contextPath}/user/product-catalog">here</a>
			to browse catalog.
		</p>
	</c:if>
	<c:if test="${param.index!=null && requestScope.product!=null}">
		<c:set var="p" value="${requestScope.product}" />
		<div class="container">
			<h2 class="left">Product Details for Part ${p.partNumber}</h2>
			<div class="right">
				<a class="btn btn-warning"
					href="${pageContext.request.contextPath}/admin/product-edit?partNumber=${p.partNumber}"><i
					class="icon-edit icon-white"></i>&nbsp;Edit</a>
			</div>
		</div>
		<br>
		<div class="container">
			<c:if test="${requestScope.index > 0}">
				<div class="left">
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath}/user/product-detail?index=${param.index-1}">&lt;&nbsp;Previous
					</a>
				</div>
			</c:if>
			<c:if test="${requestScope.index < requestScope.count-1}">
				<div class="right">
					<a class="btn btn-primary" onclick="<%  %>"
						href="${pageContext.request.contextPath}/user/product-detail?index=${param.index+1}">
						Next&nbsp;&gt;</a>
				</div>
			</c:if>
		</div>
		<br>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th scope="row" width="30%">Description:</th>
				<td>${p.description }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Colour:</th>
				<td>${p.colour }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Dimension:</th>
				<td>${p.dimension }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Manufacturer:</th>
				<td>${p.manufacturer }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Supplier ID:</th>
				<td>${p.supplierId }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Reorder Level:</th>
				<td>${p.reorderLevel }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Minimum Reorder Quantity:</th>
				<td>${p.minReorderQty }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Shelf Location:</th>
				<td>${p.shelfLocation }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Stock:</th>
				<td>${p.stock }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Unit Price:</th>
				<td>${p.unitPrice }</td>
			</tr>
			<tr>
				<th scope="row" width="30%">Status:</th>
				<td>${p.status }</td>
			</tr>
		</table>
	</c:if>
</body>
</html>