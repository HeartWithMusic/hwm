<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page isELIgnored="false"%>
<link
	href="<%=request.getContextPath()%>/css/front/findMusic/singer.css"
	rel="stylesheet">

<div id="singerItem"
	style="width: 642px; min-height: 50px; margin-top: 18px; margin-left: 35px;">
	<ul id="myTab" class="nav nav-tabs" style="border: 1px solid #ccc;">
		<li class="item"><a href="#topList" data-toggle="tab"> 热门歌曲 </a>
		</li>
		<li><a href="#singerMess" data-toggle="tab">歌手信息</a></li>
	</ul>

	<div id="myTabContent" class="tab-content ">
		<div id="topList" class="tab-pane fade in active">
			<div id="hotList">
				<table class="table table-striped " style="">
					<caption>热门歌曲</caption>
					<tbody>
						<c:forEach items="${musicList}" var="music" varStatus="i">
							<tr>
								<td style="width: 200px;">${i.count}&nbsp;&nbsp;&nbsp;<a
									href=""> <img alt=""
										src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"
										style="width: 20px;"></a> &nbsp;&nbsp;&nbsp; <a
									href="<%=request.getContextPath()%>/home/music?id=${music.id}">${music.musicname}</a>
								</td>
								<td>${music.musictime}</td>
								<td><a href="#"><span id="coll"
										class="glyphicon glyphicon-plus" style="margin-left: 5px;"></span>&nbsp;&nbsp;</a>
									<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;</a>
									<a href="#"><span class="glyphicon glyphicon-save"></span></a></td>
								<td><a href="#">播放次数：${ music.playcounts}</a></td>

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
	

	
</script>