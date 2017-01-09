<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--顶部分割线-->
<div >
<img src="<%=request.getContextPath()%>/img/front/home/底部横线.png" style="width:100%;height:1pt;"></img>
</div>
<div style="margin-left:280px;margin-right:250px;">
<a href="#">
	<img src="<%=request.getContextPath()%>/img/front/home/logo.png"></img>
	<span>音乐人招募计划</span>
</a>

<a>
	<span>关于我们</span>
	
</a>
</div>

<script src="<%=request.getContextPath()%>/js/common/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<script>
    $(function () {
        $('#myTab a[href="#profile"]').tab('show');
    });
	
</script>