<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style = "width:268px;float:right;">
	<div id= "ad"  style = "margin-top: 25px; margin-left: 30px;">
		<img src="<%=request.getContextPath()%>/img/front/home/ad.jpg">
	</div>
	<div id= "recmdHead" style = "width:250px; margin-left:10px; margin-top: 100px;font-weight: bold;border-bottom: 1px solid gray;">
		<p>相似歌手</p>
	</div>
	<div id= "recmdSinger">
		<ul  class="list-inline" style = "margin-top: 10px;margin-left: 10px;">
			<li >
				<div>
					<a href = "#"> <img src="<%=request.getContextPath()%>/img/front/home/linJJ.jpg"></a>					
				</div>
				<a href = "#" style ="clear:both;">林俊杰</a>
			</li>
			<li >
				<div>
					<a href = "#"> <img src="<%=request.getContextPath()%>/img/front/home/sunYZ.jpg"> </a>
				</div>
				<a href = "#" style ="clear:both;">孙燕姿</a>
			</li>
			<li >
				<div>
					<a href = "#"> <img src="<%=request.getContextPath()%>/img/front/home/xueZQ.jpg"> </a>
				</div>
				<a href = "#" style ="clear:both;">薛之谦</a>
			</li>
			<li >
				<div>
					<a href = "#"> <img src="<%=request.getContextPath()%>/img/front/home/yangZW.jpg"> </a>
				</div>
				<a href = "#" style ="clear:both;">杨宗纬</a>
			</li>
		</ul>
	</div>
	
</div>