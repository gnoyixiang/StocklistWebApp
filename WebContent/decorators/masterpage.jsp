<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="https://bootswatch.com/2/flatly/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://bootswatch.com/2/default/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link href="https://bootswatch.com/2/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="https://bootswatch.com/2/css/bootswatch.css"
	rel="stylesheet" />

<script>
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-23019901-1' ]);
	_gaq.push([ '_setDomainName', "bootswatch.com" ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>

<title><decorator:title/></title>
<decorator:head/>
</head>

<body>
	
	<div class="container">
		<div>
		<%@include file="header.jsp"%>
		</div>
		<decorator:body />
		<hr />
		<h5 align="right">
			<a href="https://github.com/gnoyixiang"><b>gnoyixiang</b></a>
		</h5>
	</div>
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script data-cfasync="false"
		src="https://bootswatch.com/cdn-cgi/scripts/af2821b0/cloudflare-static/email-decode.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="https://bootswatch.com/2/js/jquery.smooth-scroll.min.js"></script>
	<script src="https://bootswatch.com/2/js/bootstrap.min.js"></script>
	<script src="https://bootswatch.com/2/js/bootswatch.js"></script>

</body>

</html>