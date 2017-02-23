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
	<span class="name f-thide">${sessionScope.user.username}<a href="<%=request.getContextPath()%>/home/personMsg">修改头像</a></span>
	</div>
	<div class="hd f-cb">
	<i class="type u-icn u-icn-13"></i>
	<form name="form1" action="ProductServlet?type=updateProduct" method="post" enctype="multipart/form-data" onSubmit="return fun_check_form()">
<table cellspacing="1" cellpadding="4" width="100%" class="tableborder"
	id="table3">

	<tr>
		<td class="altbg1">昵称</td>
		<td class="altbg2" colspan="11"><input type="text" name="serialNumber" size="34" value="${currentUser.username}" ></td>
	</tr>
	<tr>
		<td class="altbg1">电话</td>
		<td class="altbg2" colspan="11"><input type="text" name="name" size="34" value="${currentUser.tel}"readonly="readonly"></td>
		
	</tr>
	<tr>
		<td class="altbg1">邮箱</td>
		<td class="altbg2" colspan="11"><input type="text" name="brand" size="34" value="${currentUser.email}"></td>
	</tr>
	<tr>
		<td class="altbg1">年龄</td>
		<td class="altbg2" colspan="11"><input type="text" name="model" size="34" value="${currentUser.age}"></td>
	</tr>
	
	<tr>
		<td class="altbg1"></td><!-- 提交检验 -->
		<td class="altbg2" colspan="11"><input type="submit" value="修改" name="B1" /> &nbsp; <input type="reset" value="重置" name="B2" /></td>
	</tr>

</table>
</form>
	</div>
	</div></div></div></div></div>


</div>
</div>
