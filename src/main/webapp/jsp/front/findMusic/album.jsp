<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %>
<link href="<%=request.getContextPath()%>/css/front/findMusic/album.css" rel="stylesheet">
<div id="album">
	<div id="Navigation" >
		<h3>热门新歌</h3>
	</div>
	<div id="songpicture1" >
			<c:forEach begin="1" end="2" var="i">
				<ul style="float:left;font-size:13px;">
					<c:forEach items="${musicList}" begin="${(i-1)*5 }" end="${(i-1)*5 + 4 }" var="music">
						<li>
									<div> 	

										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}"><img src="<%=request.getContextPath()%>/static/music/img/${music.img}" alt="通用的占位符缩略图"></a></br>
										<div style="width:150px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-20px;color:#ccc;left:0px;">
											<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;color:white"></i>  
											<span id="play_counts_index_${music.id }" style="margin-top:5px;color:white;width:60px;">${music.playcounts}</span>
											<span  onclick="playSongById(${music.id})"><i id="musicList_${music.id}" onmouseover="change1_musicList(${music.id})" onmouseout="change2_musicList(${music.id})" class="glyphicon glyphicon-play-circle" style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>
										</div>
										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname}</a>
										

									</div>
						</li>
					</c:forEach>
				</ul>
			</c:forEach>
	</div>
	<div id="Navigation" style="overflow:hidden;padding-top:10px" >
		<ol class="breadcrumb" style="background:none;height:auto;margin-bottom:10px;padding:0px;" >
			<li style="padding-bottom:-20px;""><a  style="text-decoration:none;font-size:24px; color:black;">全部新歌</a></li>
			<li><a href="#" style="color:gray;">华语</a></li>
			<li><a href="#" style="color:gray;">流行</a></li>
			<li><a href="#" style="color:gray;">摇滚</a></li>
			<li><a href="#" style="color:gray;">民谣</a></li>
			<li><a href="#" style="color:gray;">电子</a></li>
		</ol>
	</div>
	<div id="songpicture" >
		<c:forEach begin="1" end="${size}" var="i">
				<ul id="second">
					<c:forEach items="${musicList_all_1}" var="music"  begin="${(i-1)*5 + 0}" end="${(i-1)*5 + 4}" step="1">
							<li>
									<div> 	

										<a href="<%=request.getContextPath()%>/home/music?id=${music.id}"><img src="<%=request.getContextPath()%>/static/music/img/${music.img}" alt="通用的占位符缩略图"></a></br>
										<div style="width:150px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-20px;color:#ccc;left:0px;">
											<i class="glyphicon glyphicon-headphones" style="margin-left:5px;margin-top:5px;color:white"></i>  
											<span id="play_counts_index_${music.id }" style="margin-top:5px;color:white;width:60px;">${music.playcounts}</span>
											<span  onclick="playSongById(${music.id})"><i id="musicList_1_${music.id}" onmouseover="change1_musicList1(${music.id})" onmouseout="change2_musicList1(${music.id})" class="glyphicon glyphicon-play-circle" style="color:#ccc;float:right;margin-right:5px;font-size:18px;margin-top:2px;"></i></span>
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
function change1_musicList(id) {
	
	$("#musicList_"+id).css({"color":"white","cursor":"pointer"});
}

function change2_musicList(id) {
	$("#musicList_"+id).css("color","#ccc");
}

function change1_musicList1(id) {
	
	$("#musicList_1_"+id).css({"color":"white","cursor":"pointer"});
}

function change2_musicList1(id) {
	$("#musicList_1_"+id).css("color","#ccc");
}
</script>