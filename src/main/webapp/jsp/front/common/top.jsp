<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/body.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/top.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/player.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jquery-ui.min.css" rel="stylesheet">
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
	<!--第一栏 导航栏 + 搜索框 + 登陆按钮 -->
	<div id="tab-header" >  										
		<nav class="navbar  navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-left navbar-toggle collapsed " data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span><!-- 三个带有.icon-bar 的 <span> 创建所谓的汉堡按钮 -->
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
				    </button>
						  <a class="navbar-brand" href="/hwm/home/discover/1">
			  				<img style="margin-top:-15px;width:130px;height:50px;margin-left:-18px;" src="<%=request.getContextPath()%>/img/front/home/logo.png"/>
						  </a><!-- navbar-brand让文本看起来更大一号 -->
			    </div>
					
				<div id="navbar" class="collapse navbar-collapse"><!-- 给导航栏添加响应式，包裹在带有.collapse、.navbar-collapse  -->
					<ul class="nav navbar-nav" id="myTab"><!--nav navbar-nav 导航栏添加链接-->
						<li class="active"><a href="/hwm/home/discover/1"><span class="glyphicon glyphicon-search"></span> 发现音乐</a></li>
						<li><a href="/hwm/home/music"><span class="glyphicon glyphicon-user"></span> 我的音乐</a></li>
						<li><a href="#about"><span class="glyphicon glyphicon-save"></span> 音乐人</a></li>
						<li><a href="#contact">关于</a></li>
					</ul>
				</div>
				
				<!-- 登陆 -->
				<div class="dropdown pull-right" >
					  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
					  	<span style="margin:0 auto;color:white;">登陆</span>
					    <span class="caret"></span>
					  </button>
					  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" style="background:#333;">
					    <li role="presentation"><a class="ex3" role="menuitem" tabindex="-1" href="#" style="color:white;">网易云账号登陆</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:white;">微信QQ登陆</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:white;">手机登陆</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="#" style="color:white;">微博登陆</a></li>
					  </ul>
				</div> 
				
				<!-- 搜索 -->
				<div class="btn-group  pull-right">
					<form  class="navbar-form navbar-left" role="search"> 
						<div class="form-group"> 
							<input style="width:200px;border-radius:20px;" type="text" class="form-control" placeholder="单曲/歌手/专辑/歌单/mv/用户"> 
						</div> 
						
					</form>
				</div>
			  </div>
		</nav>
	</div>
	<div class="tab-content" style="margin-top:70px;">
		<!--我的音乐对应转换第二导航栏 -->
		<div class="tab-pane active" id="home" style="background-image:url('<%=request.getContextPath()%>/img/front/home/redBg.png');background-repeat:repeat-x;">
			<ul class="nav nav-pills" style="margin-left:290px;margin-top:-20px;">
				<li><a href="/hwm/home/discover/1"  style="height:34px;color:white;">推荐</a></li>
				<li><a href="/hwm/home/discover/rankList"  style="height:34px;color:white;">排行榜</a></li>
				<li><a href="/hwm/home/discover/musicList"  style="height:34px;color:white;">歌单</a></li>
				<li><a href="/hwm/home/discover/radio"  style="height:34px;color:white;">主播电台</a></li>
				<li><a href="/hwm/home/discover/singer"  style="height:34px;color:white;">歌手</a></li>
				<li><a href="/hwm/home/discover/album" style="height:34px;color:white;">新碟上架</a></li>
			</ul>
		</div>
		<div class="tab-pane" id="profile">
				<div class="item" >
					<img src="<%=request.getContextPath()%>/img/front/home/redBg.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
				</div>
		</div>
		<div class="tab-pane" id="messages">
		<div class="item" >
					<img src="<%=request.getContextPath()%>/img/front/home/redBg.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
				</div>
		</div>
		<div class="tab-pane" id="settings">
		<div class="item" >
					<img src="<%=request.getContextPath()%>/img/front/home/redBg.png" alt="Second slide"  width=100% height="8" style="margin-top:-55px;">
				</div>
		</div>
	</div>
	<!--回到顶部按钮-->
	<div style="display: none;margin-right:150px;" id="goTopBtn" >
		<button type="button" class="btn btn-default btn-sm" style="width:45px;height:45px;">
	          <span class="glyphicon glyphicon-chevron-up"></span><br/> TOP
	    </button>
	</div>
	<script>
		goTopEx();
	</script>
	  
	