<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<link href="<%=request.getContextPath()%>/css/front/findMusic/musicList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/findMusic/album.css" rel="stylesheet">

<div id="musicList">
	<div id="musicList_choose">


		<span style="font-size: 25px;">${typeName}</span>
		<button id="musicList_chooseBtn"  type="button" class="btn btn-default" title="<button type='button' class='btn btn-default' onclick='toAll()'>全部分类</</button>"
			data-container="body" data-toggle="popover" data-placement="bottom" 
			data-content='
			
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-flag"></span><span style="margin-left:10px;">语言</span></div>
						<div class="musicList_right">
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=1">华语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=2">英语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=3">粤语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=4">韩语</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=5">日语</a>
							<div>
						</div>
					</div>
					</div>
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-headphones"></span><span style="margin-left:10px;">风格</span></div>
						<div class="musicList_right">
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=6">流行</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=7">摇滚</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=8">民谣</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=9">说唱</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=10">电子</a>
							<span class="musicList_line">|</span></span>
							<br>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=11">古风</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=12">轻音乐</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=13">金属</a>
							<div>
						</div>
					</div>
					</div>
					
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-road"></span><span style="margin-left:10px;">场景</span></div>
						<div class="musicList_right">
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=14">清晨</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=15">夜晚</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=16">学习</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=17">工作</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=18">午休</a>
							<span class="musicList_line">|</span></span>
							<br>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=19">地铁</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=20">驾车</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=21">运动</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=22">旅行</a>
							<span class="musicList_line">|</span>
							<a href="http://localhost:8080/hwm/home/discover/musicList?cat=23">散步</a>
							<div>
						</div>
					</div>
					</div>
					
			'>
			选择分类<span class="glyphicon glyphicon-chevron-down" style="vertical-align:middle;margin-left:8px;"></span>
		</button>
	</div>
	<div id="songpicture">
			<c:forEach begin="1" end="${size}" var="i">
				<ul id="second">
					<c:forEach items="${musicList}" var="music"  begin="${(i-1)*5 + 0}" end="${(i-1)*5 + 4}" step="1">
							<li>
									<div> 	

										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}"><img src="<%=request.getContextPath()%>/static/music/img/${music.img}" alt="通用的占位符缩略图"></a></br>
										<div style="width:150px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-20px;color:#ccc;left:0px;">
											<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;"></i>  
											<span style="margin-top:5px;">${music.playcounts}</span>
											<a href="#"><i class="glyphicon glyphicon-play-circle" style="color:white;margin-left:90px;font-size:18px;margin-top:2px;"></i></a>
										</div>
										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname}</a>
										

									</div>
							</li>
					</c:forEach>
				</ul>
			</c:forEach>
			
	</div>
	<div id="paging">
		<ul class="pagination">
			<li><a href="#">上一页</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
			<li><span>...</span></li>
			<li><a href="#">9</a></li>
			<li><a href="#">10</a></li>
			<li><a href="#">11</a></li>
			<li><a href="#">下一页</a></li>
		</ul>
	</div>
</div>




<script>
	var flag = 1;
	$(function () { 
		$("[data-toggle='popover']").popover({html : true,placement :' auto bottom' });
		$(document).on("click",function(e) { 
			if($(e.target).attr("id") == "musicList_chooseBtn" ){
				flag = 0;
			}
			//console.info("hello");
			if($(e.target).attr("id") != "musicList_chooseBtn" && flag == 0 ) {
				$("#musicList_chooseBtn").popover('hide'); 
				flag = 1;
			}
			
		});
	});
	
	function toAll() {
		window.location.href = "http://localhost:8080/hwm/home/discover/musicList";
	}
</script>