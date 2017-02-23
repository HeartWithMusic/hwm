<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page isELIgnored="false"%>
<link href="<%=request.getContextPath()%>/css/front/findMusic/singer.css" rel="stylesheet">

<div id="singerItem"
	style="width: 642px; min-height: 50px; margin-top: 18px; margin-left: 35px;">
	<ul id="myTab" class="nav nav-tabs" style="border: 1px solid #ccc;">
		<li class="item active"><a href="#topList" data-toggle="tab" > 热门歌曲 </a>
		</li>
		<li><a href="#singerMess" data-toggle="tab">歌手信息</a></li>
	</ul>

	<div id="myTabContent" class=" tab-content ">
		<div id="topList" class="fade in active">
			<div id="hotList">
				<table  id="singer_musicList" class="table table-striped " >
					<caption>热门歌曲</caption>
					<tbody>
						<c:forEach items="${musicList}" var="music" varStatus="i">
							<tr>
								<td style="width: 200px;font-size:12px;">${i.count}&nbsp;&nbsp;&nbsp;
									<span class="singer_m" id="singer_m_${music.id }" onmouseover="change_music_state1(${music.id })" onmouseout="change_music_state2(${music.id })" onclick="change_play_state(${music.id})" title="播放"  > 
									<i id="0"  class="glyphicon glyphicon-expand" style="width: 20px;font-size:18px;top:3px;"></i></span> &nbsp;&nbsp;&nbsp; 
									<a href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname}</a>
								</td>
								<td style="font-size:12px;">${music.musictime}</td>
								<td style="font-size:15px;" ><a href="#" title="添加到播放列表"><span id="coll"
										class="glyphicon glyphicon-plus" style="margin-left: 5px;"></span>&nbsp;&nbsp;</a>
									<a href="#" title="收藏歌曲"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;</a>
									<a href="#" title="下载歌曲"><span class="glyphicon glyphicon-save"></span></a></td>
								<td style="font-size:12px;" ><a  title="播放次数" ><i class="glyphicon glyphicon-headphones" style="margin-right:5px;"></i>${ music.playcounts}</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tab-pane fade" id="singerMess">
			<p>${singer.introduction}</p>
		</div>
	</div>
</div>

<script type="text/javascript">
	function change_music_state1(id){
		if($("#singer_m_"+id +" i").attr("id") == 0){
			//alert("#singer_m_"+id+" i");
			$("#singer_m_"+id+" i").css("color","red");
			$("#singer_m_"+id).css("cursor","pointer");
			
		}
		
	}
	
	function change_music_state2(id){
		if($("#singer_m_"+id +" i").attr("id") == 0){
			$("#singer_m_"+id+" i").css("color","black");
		}
	}
	function change_play_state(id) {
		var singer_m_list = $(".singer_m i");
		//alert(singer_m_list.length);
		for(var i=0;i<singer_m_list.length;i++){
			singer_m_list.eq(i).css("color","black"); 
			singer_m_list.eq(i).attr("id",0);
		}
		$("#singer_m_"+id+" i").css("color","red");
		$("#singer_m_"+id +" i").attr("id",1);
		playSongById(id);
	}
	
</script>