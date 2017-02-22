<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %>
<link href="<%=request.getContextPath()%>/css/front/findMusic/rankList.css" rel="stylesheet">

<div id="rank_list">
	<div id="topList">
		<div id= "hotList" >
			<table class="table table-striped" style = "">
			
	<caption><h3>歌曲列表</h3></caption>			
	<tbody>
		<tr>
			<th>歌曲</th>
			<th>时长</th>
			<th>操作</th>
			<th>歌手</th>
		</tr>
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
</div>
