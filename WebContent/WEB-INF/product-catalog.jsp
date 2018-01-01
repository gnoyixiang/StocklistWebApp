<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="model.Product"%>
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
			for (int i = 0; i < productList.size(); i++) {
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
	<form action="/user/product-catalog" method="post">
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
	</form>
	<script type="text/javascript"> window.onload = editMessage(${requestScope.editSuccess}, ${requestScope.partNumber}); </script>
</body>
</html>