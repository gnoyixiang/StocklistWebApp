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
		<%
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
		%>
		<tr>
			<td><a
				href="${pageContext.request.contextPath}/user/product-detail?index=${i}">${p.partNumber}</a></td>
			<td><%=p.getDescription()%></td>
			<td><%=p.getColour()%></td>
			<td><%=p.getUnitPrice()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<div class="pagination pagination-centered">
		<ul>
			<c:if test="${currentPage > 1 }">
				<li><a
					href="${pageContext.request.contextPath}/user/product-catalog?page=${currentPage - 1}">&lt;&lt;</a></li>
			</c:if>
			<%
				int totalPages = (int) request.getAttribute("totalPages");
				for (int i = 1; i <= totalPages; i++) {
					if (i > totalPages) {
						break;
					}
					pageContext.setAttribute("i", i);
			%>
			<%
				if (currentPage == i) {
			%>
			<li class="active"><a
				href="${pageContext.request.contextPath}/user/product-catalog?page=${i}">${i}</a></li>
			<%
				} else {
			%>
			<li><a
				href="${pageContext.request.contextPath}/user/product-catalog?page=${i}">${i}</a></li>
			<%
				}
			%>
			<%
				}
			%>
			<c:if test="${currentPage < requestScope.totalPages}">
				<li><a
					href="${pageContext.request.contextPath}/user/product-catalog?page=${currentPage + 1}">&gt;&gt;</a></li>
			</c:if>
		</ul>
	</div>
	<script type="text/javascript"> window.onload = editMessage(${requestScope.editSuccess}, ${requestScope.partNumber}); </script>
</body>
</html>