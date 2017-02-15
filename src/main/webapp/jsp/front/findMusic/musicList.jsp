<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/css/front/findMusic/musicList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/front/findMusic/album.css" rel="stylesheet">
<div id="musicList">
	<div id="musicList_choose">
		<span style="font-size: 25px;">全部</span>
		<button id="musicList_chooseBtn" type="button" class="btn btn-default" title="<button type='button' class='btn btn-default'>全部分类</button>"
			data-container="body" data-toggle="popover" data-placement="bottom" 
			data-content='
			
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-flag"></span><span style="margin-left:10px;">语言</span></div>
						<div class="musicList_right">
							<a href="#">华语</a>
							<span class="musicList_line">|</span>
							<a href="#">英语</a>
							<span class="musicList_line">|</span>
							<a href="#">粤语</a>
							<span class="musicList_line">|</span>
							<a href="#">韩语</a>
							<span class="musicList_line">|</span>
							<a href="#">日语</a>
							<div>
						</div>
					</div>
					</div>
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-headphones"></span><span style="margin-left:10px;">风格</span></div>
						<div class="musicList_right">
							<a href="#">流行</a>
							<span class="musicList_line">|</span>
							<a href="#">摇滚</a>
							<span class="musicList_line">|</span>
							<a href="#">民谣</a>
							<span class="musicList_line">|</span>
							<a href="#">说唱</a>
							<span class="musicList_line">|</span>
							<a href="#">电子</a>
							<span class="musicList_line">|</span></span>
							<br>
							<a href="#">古风</a>
							<span class="musicList_line">|</span>
							<a href="#">轻音乐</a>
							<span class="musicList_line">|</span>
							<a href="#">金属</a>
							<div>
						</div>
					</div>
					</div>
					
					<div class="musicList_menu">
						<div class="musicList_left"><span class="glyphicon glyphicon-road"></span><span style="margin-left:10px;">场景</span></div>
						<div class="musicList_right">
							<a href="#">清晨</a>
							<span class="musicList_line">|</span>
							<a href="#">夜晚</a>
							<span class="musicList_line">|</span>
							<a href="#">学习</a>
							<span class="musicList_line">|</span>
							<a href="#">工作</a>
							<span class="musicList_line">|</span>
							<a href="#">午休</a>
							<span class="musicList_line">|</span></span>
							<br>
							<a href="#">地铁</a>
							<span class="musicList_line">|</span>
							<a href="#">驾车</a>
							<span class="musicList_line">|</span>
							<a href="#">运动</a>
							<span class="musicList_line">|</span>
							<a href="#">旅行</a>
							<span class="musicList_line">|</span>
							<a href="#">散步</a>
							<div>
						</div>
					</div>
					</div>
					
			'>
			选择分类<span class="glyphicon glyphicon-chevron-down" style="vertical-align:middle;margin-left:8px;"></span>
		</button>
	</div>
	<div id="songpicture">
		<ul >
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
		
			<ul id="second">
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
			<ul id="second">
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
			<ul id="second">
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
			<ul id="second">
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
			<ul id="second">
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
			<ul id="second">
				<li style="margin-left:5px;">
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
							<a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div> 	
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br><a href="#">周杰伦</a>
					</div>
				</li>
				<li>
					<div>
						<a href="#"><img src="<%=request.getContextPath()%>/img/front/home/balloon.png" alt="通用的占位符缩略图"
							></a></br>
						<a href="#">周杰伦</a>
					</div>
				</li>
			</ul>
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
</script>