<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="bg-dark js no-touch no-android no-chrome firefox no-iemobile no-ie no-ie10 no-ie11 no-ios">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.v2.css" type="text/css" />
</head>
<body>
	<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
	  <div class="container aside-xxl"> <a class="navbar-brand block" href="index.html">Notebook</a>
	    <section class="panel panel-default bg-white m-t-lg">
	      <header class="panel-heading text-center"> <strong>Sign in</strong> </header>
	      <form action="index.html" class="panel-body wrapper-lg">
	        <div class="form-group">
	          <label class="control-label">Email</label>
	          <input type="email" placeholder="test@example.com" class="form-control input-lg">
	        </div>
	        <div class="form-group">
	          <label class="control-label">Password</label>
	          <input type="password" id="inputPassword" placeholder="Password" class="form-control input-lg">
	        </div>
	        <div class="checkbox">
	          <label>
	            <input type="checkbox">
	            Keep me logged in </label>
	        </div>
	        <a href="#" class="pull-right m-t-xs"><small>Forgot password?</small></a>
	        <button type="submit" class="btn btn-primary">Sign in</button>
	        <div class="line line-dashed"></div>
	        <a href="#" class="btn btn-facebook btn-block m-b-sm"><i class="fa fa-facebook pull-left"></i>Sign in with Facebook</a> <a href="#" class="btn btn-twitter btn-block"><i class="fa fa-twitter pull-left"></i>Sign in with Twitter</a>
	        <div class="line line-dashed"></div>
	        <p class="text-muted text-center"><small>Do not have an account?</small></p>
	        <a href="<%=request.getContextPath()%>/admin/logup/" class="btn btn-default btn-block">Create an account</a>
	      </form>
	    </section>
	  </div>
	</section>
	<!-- footer -->
	<footer id="footer">
	  <div class="text-center padder">
	    <p> <small>Web app framework base on Bootstrap<br>
	      &copy; 2013</small> </p>
	  </div>
	</footer>
	<!-- / footer --> <script src="<%=request.getContextPath()%>/js/back/app.v2.js"></script>  <!-- Bootstrap --> <!-- App -->
</body>
</html>