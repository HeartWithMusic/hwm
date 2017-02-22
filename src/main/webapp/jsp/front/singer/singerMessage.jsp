<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link href="<%=request.getContextPath()%>/css/front/findMusic/singer.css" rel="stylesheet">  
 <div>
<div id = "singerItem" style = "width:642px; min-height: 50px; margin-top:18px;margin-left:35px;">
			<ul id="myTab" class="nav nav-tabs" style = "border: 1px solid #ccc;">
	<li class="item" >
		<a href="#topList" data-toggle="tab">
			 热门歌曲
		</a>
	</li>
	<li><a href="#singerMess" data-toggle="tab">歌手信息</a></li>
	
</ul>
<div id="myTabContent" class="tab-content">
	<div id="topList">
		
		<div id= "hotList" >
			<table class="table table-striped" style = "">
	<caption>热门歌曲</caption>	
	<tbody>
		<tr>
			<td style = "width: 200px;">1 &nbsp&nbsp&nbsp<img alt="" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"style = "width: 20px;"> 
			&nbsp&nbsp&nbsp <a href = "#">告白气球</a>
			</td>
			<td>Time</td>
			<td>
				<a href="#"><span id = "coll"  class="glyphicon glyphicon-plus" style = "margin-left: 5px;"></span>&nbsp&nbsp</a>
				<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp&nbsp</a>
			    <a href="#"><span class="glyphicon glyphicon-save"></span></a>
			</td>
			<td><a href="#">所属专辑</a></td>
			
		</tr>
		<tr>
			<td style = "width: 200px;">2 &nbsp&nbsp&nbsp<img alt="" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"style = "width: 20px;"> 
			&nbsp&nbsp&nbsp <a href = "#">告白气球</a>
			</td>
			<td>Time</td>
			<td>
				<a href="#"><span id = "coll"  class="glyphicon glyphicon-plus" style = "margin-left: 5px;"></span>&nbsp&nbsp</a>
				<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp&nbsp</a>
			    <a href="#"><span class="glyphicon glyphicon-save"></span></a>
			</td>
			<td><a href="#">所属专辑</a></td>
			
		</tr>
		<tr>
			<td style = "width: 200px;">3 &nbsp&nbsp&nbsp<img alt="" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"style = "width: 20px;"> 
			&nbsp&nbsp&nbsp <a href = "#">告白气球</a>
			</td>
			<td>Time</td>
			<td>
				<a href="#"><span id = "coll"  class="glyphicon glyphicon-plus" style = "margin-left: 5px;"></span>&nbsp&nbsp</a>
				<a href="#"><span class="glyphicon glyphicon-heart"></span>&nbsp&nbsp</a>
			    <a href="#"><span class="glyphicon glyphicon-save"></span></a>
			</td>
			<td><a href="#">所属专辑</a></td>
			
		</tr>
	</tbody>
</table>
		</div>
	</div>
	<div class="tab-pane fade" id="singerMess">
		<p>歌手信息
		</p>
	</div>
	
</div>
		</div>
		</div>
<script type="text/javascript">

</script>