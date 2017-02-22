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
	<div class="f-pr">
<div class="j-flag" id="auto-id-3RUC65BISpr0c08v"> <div class="g-wrap"><div class="cnt">
	<div class="cntc m-info">
	<div class="user f-cb">
	<a class="face" href="/user/home?id=365946911">
	<img src="http://p1.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=200y200"></a>
	<span class="name f-thide"><a href="/user/home?id=365946911" class="s-fc7" title="DoubleEn">${sessionScope.user.username}</a></span>
	</div>
	<div class="hd f-cb">
	<i class="type u-icn u-icn-13"></i>
	<h2 class="f-ff2 f-thide">我喜欢的音乐</h2>
	
	<table class="m-table ">
		<tr>
			<td>音乐名</td>
			<td>时长</td>
			<td>歌手</td>
		</tr>
		<c:forEach var="music" items="${currentMusic}">
			<tr>
				<td>${music.musicname}</td>
				<td>${music.musictime}</td>
				<td>${歌手}</td>
			</tr>
		
		</c:forEach>
	
	</table>
	
	
	
	</div>
	</div></div></div></div></div>


</div>
</div>
