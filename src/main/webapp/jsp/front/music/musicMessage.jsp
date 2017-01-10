<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
		var pathLrc ="/hwm/music/lrc/" ;
		var lyricSrc1 = [pathLrc+"阳光宅男.lrc"];
		
		function loadLyric1(lyric) {
			var lyricContent = $('#lrc');
			lyricContent.html("");
			_.each(lyric, function(content, index, $){
				lyricContent.append('<p name="lyric" id=' + index + '>' + content[1] + '</p>');
			});
		}
		//获取歌词
		function parseLyric1(lyric) {
			var lines = lyric.split('\n'),
				pattern = /\[\d{2}:\d{2}.\d{2}\]/g,
				result = [];
			while (!pattern.test(lines[0])) {
				lines = lines.slice(1);
			};
			lines[lines.length - 1].length === 0 && lines.pop();
			_.each(lines, function(data, step){
				var index = data.indexOf(']');
				var time = data.substring(0, index+1),
					value = data.substring(index+1);
				var timeString = time.substring(1, time.length-2);
				var timeArr = timeString.split(':');
				result.push([parseInt(timeArr[0], 10) * 60 + parseFloat(timeArr[1]), value]);

			});
			result.sort(function(a, b) {
				return a[0] - b[0];
			});
			return result;
		}
		$.get(lyricSrc1[0], function(lrc) {
						lyric = parseLyric1(lrc);
						//alert();
						console.info(lyric);
						//debugger
						loadLyric1(lyric);
						//palyMusic(0);
					});

		</script>
		<script type="text/javascript">  
    function goTopEx() {  
        var obj = document.getElementById("goTopBtn");  
        function getScrollTop() {  
            return document.documentElement.scrollTop + document.body.scrollTop;  
        }  
        function setScrollTop(value) {  
            if (document.documentElement.scrollTop) {  
                document.documentElement.scrollTop = value;  
            } else {  
                document.body.scrollTop = value;  
            }  
        }  
        window.onscroll = function() {  
            getScrollTop() > 0 ? obj.style.display = "": obj.style.display = "none";  
        }  
        obj.onclick = function() {  
            var goTop = setInterval(scrollMove, 10);  
            function scrollMove() {  
                setScrollTop(getScrollTop() / 1.1);  
                if (getScrollTop() < 1) clearInterval(goTop);  
            }  
        }  
    }  
</script>  
	<div id="musicMess" style="width:1000px;margin:0 auto;overflow:hidden;background-color:white;1px solid #d3d3d3;border-right:1px solid #d3d3d3;">
		<div id="musicMess_left" style = "width: 680px;float:left;border-right:1px solid #d3d3d3;">
				<!--中间-->
				<div id="musicMess_left_top" style = "width:580px;height:1450px;margin: 47px 30px 40px 39px;">
									<!--歌曲信息？-->
						<div id="musicMess_left_top_left" style = "width:198px;height:198px;"> 		<!--专辑封面-->
							<img src = "<%=request.getContextPath()%>/img/front/home/jay_wohenmang.jpg" style = "width:125px;height:120px; margin:34px;margin-top:36px;float:left;">
							<img src = "<%=request.getContextPath()%>/img/front/home/1.png" style = "width:180px;height:180px; margin-left:10px;margin-top:-185px;float:left;">
						</div>
						
						<div id="musicMess_left_top_right" style = "width:380px;height:600px;margin-top:-200px;float:right;">  <!--详细信息-->						
							<div style = "width:380px;height:50px;">		<!--head标题-->
								<i style = "float:left;margin-top:5px;"><img src = "<%=request.getContextPath()%>/img/front/home/danqu.png"></img></i>

								<p style = "font-size:24px;font-family:Microsoft Yahei;margin-left:60px;">阳光宅男<p/>
							</div>
							
							<div style = "width:380px;height:50px;font-size:12px;font-family:Arial;color:#999;">	<!--歌曲歌手名称-->
								<p style = "width:50px;">歌手：</p>  <a href = "#" style = "float:left;margin-top:-27px;margin-left:40px;">周杰伦</a>
								<p style = "width:70px;">所属专辑：</p>  <a href = "#" style = "float:left;margin-top:-27px;margin-left:60px;">我很忙</a>
							</div>
							
							<div style = "width:380px;height:40px;">	<!--操作-->				
								<button style = "border:0;background-image: url('<%=request.getContextPath()%>/img/front/home/button3.png');width:66px;height:31px;text-align:right;color:white;float:left;">播放</button>
								<button style = "border:0;background-image: url('<%=request.getContextPath()%>/img/front/home/button4.png');width:33px;height:31px;float:left;margin-top:-1px;"></button>
								<button class="btn btn-default" style = "width:50px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;">收藏</button>
								<button class="btn btn-default" style = "width:50px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;">下载</button>
								<a href = "#pinglun" class = "btn btn-default"style = "width:80px;height:29px;float:left;margin-left:10px;font-size:12px;margin-top:1px;">评论（10）</a>
							
							</div>
							<div style = "margin-top:20px;"id = "lrc"> 	<!--歌词-->
								
							</div>
						</div>
			</div>
			<div id="musicMess_left_bottom" style="float:left;margin:50px 10px 50px 280px;">
				<a id = "pinglun"></a>
							<div id = "comment" style = "margin-top:100px;height:100px;">
								<div style = "width:580px;height:33px;margin-left:-200px;border-bottom:2px solid #c20c0c">
									<p> 歌曲评论</p>
								</div>
								<div style = "margin-top:30px;width:580px;margin-left:-200px;height:120px;">
									<img src = "<%=request.getContextPath()%>/img/front/home/touxiang.png" style = "width:50px;height:50px;float:left;" ></img>
									<textarea placeholder="评论" style = "margin-left:20px;width:510px;"></textarea>
									<button class="btn btn-primary" style = "margin-bottom:-70px;margin-left:-60px;">评论</button>
									
								</div>
								<div style = "width:580px;margin-left:-200px;margin-top:10px;margin-bottom:10px;border-bottom:1px solid #ccc;color:black"><p>精彩评论</p></div>
								
		<!--评论文字-->			<div style = "width:580px;height:140px;margin-left:-200px;margin-bottom:50px;border-bottom:1px dotted #ccc;">
									<img src = "<%=request.getContextPath()%>/img/front/home/touxiang.png" style = "width:50px;height:50px;float:left;margin-top:10px;"></img>
									<a href = "#" style = "margin-left:10px;float:left;margin-top:15px;">用户名:</a>
									<p style = "margin-top:16px;float:right;width:460px;">在ktv的时候总会点mine mine 然后把我不配唱进去..阿萨德阿萨德按时啊是的阿萨德阿萨德阿德阿萨德按时.(杰伦总喜欢耍宝..同样的编曲他非要玩两首歌..所以一点都不违和..) 有兴趣的童鞋还可以试试 阳光宅男和公主病 , .....霍元甲和黄金甲....第一次听的观众绝对会嘴巴成o型呆呆瞄着你~~~那时候你就尽情耍帅就行了..</p>	
									 <a href="#" style = "float:right;clear:both;margin-top:-15px;">
									
         								 <span class="glyphicon glyphicon-thumbs-up">  <p style = "display:inline;">100</p></span>
         								
        							 </a>
								</div>
								<div style = "width:580px;height:140px;margin-left:-200px;margin-bottom:50px;border-bottom:1px dotted #ccc;">
									<img src = "<%=request.getContextPath()%>/img/front/home/touxiang.png" style = "width:50px;height:50px;float:left;margin-top:10px;"></img>
									<a href = "#" style = "margin-left:10px;float:left;margin-top:15px;">用户名:</a>
									<p style = "margin-top:16px;float:right;width:460px;">在ktv的时候总会点mine mine 然后把我不配唱进去..阿萨德阿萨德按时啊是的阿萨德阿萨德阿德阿萨德按时.(杰伦总喜欢耍宝..同样的编曲他非要玩两首歌..所以一点都不违和..) 有兴趣的童鞋还可以试试 阳光宅男和公主病 , .....霍元甲和黄金甲....第一次听的观众绝对会嘴巴成o型呆呆瞄着你~~~那时候你就尽情耍帅就行了..</p>	
									 <a href="#" style = "float:right;clear:both;margin-top:-15px;">
									
         								 <span class="glyphicon glyphicon-thumbs-up">  <p style = "display:inline;">100</p></span>
         								
        							 </a>
								</div>
								
								
								
									
								
 							</div>
			</div>
		</div>
		<div id="musicMess_right">
			<p style = "font-size:20px;margin-top:300px;margin-right:100px;">广告 广告</p>
		</div>
	</div>
		
		