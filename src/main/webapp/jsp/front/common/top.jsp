<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/body.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/top.css" rel="stylesheet">
<script type="text/javascript">  
    function goTopEx() {  
        var obj = document.getElementById("goTopBtn");  
        function getScrollTop() {  
            return document.documentElement.scrollTop + document.body.scrollTop;  
        }  
        function setScrollTop(value) {  
            if (document.documentElement.scrollTop) {  
                document.documentElement.scrollTop = value;  
            } else {  
                document.body.scrollTop = value;  
            }  
        }  
        window.onscroll = function() {  
            getScrollTop() > 0 ? obj.style.display = "": obj.style.display = "none";  
        }  
        obj.onclick = function() {  
            var goTop = setInterval(scrollMove, 10);  
            function scrollMove() {  
                setScrollTop(getScrollTop() / 1.1);  
                if (getScrollTop() < 1) clearInterval(goTop);  
            }  
        }  
    }  
</script>  


<style>
       
</style>

</head>

<body>
<!--第一栏 导航栏 + 搜索框 + 登陆按钮 -->
<div style="min-width:1400px;background-image:url('<%=request.getContextPath()%>/img/front/home/背景黑条.png');background-repeat:repeat-x;" id="tab-header" >  																
<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
<!--导航-->
<ul class="nav navbar-nav" style="width:450px;margin-left:150px;background-image:url('<%=request.getContextPath()%>/img/front/home/背景黑条.png');background-repeat:repeat-x;float:left;">
  <a href="/#" class="navbar-brand" style="width:130px;"><img style="margin-top:-15px;width:130px;margin-left:-18px;" src="<%=request.getContextPath()%>/img/front/home/logo.png"/></a>
<li id="first" ><a class="active" href="#home" role="tab" data-toggle="tab" style="color:white;">发现音乐</a></li>
<li><a href="#profile" role="tab" data-toggle="tab" style="color:white;">我的音乐</a></li>
<li><a href="#messages" role="tab" data-toggle="tab" style="color:white;">朋友</a></li>
<li><a href="#settings" role="tab" data-toggle="tab" style="color:white;">音乐人</a></li>
</ul>
<!--搜索-->
<ul class="nav navbar-nav navbar-brand" style="margin-left:270px;margin-top:-5px;float:left;">
  <div class="form-group" >
    <input type="email" class="form-control" placeholder="单曲/歌手/专辑/歌单/mv/用户">
  </div>
</ul> 
<!--登陆-->
<ul class="nav navbar-nav navbar-right" style="margin-right:150px;float:right;">

 <div class="dropdown" >
 
  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" style="margin-top:8px;background-image:url('<%=request.getContextPath()%>/img/front/home/背景.png');background-repeat:repeat-x;;">
    <a style="margin:center;color:white;">登陆</a>
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background:#333;">
    <li role="presentation"><a class="ex3" role="menuitem" tabindex="-1" href="#" style="color:white;">网易云账号登陆</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:white;">微信QQ登陆</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:white;">手机登陆</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:white;">微博登陆</a></li>
  </ul>
</div> 
  
  
</ul>
</nav>
</div>
<!--导航栏所对应的转换页面-->
<div class="tab-content" style="margin-top:20px;">
<!--“我的音乐”对应转换第二导航栏-->
<div class="tab-pane active" id="home" style="background-image:url('<%=request.getContextPath()%>/img/front/home/背景红条.png');background-repeat:repeat-x;">
	<ul class="nav nav-pills" style="margin-left:290px;margin-top:-20px;">
	<li ><a href="#recommend" role="tab" data-toggle="tab" style="height:34px;color:white;">推荐</a></li>
	<li><a href="#rank" role="tab" data-toggle="tab" style="height:34px;color:white;">排行榜</a></li>
	<li><a href="#radio" role="tab" data-toggle="tab" style="height:34px;color:white;">主播电台</a></li>
	<li><a href="#singer" role="tab" data-toggle="tab" style="height:34px;color:white;">歌手</a></li>
	<li><a href="#newsong" role="tab" data-toggle="tab" style="height:34px;color:white;">新碟上架</a></li>
</ul>
</div>
<div class="tab-pane" id="profile">
		<div class="item" >
			<img src="<%=request.getContextPath()%>/img/front/home/背景红条.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
		</div>
</div>
<div class="tab-pane" id="messages">
<div class="item" >
			<img src="<%=request.getContextPath()%>/img/front/home/背景红条.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
		</div>
</div>
<div class="tab-pane" id="settings">
<div class="item" >
			<img src="<%=request.getContextPath()%>/img/front/home/背景红条.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
		</div>
</div>
</div>
<!--回到顶部按钮-->
<div style="display: none;margin-right:150px;" id="goTopBtn" >
	<button type="button" class="btn btn-default btn-sm" style="width:45px;height:45px;">
          <span class="glyphicon glyphicon-chevron-up"></span><br/> TOP
    </button></div>  
<script type=text/javascript>goTopEx();</script>  