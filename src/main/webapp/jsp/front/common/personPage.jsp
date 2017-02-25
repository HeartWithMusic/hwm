<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ page isELIgnored="false" %> 
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<style>
		#user_whole {
			width:1000px;
			margin:0 auto;
			min-height:700px;
			border:1px solid #d3d3d3;
			background-color: white;
		}	
		
		#user_whole_padding {
			padding:40px;
		}
</style>
<div id="user_whole">
	<div id="user_whole_padding">
		<div id="user_header" style="border-bottom: 2px solid #c20c0c;overflow:hidden;margin-bottom:10px;">
				<h4><i class="glyphicon glyphicon-user" style="float:left;margin-left:3px"></i><span style="margin-left:5px;">编辑个人信息</span></h4>
		</div>
		<% String action = request.getContextPath() + "/user/updateUserInfo?id=${sessionScope.user.id}";%>
		<sf:form class="form-horizontal" role="form" style="float:left;width: 550px;overflow: hidden;padding-left: 100px;" method="post" modelAttribute="currentUser" action="<%=action %>" enctype="multipart/form-data" >
                      <div class="form-group">
                        <label>用户名</label>
                        <sf:input style="width:400px" type="text" class="form-control" data-required="true" path="username"></sf:input>
                      </div>
                      <div class="form-group">
                        <label>邮箱</label>
                        <sf:input style="width:400px" type="text" class="form-control" data-required="true" path="email"></sf:input>
                      </div>
                      <div class="form-group">
                        <label>电话</label>
                        <sf:input style="width:400px" type="text" class="form-control" data-required="true" path="tel"></sf:input>
                      </div>
                      <div class="form-group">
						    <label for="name">年龄</label>
						    <sf:select class="form-control" path="age" style="width:400px;">
						      <c:forEach begin="0" end="120" var="i">
						      	<sf:option value="${i}"></sf:option>
						      </c:forEach>	
						    </sf:select>
                      </div>
                      <div id="file" class="form-group" style="display:none;">
                         <label>封面</label><br/>
                         <input name="imageInfo" style="width:400px" type="file"  >
                      </div>
               		  <div class="form-group">
					    <div style="margin-left:286px;margin-top:25px;" class="col-sm-offset-2 col-sm-10">
					      <span style="color:red;"><c:out value="${message }" ></c:out></span>
					      <button style="width:100px;" type="submit" class="btn btn-default">保存</button>
					    </div>
					  </div>
		</sf:form>
		<div style="float: left;margin: 25px;">
				<img style="width:191px;border:2px solid #d3d3d3;border-radius:5px;padding:3px;" src="http://p1.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=200y200"></a>
				<a href="#" onclick="showFile()">
					<c:choose>
						<c:when test="${currentUser.img == 0 }">
							<div style="width:209px;height:35px;background-repeat:no-repeat;background-image:url('<%=request.getContextPath()%>/img/front/home/bottomBg.png');opacity:0.8;position:relative;top:-25px;color:#ccc;left:0px;">
								<i style="margin-left: 65px;margin-top: 2px;font-size: 15px;">更换头像</i>
							</div>
						</c:when>
						<c:when test="${currentUser.img != 0 }">
							<div style="width:209px;height:35px;background-repeat:no-repeat;background-image:url('<%=request.getContextPath()%>/static/user/${currentUser.img}');opacity:0.8;position:relative;top:-25px;color:#ccc;left:0px;">
								<i style="margin-left: 65px;margin-top: 2px;font-size: 15px;">更换头像</i>
							</div>
						</c:when>
					</c:choose>
					
				</a>
		</div>
	</div>
</div>
<!-- <div id="musicList">
	<div class="f-pr">
<div class="j-flag" id="auto-id-3RUC65BISpr0c08v"> <div class="g-wrap"><div class="cnt">
	<div class="cntc m-info">
	<div class="user f-cb">
	<a class="face" href="/user/home?id=365946911">
	<img src="http://p1.music.126.net/VnZiScyynLG7atLIZ2YPkw==/18686200114669622.jpg?param=200y200"></a>
	<span class="name f-thide">${sessionScope.user.username}<a href="<%=request.getContextPath()%>/home/personMsg">修改头像</a></span>
	</div>
	<div class="hd f-cb">
	<i class="type u-icn u-icn-13"></i>
	<form name="form1" action="<%=request.getContextPath()%>/home/updateCurrentUser" method="post">
<table cellspacing="1" cellpadding="4" width="100%" class="tableborder"
	id="table3">

	<tr>
		<td class="altbg1">昵称</td>
		<td class="altbg2" colspan="11"><input type="text" name="userName" size="34" value="${currentUser.username}" ></td>
	</tr>
	<tr>
		<td class="altbg1">电话</td>
		<td class="altbg2" colspan="11"><input type="text" name="userTel" size="34" value="${currentUser.tel}"></td>
		
	</tr>
	<tr>
		<td class="altbg1">邮箱</td>
		<td class="altbg2" colspan="11"><input type="text" name="email" size="34" value="${currentUser.email}"></td>
	</tr>
	<tr>
		<td class="altbg1">年龄</td>
		<td class="altbg2" colspan="11"><input type="text" name="userAge" size="34" value="${currentUser.age}"></td>
	</tr>
-->	
	<!-- <tr>
		<td class="altbg1"></td>提交检验 
		<td class="altbg2" colspan="11"><input type="submit" value="修改" name="B1" /> &nbsp; <input type="reset" value="重置" name="B2" /></td>
	</tr>-->
<!--  
</table>
</form>
	</div>
	</div></div></div></div></div>


</div>
</div>-->
<script>
	function showFile() {
		$("#file").css("display","block");
	}
</script>