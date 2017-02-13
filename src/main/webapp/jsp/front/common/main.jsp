<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${title}</title>
</head>
<body>
	<iframe scrolling="auto" name="aa" frameborder="0" src="<%=request.getContextPath()%>/home/discover/1" style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;border: 0;"></iframe>
	<jsp:include page="player.jsp"></jsp:include>
	<script type="text/javascript">
		function ifrurl(url){
			var stateObject = {};
			var title = "Wow Title";
			var newUrl = url;
			history.pushState(stateObject,title,newUrl);
		}
	</script>
</body>
</html>