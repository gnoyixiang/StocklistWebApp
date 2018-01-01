<%@page import="model.TransactionDetails"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create New Transaction</title>
<style type="text/css">
.left {
	display: flex;
	direction: ltr;
	flex-direction: row-reverse;
}
</style>
</head>
<body>

	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		pageContext.setAttribute("sdf", sdf);
	%>
	<div class="form-horizontal well">
		<form method="post"
			action="${pageContext.request.contextPath}/user/transaction-add">
			<fieldset>
				<legend>Create New Transaction</legend>

				<c:if test="${sessionScope.transaction != null }">
					<div class="control-group">
						<label class="control-label" for="inputConsumeDate">Consume
							Date</label>
						<div class="controls">
							<span class="input-xlarge uneditable-input">${sdf.format(sessionScope.transaction.consumeDate)}</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="selectCustomer">Customer</label>
						<div class="controls">
							<span class="input-xlarge uneditable-input">${sessionScope.transaction.customer.customerName}</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="selectUser">User</label>
						<div class="controls">
							<span class="input-xlarge uneditable-input">${sessionScope.transaction.username}</span>
						</div>
					</div>
				</c:if>

				<c:if test="${sessionScope.transaction == null }">
					<div class="control-group">
						<label class="control-label" for="inputConsumeDate">Consume
							Date</label>
						<div class="controls">
							<input type="date" max="<%=sdf.format(new Date())%>"
								value="${requestScope.consumeDate}" class="input-xlarge"
								id="inputConsumeDate" name="consumeDate" required>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="selectCustomer">Customer</label>
						<div class="controls">
							<select id="selectCustomer" name="customerName" required>
								<c:if test="${customerName == null}">
									<option disabled selected value="">-- select an option
										--</option>
									<c:forEach var="customer" items="${customerList}">
										<option value="${customer.customerName}">${customer.customerName}</option>
									</c:forEach>
								</c:if>
								<c:if test="${customerName != null}">
									<c:forEach var="customer" items="${customerList}">
										<c:if test="${customer.customerName == customerName}">
											<option value="${customer.customerName}" selected>${customer.customerName}</option>
										</c:if>
										<c:if test="${customer.customerName != customerName}">
											<option value="${customer.customerName}">${customer.customerName}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="selectUser">User</label>
						<div class="controls">
							<select id="selectUser" name="username" required>
								<c:if test="${username == null}">
									<option disabled selected value="">-- select an option
										--</option>
									<c:forEach var="un" items="${usernameList}">
										<option value="${un}">${un}</option>
									</c:forEach>
								</c:if>
								<c:if test="${username != null}">
									<c:forEach var="un" items="${usernameList}">
										<c:if test="${un == username}">
											<option value="${un}" selected>${un}</option>
										</c:if>
										<c:if test="${un != username}">
											<option value="${un}">${un}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
				</c:if>
				<!-- Start of transaction details table -->
				<table class="table table-bordered table-striped table-hover">
					<tr>
						<th width="20%">Product Part Number</th>
						<th width="60%">Product Description</th>
						<th>Quantity</th>
						<th></th>
					</tr>
					<c:forEach var="td" items="${sessionScope.transDetails}">
						<tr>
							<td>${td.partNumber}</td>
							<td>${td.product.description}</td>
							<td>${td.quantity}</td>
							<td>
								<button formnovalidate="formnovalidate" type="submit"
									class="btn btn-danger" name="btnSubmit"
									value="${td.partNumber}">
									<i class="icon-minus-sign icon-large"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td><select id="selectProduct" name="partNumber" required
							onchange="this.form.submit()">

								<c:if test="${selectedProduct.partNumber ==null }">
									<option disabled selected value="">-- select an option
										--</option>
									<c:forEach var="product" items="${productList }">
										<option value="${product.partNumber}">${product.partNumber}</option>
									</c:forEach>
								</c:if>
								<c:if test="${selectedProduct.partNumber !=null }">
									<c:forEach var="product" items="${productList }">
										<c:if
											test="${product.partNumber == selectedProduct.partNumber }">
											<option value="${product.partNumber}" selected>${product.partNumber}</option>
										</c:if>
										<c:if
											test="${product.partNumber != selectedProduct.partNumber }">
											<option value="${product.partNumber}">${product.partNumber}</option>
										</c:if>
									</c:forEach>
								</c:if>
						</select></td>
						<td>${selectedProduct.description}</td>
						<td><input type="number" min="1" class="input-small"
							id="inputQuantity" name="quantity" required></td>
						<td>
							<button type="submit" class="btn btn-success" name="btnSubmit"
								value="plus">
								<i class="icon-plus-sign icon-large"></i>
							</button>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<form method="post"
		action="${pageContext.request.contextPath }/user/transaction-add">
		<c:if test="${sessionScope.transaction != null }">
			<div class="form-actions">
				<button type="submit" class="btn btn-warning" name="btnSubmit"
					value="new">Create new</button>
				<button type="submit" class="btn" name="btnSubmit" value="cancel">Cancel</button>
			</div>
		</c:if>
		<c:if test="${sessionScope.transaction == null }">
			<div class="form-actions">
				<button type="submit" class="btn btn-warning" name="btnSubmit"
					value="new" disabled>Create new</button>
				<button type="submit" class="btn" name="btnSubmit" value="cancel" disabled>Cancel</button>
			</div>
		</c:if>
	</form>
</body>
</html>