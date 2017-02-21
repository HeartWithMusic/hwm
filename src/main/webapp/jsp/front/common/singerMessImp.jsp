<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
function change(){
	
	$("#coll").attr("src","http://localhost:8080/hwm/img/front/home/collect2.png");
	
}
function change1(){
	
	$("#coll").attr("src","http://localhost:8080/hwm/img/front/home/collect1.png");
	
}

    
</script>

	<div id = "singerMesstop"style = "width:710px;">
		<div id = "head" style = "height:40px;margin-top:30px;">
			<p id = "singerName" style = "float:left;margin-left:50px;font-weight: normal;font-size: 24px;color: #333;">周杰伦</p>
		</div>
		<div id = "singerPic" style = "width:640px;margin:0 auto;">
			<img style = "border:1px solid #d3d3d3;z-index:0;"src = "<%=request.getContextPath()%>/img/front/home/singerPic.png">
			<div style = "margin-left:550px; margin-top: -50px;z-index:666666666;">	
			<a style = "cursor:pointer;"> <img id="coll" onmouseover="change()" onmouseout="change1()" src="<%=request.getContextPath()%>/img/front/home/collect1.png"> </a>
			</div>
		</div>	
	
	</div>		
