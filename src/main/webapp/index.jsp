<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %> 
<style>
	.left_menu {
		float:left;
		border-left:1px solid #DCDCDC;
	}
	.left_menu_header {
		margin-top:20px;
		height:50px;
		border-bottom: 2px solid #C10D0C;"
	}
</style>    
<!--第二层导航栏对应的转换页面-->
<div class="tab-content" style="margin-top:20px;"></div>
<!--“推荐”对应转换页面-->
<!--div class="tab-pane" id="recommend" class="carousel slide" data-ride="carousel"-->

<div id="recommend" class="carousel slide" style="margin-top:-20px;background-image:url('<%=request.getContextPath()%>/img/front/home/bg.png');background-repeat:repeat-x;">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#recommend" data-slide-to="0" class="active"></li>
		<li data-target="#recommend" data-slide-to="1"></li>
		<li data-target="#recommend" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	
	<div class="carousel-inner" >
		<div class="item active">
			<img src="<%=request.getContextPath()%>/img/front/home/picture4.png" alt="First slide" width="700" height="99" style="margin:auto;">
		</div>
		<div class="item">
			<img src="<%=request.getContextPath()%>/img/front/home/picture2.png" alt="Second slide"  width="700" height="99" style="margin:auto;">
		</div>
		<div class="item">
			<img src="<%=request.getContextPath()%>/img/front/home/picture3.png" alt="Third slide"  width="700" height="99" style="margin:auto;">
		</div>
	</div>
	
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#recommend" 
	   data-slide="prev"  style="width:50px;height:90px; margin-top:130px;margin-left:250px;font-size:60px;background-image:url('<%=request.getContextPath()%>/img/front/home/bg.png');	">&lsaquo;</a>
	<a class="carousel-control right" href="#recommend" 
	   data-slide="next"  style="width:50px;height:90px; margin-top:130px;margin-right:250px;font-size:60px;background-image:url('<%=request.getContextPath()%>/img/front/home/bg.png');">&rsaquo;</a>
</div> 
<!-- 整体div -->
<div style="margin:0 auto;width:1000px;padding:0px;background:white;overflow:hidden;">
	<!-- 热门搜索栏  导航栏-->
	<div style="width:750px;float:left;">
		<!-- 热门推荐 -->
		<div class="left_menu">
			<div class="left_menu_header">
				<ol class="breadcrumb" style="background:none;height:30px;" >
					<li><a href="#" style="font-size:15pt; color:black;">热门推荐</a></li>
					<li><a href="#" style="color:gray;">华语</a></li>
					<li><a href="#" style="color:gray;">流行</a></li>
					<li><a href="#" style="color:gray;">摇滚</a></li>
					<li><a href="#" style="color:gray;">民谣</a></li>
					<li><a href="#" style="color:gray;">电子</a></li>
					<a href="#" style="margin-left:320px;color:gray;">更多<img src="<%=request.getContextPath()%>/img/front/home/more.png" style="margin-top:-5px;"></img></a>
				</ol>
			</div>
			<!--缩略图  热门推荐栏-->
			<div class="row">
					
			    <div class="col-sm-6 col-md-3" style="margin-left:30px;margin-top:30px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:30px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			     <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:30px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:30px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			</div>
			<div class="row">
			    <div class="col-sm-6 col-md-3" style="margin-left:30px;margin-top:15px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:15px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			     <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:15px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:15px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			</div>
		</div>
		
		<!--个性化推荐   导航栏-->
		<div class="left_menu">
			<div class="left_menu_header">
				<ol class="breadcrumb" style="background:none;height:30px;" >
					<li><a href="#" style="font-size:15pt;color:black;">个性化推荐</a></li>
				</ol>
			</div>
			
			<!-- 缩略图   个性化推荐-->
			
			<div class="row">
			    <div class="col-sm-6 col-md-3" style="margin-left:30px;margin-top:20px;	height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			     <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			    <div class="col-sm-6 col-md-3" style="margin-left:0px;margin-top:20px;height:200px;width:185px">
			        <a href="#" class="thumbnail" style="height:160px;width:150px">
			            <img src="<%=request.getContextPath()%>/img/front/home/music1.png"
			                 alt="通用的占位符缩略图"
							style="height:150px;width:150px">
			        </a>
					<div style="width:140px;height:25px;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-49px;color:#ccc;left:6px;">
						点击量:100万
					</div>
					<div style="width:140px;height:25px;margin-left:10px;margin-top:-45px;"><a href="#" style="color:black;">我们的歌</a></div>
			    </div>
			</div>
		</div>
		
		<!-- 新碟上架-->
		<div class="left_menu">
			<div class="left_menu_header" >
				<ol class="breadcrumb" style="background:none;" >
					<li><a href="#" style="font-size:15pt;color:black;">新碟上架</a></li>
					<a href="#" style="margin-left:560px;color:gray;">更多<img src="<%=request.getContextPath()%>/img/front/home/more.png" style="margin-top:-5px;"></img></a>
				</ol>
			</div>
			
			<!--新碟上架  滚轮-->
			<div id="newdish" class="carousel slide" style="margin-top:30px;margin-left:20px;width:720px;background:none repeat scroll 0% 0% #F5F5F5;">
				<!-- 轮播（Carousel）指标 -->
				<!--<ol class="carousel-indicators">
					<li data-target="#newdish" data-slide-to="0" class="active"></li>
					<li data-target="#newdish" data-slide-to="1"></li>
					<li data-target="#newdish" data-slide-to="2"></li>
				</ol>-->   
				<!-- 轮播（Carousel）项目 -->
				
				<div class="carousel-inner" style="margin-top:20px;">
					<div class="item active">
						<li>
							<div class="item active" >
								<a class='msk' href="#" style="margin-left:53px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
							</div>
						</li>
					</div>
					<div class="item">
						<li>
							<div class="item active" >
								<a class='msk' href="#" style="margin-left:53px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
							</div>
						</li>
					</div>
					<div class="item">
						<li>
							<div class="item active" >
								<a class='msk' href="#" style="margin-left:53px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
								<a class='msk' href="#" style="margin-left:23px;">
									<img class='j-img' src="<%=request.getContextPath()%>/img/front/home/music1.png"></img>
								</a>
							</div>
						</li>
					</div>
			</div>
			
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#newdish" 
			   data-slide="prev"  style="width:30px;height:50px; margin-top:20px;font-size:40px;background:none repeat scroll 0% 0% #F5F5F5">&lsaquo;</a>
			<a class="carousel-control right" href="#newdish" 
			   data-slide="next"  style="width:30px;height:50px; margin-top:20px;font-size:40px;background:none repeat scroll 0% 0% #F5F5F5">&rsaquo;</a>
		</div>
		</div>
		
		<!-- 榜单 -->	
		<div class="left_menu">
			<div class="left_menu_header">
				<ol class="breadcrumb" style="background:none;">
					<li><a href="#" style="font-size:15pt;color:black;">榜单</a></li>
					<a href="#" style="margin-left:600px;color:gray;">更多<img src="<%=request.getContextPath()%>/img/front/home/more.png" style="margin-top:-5px;"></img></a>
				</ol>
			</div>
			
			<!--榜单 -->
			<div class="row" id="top-flag"  style="margin-left:30px;margin-top:20px;width:690px;background-image:url('<%=request.getContextPath()%>/img/front/home/rankListBg.png')">
				<div  class="col-sm-6 col-md-3" style="width:220px;" >
				<dl style="width:212px;">
					<dt class="top" style="width:212px;">
						<div style="margin-left:5px;width:100px;float:left;" >
							<a href="#"><img class="j-img" src="<%=request.getContextPath()%>/img/front/home/soar.png"  style="width:80px;height:80px;margin-top:20px;"></img></a>
						</div>	
						<div style="margin-left:5px;width:100px;height:100px;display:inline-block;">
							<a href="#" style="float:right;margin-right:10px;margin-top:30px;">云音乐飙升榜</a>
							<!--需要加一个触发事件，鼠标经过下面图片时  改变图片  点击图片时 开始播放音乐-->
							<img class="j-img" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"  style="float:right;margin-top:6px;margin-right:70px;width:30px;height:30px;"></img>
							<img class="j-img" src="<%=request.getContextPath()%>/img/front/home/collectBtn1.png"  style="float:right;margin-top:-30px;margin-right:30px;width:30px;height:30px;"></img>
						</div>
						
					</dt>
					<dd style="width:215px;">
						<ol>
						<li style="margin-top:26px;">
						<span></span>
						<a href="#" >告白气球</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">明明就</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">算什么男人</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">白色的风车</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>			
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						</ol>
						<div style="margin-left:150px;">
						<a href="#" style="font-size:10pt;">查看更多></a>
						</div>
					</dd>		
				</dl>
				</div>
				<div  class="col-sm-6 col-md-3" style="width:220px;" >
				<dl style="width:212px;">
					<dt class="top" style="width:212px;">
						<div style="margin-left:15px;width:90px;float:left;" >
							<a href="#"><img class="j-img" src="<%=request.getContextPath()%>/img/front/home/newMusic.png"  style="width:80px;height:80px;margin-top:20px;"></img></a>
						</div>	
						<div style="margin-left:5px;width:100px;height:100px;display:inline-block;">
							<a href="#" style="float:right;margin-right:10px;margin-top:30px;">云音乐新歌榜</a>
							<img class="j-img" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"  style="float:right;margin-top:6px;margin-right:70px;width:30px;height:30px;"></img>
							<img class="j-img" src="<%=request.getContextPath()%>/img/front/home/collectBtn1.png"  style="float:right;margin-top:-30px;margin-right:30px;width:30px;height:30px;"></img>
						</div>
					</dt>
					<dd style="width:215px;">
						<ol>
						<li style="margin-top:26px;">
						<span></span>
						<a href="#" >我们的歌</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">海贼王</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">龙卷风</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>			
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						</ol>
						<div style="margin-left:150px;">
						<a href="#" style="font-size:10pt;">查看更多></a>
						</div>
					</dd>		
				</dl>
				</div>
				<div  class="col-sm-6 col-md-3" style="width:220px;" >
				<dl style="width:212px;">
					<dt class="top" style="width:230px;">
						<div style="margin-left:25px;width:60px;float:left;" >
							<a href="#"><img class="j-img" src="<%=request.getContextPath()%>/img/front/home/original.png"  style="width:80px;height:80px;margin-top:20px;"></img></a>
						</div>	
						<div style="margin-left:18px;width:120px;height:100px;display:inline-block;">
							<a href="#" style="float:right;margin-right:10px;margin-top:30px;">网易原创歌曲榜</a>
							<img class="j-img" src="<%=request.getContextPath()%>/img/front/home/playBtn1.png"  style="float:right;margin-top:6px;margin-right:70px;width:30px;height:30px;"></img>
							<img class="j-img" src="<%=request.getContextPath()%>/img/front/home/collectBtn1.png"  style="float:right;margin-top:-30px;margin-right:30px;width:30px;height:30px;"></img>
						</div>
					</dt>
					<dd style="width:215px;">
						<ol>
						<li style="margin-top:26px;">
						<span></span>
						<a href="#" >我们的歌</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">海贼王</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">龙卷风</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>			
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						<li style="margin-top:12px;">
						<span></span>
						<a href="#">春风十里</a>
						</li>
						</ol>
						<div style="margin-left:150px;">
						<a href="#" style="font-size:10pt;">查看更多></a>
						</div>
					</dd>		
				</dl>
				</div>
		</div>
			
	</div>
	</div>
	<!--右侧栏-->
	<div style="float:right;margin-top:2px;width:250px;">
		<!-- 没有登录显示-->
		<!--<div style="background: 	#F5F5F5;border:1px solid  #DCDCDC">
			<p style="font-size:10pt;margin-left:20px;margin-right:20px;margin-top:15px;">
				登录网易云音乐，可以享受无限收藏的乐趣，并且无限同步到手机
			</p>
			<button type="button" class="btn btn-danger" style="margin-left:50px;margin-top:10px;margin-bottom:15px;">用户登录</button>
		</div>
		-->
		<!--登录之后显示-->
		<div style="height:200px;background: #F5F5F5;border:1px solid #DCDCDC">
			<div>
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/personImg.png" style="margin-left:20px;margin-top:20px;width:75px;height:90px;">
				</a>
				<a href="#" style="float:right;margin-right:100px;padding-top:18px;"><strong>${sessionScope.user.username}<strong></a>
				<a href="#" style="float:right;margin-right:95px;margin-top:-70px;color:#A9A9A9"><i>LV.${sessionScope.user.level}</i></a>
				 <button type="button" class="btn btn-primary btn-sm" style="width:100px;float:right;margin-right:25px;margin-top:-35px;">签到</button>
				
			</div>
				<ul style="margin-left:10px;margin-top:20px;">
					<li style="margin-left:-30px;float:left;list-style:none;"><a href="#" style="color:gray;font-size:15pt;">10</a></br><a style="font-size:10pt;color:gray;">动态</a></li>
					<li style="margin-left:35px;float:left;list-style:none;"><a href="#" style="color:gray;font-size:15pt;">100</a></br><a style="font-size:10pt;color:gray;">关注</a></li>
					<li style="margin-left:35px;float:left;list-style:none;"><a href="#" style="color:gray;font-size:15pt;">100</a></br><a style="font-size:10pt;color:gray;">粉丝</a></li>
				</ul>
		</div>
		
	<!--入驻歌手-->	
		<div style="border:1px solid #DCDCDC;">
			<div style="margin-top:20px;">
				<a style="margin-left:20px;">入驻歌手</a>
				<a style="margin-left:70px;color:gray;font-size:10pt;">查看全部></a>
			</div>
			<div>
				<img src="<%=request.getContextPath()%>/img/front/home/bottomLine.png" style="width:90%;margin-left:10px;;height:1pt;"></img>
			</div>
	
			
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;background: #F5F5F5;border:1px solid #DCDCDC;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/singer1.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:50px;margin-top:10px;">
					<a>张惠妹aMei</a></br>
					<a style="font-size:8pt;color:gray;">台湾歌手张惠妹</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;background: #F5F5F5;border:1px solid #DCDCDC">
					<a href="#">
						<img src="<%=request.getContextPath()%>/img/front/home/singer1.png" style=";width:px;height:px;">
					</a>
					<div style="float:right;margin-right:50px;margin-top:10px;">
					<a>张惠妹aMei</a></br>
					<a style="font-size:8pt;color:gray;">台湾歌手张惠妹</a>
					</div>
			</div>
				<div style="margin-left:25px;margin-right:25px;margin-top:10px;background: #F5F5F5;border:1px solid #DCDCDC">
					<a href="#">
						<img src="<%=request.getContextPath()%>/img/front/home/singer1.png" style=";width:px;height:px;">
					</a>
					<div style="float:right;margin-right:50px;margin-top:10px;">
						<a>张惠妹aMei</a></br>
						<a style="font-size:8pt;color:gray;">台湾歌手张惠妹</a>
					</div>
				</div>
				<div style="margin-left:25px;margin-right:25px;margin-top:10px;background: #F5F5F5;border:1px solid #DCDCDC">
					<a href="#">
						<img src="<%=request.getContextPath()%>/img/front/home/singer1.png" style=";width:px;height:px;">
					</a>
					<div style="float:right;margin-right:50px;margin-top:10px;">
					<a>张惠妹aMei</a></br>
					<a style="font-size:8pt;color:gray;">台湾歌手张惠妹</a>
					</div>
				</div>
				<div style="margin-left:25px;margin-right:25px;margin-top:10px;background: #F5F5F5;border:1px solid #DCDCDC">
					<a href="#">
						<img src="<%=request.getContextPath()%>/img/front/home/singer1.png" style=";width:px;height:px;">
					</a>
					<div style="float:right;margin-right:50px;margin-top:10px;">
					<a>张惠妹aMei</a></br>
					<a style="font-size:8pt;color:gray;">台湾歌手张惠妹</a>
					</div>
				</div>
				<div style="margin-left:40px;margin-right:20px;margin-top:20px;margin-bottom:20px;">
			 		<button type="button" class="btn btn-default">申请成为网易音乐人</button>	
			 	</div>
		</div>
	    <!--热门DJ-->
		<div style="border:1px solid #DCDCDC;height:931px;">
			<div style="margin-top:20px;">
				<a style="margin-left:20px;">热门DJ</a>
			
			</div>
			<div>
				<img src="<%=request.getContextPath()%>/img/front/home/bottomLine.png" style="width:90%;margin-left:10px;;height:1pt;"></img>
			</div>
	
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
			<div style="margin-left:25px;margin-right:25px;margin-top:10px;">
				<a href="#">
					<img src="<%=request.getContextPath()%>/img/front/home/hotDj.png" style=";width:px;height:px;">
				</a>
				<div style="float:right;margin-right:15px;margin-top:4px;">
					<a href="#">DJ苏晓</a></br>
					<a style="font-size:8pt;color:gray;">独立DJ，CRI环球旅游广播</a>
				</div>
			</div>
		</div>
	</div>
</div>

