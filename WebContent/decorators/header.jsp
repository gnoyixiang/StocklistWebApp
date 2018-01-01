
<div class="navbar">
	<div class="navbar-inner">
		<div class="container" style="width: auto;">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="#">WYX StockList</a>
			<div class="nav-collapse">
				<ul class="nav">
					<%
						if (request.getServletPath().equals("/user/product-catalog")) {
					%><li class="active">
						<%
							} else {
						%>
					
					<li>
						<%
							}
						%> <a href="<%=request.getContextPath()%>/user/product-catalog">Catalog</a>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Transaction <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<%=request.getContextPath()%>/user/transaction-view">View
									All</a></li>
							<li><a href="<%=request.getContextPath()%>/user/transaction-add">Create
									New</a></li>
						</ul></li>
				</ul>
				<form class="navbar-search pull-left"
					action="http://www.google.com/search" method="get">
					<input type="text" class="search-query span2" placeholder="Google"
						name="q">
				</form>
				<ul class="nav pull-right">
					<%
						if (request.getSession().getAttribute("userSession") == null) {
					%>
					<li><a href="${pageContext.request.contextPath }/login">Login</a></li>
					<%
						} else {
					%>
					<li class="divider-vertical"></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">${sessionScope.userSession.toUpperCase()} <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Change password</a></li>
							<li class="divider"></li>
							<li><a href="${pageContext.request.contextPath }/logout">Logout</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>

			</div>
			<!-- /.nav-collapse -->
		</div>
	</div>
	<!-- /navbar-inner -->
</div>
<!-- /navbar -->
