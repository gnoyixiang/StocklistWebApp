<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ page import="model.*" %> --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
	<c:if test="${param.partNumber==null}">
		<p>
			You have not selected any product to edit. Click <a
				href="${pageContext.request.contextPath}/user/product-catalog">here</a>
			to browse catalog.
		</p>
	</c:if>
	<c:if test="${param.partNumber!=null}">
		<c:set var="p" value="${requestScope.product}" />
		<form class="form-horizontal well"
			action="${pageContext.request.contextPath}/admin/product-edit"
			method="post">
			<fieldset>
				<legend>Part Number : ${p.partNumber}</legend>
				<div class="control-group">
					<label class="control-label" for="inputStock">Stock</label>
					<div class="controls">
						<input type="number" min="0" class="input-xlarge" id="inputStock"
							name="stock" required="required">
						<p class="help-block">Current stock : ${p.stock }</p>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPrice">Price</label>
					<div class="controls">
						<input type="number" min="0" step="0.01" class="input-xlarge"
							id="inputPrice" name="unitPrice" required="required">
						<p class="help-block">Current price : ${String.format("$%.2f", p.unitPrice)}</p>
					</div>
				</div>
				<input type="hidden" name="partNumber" value="${p.partNumber}">
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">Save changes</button>
					<button type="reset" class="btn">Cancel</button>
				</div>
			</fieldset>
		</form>
	</c:if>
</body>
</html>