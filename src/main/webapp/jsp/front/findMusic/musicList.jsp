<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/front/findMusic/musicList.css" rel="stylesheet">
<div id="musicList">
	<div id="musicList_choose">
		<span style="font-size: 25px;">全部</span>
		<button id="musicList_chooseBtn" type="button" class="btn btn-default" title="Popover title"  
			data-container="body" data-toggle="popover" data-placement="bottom" 
			data-content="底部的 Popover 中的一些内容">
			选择分类<span class="glyphicon glyphicon-chevron-down" style="vertical-align:middle;margin-left:8px;"></span>
		</button>
	</div>
	<div id="musicList_show">
		
	</div>
</div>

<script>
	$(function () { 
		$("[data-toggle='popover']").popover();
	});
</script>