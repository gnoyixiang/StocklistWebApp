<%@ page import="com.mysql.jdbc.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Product Catalog</title>

<script type="text/javascript">
	function editMessage(editSuccess, partNumber){
		//if(editSuccess==null) alert("First time!");
		if(editSuccess!=null){
			if(editSuccess) alert("Part " + partNumber + " has been updated!");
			else alert("Part " + partNumber + " failed to update!");
		}
	}
</script>
</head>

<body>
	<h2>Product Catalog</h2>
	<br>
	<table class="table table-bordered table-striped table-hover">
		<tr>
			<th>Part Number</th>
			<th>Description</th>
			<th>Colour</th>
			<th>Unit Price</th>
		</tr>
		<%-- Try using taglib instead for pagination --%>
		<%--
			List<Product> productList = (List<Product>) request.getAttribute("productList");
			int currentPage = StringUtils.isStrictlyNumeric(request.getParameter("page"))
					? Integer.parseInt(request.getParameter("page"))
					: 1;
			pageContext.setAttribute("currentPage", currentPage);
			int countPerPage = (int) request.getAttribute("countPerPage");
			int maxPages = (int) request.getAttribute("maxPages");
			for (int i = (currentPage - 1) * countPerPage; i < productList.size(); i++) {
				if (i >= currentPage * countPerPage) {
					break;
				}
				Product p = productList.get(i);
				pageContext.setAttribute("p", p);
				pageContext.setAttribute("i", i);
		--%>
		<%
			int currentPage = StringUtils.isStrictlyNumeric(request.getParameter("page"))
					&& !request.getParameter("page").equals("0") ? Integer.parseInt(request.getParameter("page")) : 1;
			pageContext.setAttribute("currentPage", currentPage);
		%>
		<c:forEach var="p" items="${productList}" varStatus="pStatus"
			begin="${(currentPage - 1)*countPerPage}"
			end="${productList.size() - 1}">
			<c:if test="${not(pStatus.count > countPerPage)}">

				<tr>
					<td><a
						href="${pageContext.request.contextPath}/user/product-detail?index=${pStatus.index}">${p.partNumber}</a></td>
					<%-- <td><%=p.getDescription()%></td>
					<td><%=p.getColour()%></td>
					<td><%=p.getUnitPrice()%></td> --%>
					<td>${p.description}</td>
					<td>${p.colour}</td>
					<td>${p.unitPrice}</td>
				</tr>
			</c:if>
		</c:forEach>
		<%--
			}
		--%>
	</table>
	<div class="pagination pagination-centered">
		<ul>
			<c:if test="${currentPage > 1 }">
				<li><a
					href="${pageContext.request.contextPath}/user/product-catalog?page=${currentPage - 1}">&lt;&lt;</a></li>
			</c:if>
			<%--
				int totalPages = (int) request.getAttribute("totalPages");
				for (int i = 1; i <= totalPages; i++) {
					if (i > totalPages) {
						break;
					}
					pageContext.setAttribute("i", i);
			--%>
			<%--
				if (currentPage == i) {
			--%>
			<c:forEach var="i" begin="1" end="${totalPages}">
				<c:if test="${currentPage eq i}">
					<li class="active"><a
						href="${pageContext.request.contextPath}/user/product-catalog?page=${i}">${i}</a></li>
				</c:if>
				<c:if test="${not(currentPage eq i)}">
					<li><a
						href="${pageContext.request.contextPath}/user/product-catalog?page=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${currentPage < requestScope.totalPages}">
				<li><a
					href="${pageContext.request.contextPath}/user/product-catalog?page=${currentPage + 1}">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</div>
	<script type="text/javascript"> window.onload = editMessage(${requestScope.editSuccess}, ${requestScope.partNumber}); </script>
</body>
</html>