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
<div>
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
						  <a class="navbar-brand" href="/hwm/home/discover/">
			  				<img style="margin-top:-15px;width:130px;height:50px;margin-left:-18px;" src="<%=request.getContextPath()%>/img/front/home/logo.png"/>
						  </a><!-- navbar-brand让文本看起来更大一号 -->
			    </div>
					
				<div id="navbar" class="collapse navbar-collapse"><!-- 给导航栏添加响应式，包裹在带有.collapse、.navbar-collapse  -->
					<ul class="nav navbar-nav" id="myTab"><!--nav navbar-nav 导航栏添加链接-->
						<li class="active"><a href="/hwm/home/discover/"><span class="glyphicon glyphicon-home"></span> 发现音乐</a></li>
						<li><a href="#about"><span class="glyphicon glyphicon-user"></span> 我的音乐</a></li>
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
				<li><a href="../discover/"  style="height:34px;color:white;">推荐</a></li>
				<li><a href="../discover/rankList"  style="height:34px;color:white;">排行榜</a></li>
				<li><a href="../discover/musicList"  style="height:34px;color:white;">歌单</a></li>
				<li><a href="../discover/radio"  style="height:34px;color:white;">主播电台</a></li>
				<li><a href="../discover/singer"  style="height:34px;color:white;">歌手</a></li>
				<li><a href="../discover/album" style="height:34px;color:white;">新碟上架</a></li>
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
	
	  
	<!-- 底部歌曲播放部分 -->
	<div class="panel panel-default" id="list_lyc">
		<div class="panel-heading"> 
			<h3 class="panel-title"> 歌曲列表 </h3>
			<div style="float:right;margin-top:-18px;width:300px;">
				<h3 id="panel-song-title" class="panel-title" style="float:left;" >  </h3>
				<span id="panel-close" class="glyphicon glyphicon-remove" style="float:right;"></span>
			</div>	
		</div>
		<div class="panel-body">
			<!--显示歌单-->
			<div class="lyric-mask1">
				<div class="lyric-box1">
					<ol id="m-list"></ol>  
				</div>
			</div>            
			
			<!--显示歌词-->
			<div class="lyric-mask">
				<div class="lyric-box">
					<div class="lyric-content" id="show-lrc-content"></div>
				</div>            
			</div>
			<ul id="big-photo" class="mod_focus_pic" id="divimginfog_imgPlayer">
				<li id="wlh" style="display: block;">
					<a href=""></a>
				</li>
			</ul>
		</div>
	</div>
			
	<div id="img">
		<div class="container">  
	        <div class="row" >  
	           <div class="col-md-3" >
					<div id="play_menu1" class="col-xs-6 col-sm-9">
						<span class="visible-xs visible-sm visible-md visible-lg">
							<!-- 上一首按钮 -->
							<div id="div-pre">
								<span id="btn-pre" class="glyphicon glyphicon-step-backward"></span>
							</div>
							<!-- 播放按钮 -->
							<div id="div-play">
								<span id="btn-play" class="glyphicon glyphicon-play"></span>
							</div>
							<!-- 下一首按钮 -->
							<div id="div-next">
								<span id="btn-next" class="glyphicon glyphicon-step-forward"></span>
							</div>
						</span>
					</div>
				</div>
	            <div class="col-md-4" class="col-xs-6 col-sm-3">  
	                <span class="visible-lg visible-md visible-sm">
						<div id="music_title">  
							正在播放: <strong id="rmusic"></strong>  
						</div>  
						<audio id="audio"  ></audio>  
						<!-- 进度条 -->
						<div  id="slider-range-max" style="width:360px;height:8px;background:gray;border:none;margin-top:6px;"></div>
					</span>
					<span class="visible-xs">
						<div id="music_title">  
							<span id="rmusic"></span>  
						</div>
					</span>	
				</div>
				<div class="col-md-2" class="col-xs-6 col-sm-3">
					<!-- 显示时间 -->
					<div id="music_showTime" >
						<span id="playTime" >00:00</span>
						<span id="surplusTime">/ 00:00</span>
					</div>
				</div>
				<div class="col-md-3" class="col-xs-6 col-sm-3">
					<!--音量控制-->
					<div id="volume" style="display:none;width:8px"></div>
	                <div class="btn-group" id="ctrl-area">  
						<!--播放模式-->
						<span id="btn-playWays" class="glyphicon glyphicon-repeat" data-toggle="tooltip" data-trigger="click" title="单曲循环"></span>
						<!--显示歌单和歌词-->
						<span id="btn-showMenu" class="glyphicon glyphicon-tasks"  ></span>
						<!-- 音量控制 -->
						<span id="btn-showVolume" class="glyphicon glyphicon-volume-up"  ></span>
	           		 </div>
	           		 <img alt="" src="<%=request.getContextPath()%>/img/front/home/lockBg.png" style="margin-top:-50px; margin-left:300px;">
	            </div>  
	       </div>  
	    </div>  
	</div>
	<%String path = request.getContextPath();%>
	<input id="path" type="hidden" value="<%=path%>"/>
</div>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script> 			
<script src="<%=request.getContextPath()%>/js/audio.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/underscore.js" type="text/javascript" charset="utf-8"></script>	
<script>
		goTopEx();
		var flag = 1;//播放暂停切换
		var flag1 = 1;//声音控制切换
		var flag2 = 0;//播放模式切换
		var flag3 = 0;//歌单和歌词显示切换
		$( "#slider-range-max" ).slider();
		$("#div-play").mouseover(function(){
			$("#div-play").css("cursor","pointer");
			$("#div-play").css("box-shadow","0 0 2px white");
			$("#btn-play").css("text-shadow","0 0 2px white");
		});
		$("#div-play").click(function(){
			if(flag == 1){
				$("#btn-play").removeClass("glyphicon glyphicon-play ");
				$("#btn-play").addClass("glyphicon glyphicon-pause");
				flag = 0;
			}else {
				$("#btn-play").removeClass("glyphicon glyphicon-pause ");
				$("#btn-play").addClass("glyphicon glyphicon-play");
				flag = 1;
			}
		});
		$("#div-play").mouseout(function(){
			$("#div-play").css("box-shadow","none");
			$("#btn-play").css("text-shadow","none");
		});
		$("#div-pre").mouseover(function(){
			$("#div-pre").css("cursor","pointer");
			$("#div-pre").css({"box-shadow":"0 0 1px white","border-color":"white"});
			$("#btn-pre").css({"text-shadow":"0 0 1px white","color":"white"});
		});
		$("#div-pre").mouseout(function(){
			$("#div-pre").css({"box-shadow":"none","border-color":"#ABABAB"});
			$("#btn-pre").css({"text-shadow":"none","color":"#ABABAB"});
		});
		$("#div-next").mouseover(function(){
			$("#div-next").css("cursor","pointer");
			$("#div-next").css({"box-shadow":"0 0 1px white","border-color":"white"});
			$("#btn-next").css({"text-shadow":"0 0 1px white","color":"white"});
		});
		$("#div-next").mouseout(function(){
			$("#div-next").css({"box-shadow":"none","border-color":"#ABABAB"});
			$("#btn-next").css({"text-shadow":"none","color":"#ABABAB"});
		});
		
		$("#btn-showVolume").mouseover(function(){
			$("#btn-showVolume").css("cursor","pointer");
			$("#btn-showVolume").css("color","white");
		});
		$("#btn-showVolume").mouseout(function(){
			$("#btn-showVolume").css("color","#ABABAB");
		});
		
		$("#btn-playWays").mouseover(function(){
			$("#btn-playWays").css("cursor","pointer");
			$("#btn-playWays").css("color","white");
		});
		$("#btn-playWays").mouseout(function(){
			$("#btn-playWays").css("color","#ABABAB");
		});
		
		$("#btn-showMenu").mouseover(function(){
			$("#btn-showMenu").css("cursor","pointer");
			$("#btn-showMenu").css("color","white");
		});
		$("#btn-showMenu").mouseout(function(){
			$("#btn-showMenu").css("color","#ABABAB");
		});
		
		$("#panel-close").mouseover(function(){
			$("#panel-close").css("cursor","pointer");
			$("#panel-close").css("color","white");
		});
		$("#panel-close").mouseout(function(){
			$("#panel-close").css("color","#ABABAB");
		});
		
		$(document).on("click",function(e) { 
			//console.info("hello");
			if($(e.target).attr("id") != "volume" && $(e.target).attr("id") != "btn-showVolume" ) {
				$("#volume").hide(); 
				flag1 = 1;
			}else if($(e.target).attr("id") == "btn-showVolume") {
				//console.info("bye");
				if(flag1 == 1 ){
					$("#volume").css("display","inline");
					flag1 = 0;
				}else {
					$("#volume").css("display","none");
					flag1 = 1;
				}
			}
			
			if($(e.target).attr("id") == "btn-playWays") {
				if(flag2 == 0 ){
					$("#btn-playWays").removeClass("glyphicon glyphicon-repeat");
					$("#btn-playWays").addClass("glyphicon glyphicon-refresh");
					$("#btn-playWays").attr("title","循环");
					flag2 = 1;
				}else if(flag2 == 1) {
					$("#btn-playWays").removeClass("glyphicon glyphicon-refresh");
					$("#btn-playWays").addClass("glyphicon glyphicon-random");
					
					$("#btn-playWays").attr("title","随机");
					
					flag2 = 2;
				}else if(flag2 == 2) {
					$("#btn-playWays").removeClass("glyphicon glyphicon-random");
					$("#btn-playWays").addClass("glyphicon glyphicon-repeat");
					$("#btn-playWays").attr("title","单曲循环");
					flag2 = 0;
				}
			}
			
			if($(e.target).attr("id") == "btn-showMenu") {
				if(flag3 == 0 ){
					$("#list_lyc").css("display","inline");
					flag3 = 1;
				}else {
					$("#list_lyc").css("display","none");
					flag3 = 0;
				}
			}else if($(e.target).attr("id") == "panel-close") {
				$("#list_lyc").css("display","none");
				flag3 = 0;
			}
		});
		
		//启用popover
		$(function () { 
			$("[data-toggle='tooltip']").tooltip();
		});
</script>