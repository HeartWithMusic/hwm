<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/body.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/common/top.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/player.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jquery-ui.min.css" rel="stylesheet">
<!-- 底部歌曲播放部分 -->
<div>
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
	           	</div>  
	       </div>  
	    </div>  
	</div>
	<div id="bottom_lock_whole">
	     <span id="bottom_lock" class="glyphicon glyphicon-lock" style="opacity:0.9;color:white;font-size:10px;z-index:888;"></span>
	     <img id="bottom_lock_bg"  alt="" src="<%=request.getContextPath()%>/img/front/home/lockBg.png" style="opacity:0.9;"/>
	</div> 
	<%String path = request.getContextPath();%>
	<input id="path" type="hidden" value="<%=path%>"/>
</div>
<script src="<%=request.getContextPath()%>/js/common/jquery-3.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/audio.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/underscore.js" type="text/javascript" charset="utf-8"></script>	
<script>
		var flag = 1;//播放暂停切换
		var flag1 = 1;//声音控制切换
		var flag2 = 0;//播放模式切换
		var flag3 = 0;//歌单和歌词显示切换
		var flag4 = 0;//底部隐藏
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
		
		$("#bottom_lock_bg").mouseover(function(){
			$("#bottom_lock_bg").css("cursor","pointer");
			$("#bottom_lock").css("color","red");
		});
		$("#bottom_lock_bg").mouseout(function(){
			$("#bottom_lock").css("color","white");
		});
		
		$("#bottom_lock").mouseover(function(){
			$("#bottom_lock").css("cursor","pointer");
			$("#bottom_lock").css("color","red");
		});
		$("#bottom_lock").mouseout(function(){
			$("#bottom_lock").css("color","white");
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
			
			if($(e.target).attr("id") == "bottom_lock" || $(e.target).attr("id") == "bottom_lock_bg") {
				if(flag4 == 0 ){
					$("#img").css("display","none");
					$("#bottom_lock_whole").css({"display":"inline","bottom":"0px"});
					$("#list_lyc").css("display","none");
					flag3 = 0;
					flag4 = 1;
					
				}else {
					$("#img").css("display","inline");
					$("#bottom_lock_whole").css({"bottom":"42px"});
					flag4 = 0;
				}
			}
			
		});
		
		//启用popover
		$(function () { 
			$("[data-toggle='tooltip']").tooltip();
		});
</script>