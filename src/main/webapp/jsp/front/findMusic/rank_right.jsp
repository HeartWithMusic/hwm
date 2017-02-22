<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page isELIgnored="false"%>
<link href="<%=request.getContextPath()%>/css/front/findMusic/rankList.css"rel="stylesheet">

<div id="rank_list">
	<div style = "width:740px;height:208px; margin: 0 auto;">
		<div id = "item" style = "width:473px; height:114x; float:right;margin-right:50px; margin-top: 15px;">
			<p style ="line-height: 24px;font-size: 20px;font-weight: normal;">云音乐飙升榜</p>
			<p style = "margin-left: 28px;color:#999">(每天更新)</p>
		</div>
		<div id = "item" style = "width:473px; float:right;clear:both;margin-right: 50px;margin-top: 20px;">
			<div style = "width:380px;height:40px;">	<!--操作-->				
								<button style = "border:0;background-image: url('<%=request.getContextPath()%>/img/front/home/button3.png');width:66px;height:31px;text-align:right;color:white;float:left;">播放</button>
								<button onclick="addPlayList()" style = "border:0;background-image: url('<%=request.getContextPath()%>/img/front/home/button4.png');width:33px;height:31px;float:left;margin-top:-1px;" title="添加到播放列表"></button>
								<button class="btn btn-default" style = "width:75px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;"><i class="glyphicon glyphicon-folder-open" style="margin-right:5px;"></i>收藏</button>
								<button class="btn btn-default" style = "width:75px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;"><i class=" 	glyphicon glyphicon-download-alt" style="margin-right:5px;"></i>下载</button>
								<a href = "#pinglun" class = "btn btn-default"style = "width:100px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;"><i class="glyphicon glyphicon-comment" style="margin-right:5px;"></i>评论（10）</a>
							
							</div>
		</div>
		<div id = "coverImage" style = "width:158px;height:158px;margin-top:40px;margin-left:30px; border: 1px solid #ccc;">
			<img src = "<%=request.getContextPath()%>/img/front/home/biaoshengbang.jpg" style = "margin-top:3px; margin-left: 3px;">
		</div>
	</div>
	<div id="topList">
		<div id="hotList">
			<table class="table table-striped" style="">

				<caption>
					<h3>歌曲列表</h3>
				</caption>
				<tbody>
					<tr>
						<th></th>
						<th style = "padding-left: 50px;">歌曲</th>
						<th>时长</th>
						<th style = "padding-left: 25px;">操作</th>
						<th>歌手</th>
					</tr>
					<tr>
						<td style = "width:40px;">1</td>
						<td style=""><img alt=""
							src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"
							style="width: 20px;"> &nbsp&nbsp&nbsp <a href="#">告白气球</a>
						</td>
						<td>Time</td>
						<td><a href="#"><span id="coll"
								class="glyphicon glyphicon-plus" style="margin-left: 5px;"></span>&nbsp&nbsp</a>
							<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp&nbsp</a>
							<a href="#"><span class="glyphicon glyphicon-save"></span></a></td>
						<td><a href="#">所属专辑</a></td>

					</tr>
					<tr>
						<td style = "width:40px;">1</td>
						<td style=""><img alt=""
							src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"
							style="width: 20px;"> &nbsp&nbsp&nbsp <a href="#">告白气球</a>
						</td>
						<td>Time</td>
						<td><a href="#"><span id="coll"
								class="glyphicon glyphicon-plus" style="margin-left: 5px;"></span>&nbsp&nbsp</a>
							<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp&nbsp</a>
							<a href="#"><span class="glyphicon glyphicon-save"></span></a></td>
						<td><a href="#">所属专辑</a></td>

					</tr>
					<tr>
						<td style = "width:40px;">1</td>
						<td style=""><img alt=""
							src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"
							style="width: 20px;"> &nbsp&nbsp&nbsp <a href="#">告白气球</a>
						</td>
						<td>Time</td>
						<td><a href="#"><span id="coll"
								class="glyphicon glyphicon-plus" style="margin-left: 5px;"></span>&nbsp&nbsp</a>
							<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp&nbsp</a>
							<a href="#"><span class="glyphicon glyphicon-save"></span></a></td>
						<td><a href="#">所属专辑</a></td>

					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
