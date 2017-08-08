<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net"  prefix="display"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>在库书籍管理</title>
    <script>
	//放大图片
	function over(src){
		x=event.clientX-300;
		y=event.clientY-200;
		
		document.all.tip.style.display="block";
		document.all.tip.style.top=y;
		document.all.tip.style.left=x;
		document.all.photo.src=src;
	}
	function out(){
		document.all.tip.style.display="none";
	}
    </script>
	<link rel="stylesheet"  href="<%=basePath%>/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="<%=basePath%>/css/admin.css" />
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
  </head>
  <body>
   <main>
   
    <h1>浏览所有订单</h1>
     
   	<div class="admin_browseAllRegBooks">
     	 <table class="table table-hover">
	      <tr>
			  <th> 订单号</th>
			  <th> 买家</th>
			  <th> 出售者</th>
			  <th> 书籍</th>	
			  <th> 交易额</th>		  
			  <th> 状态</th>
			  <th> 操作</th>					    
		   </tr>
	        <c:forEach  var="order" items="${allOrders}">
			   <tr>
			    	<td> 
			    		<span >${order.id}</span>
			    	</td>
			    	<td>
			    	    <img alt="${book.name}" src="<%=basePath%>bookPics/${book.pic}" width="100px" height="100px"/>
			    		
			    	</td>
			    	<td>
			    		<span>${book.name}</span>
			    	</td>
			    	<td>
			    	     <span>${book.type}</span>
			    	</td>
			    	<td>
			    	     <span>${book.state}</span>
			    	</td>
			    	<td>
			    	     <span>${book.price}</span>
			    	</td>
			    	<td>
			    	     <span>
			    	        <s:url action="Book_checkedPass" id="checkedPass">
			     				<s:param name="id" value="%{#attr.book.id}"/>
			     			</s:url>
			     			<a href="${checkedPass}">审核通过</a>
			     			<a href="${toEditBook}">重新编辑</a>
			    	     </span>
			    	</td>					    
		    	</tr>
		    </c:forEach>
	</table>
     </div>
     </main>
     
     <!-- 图片查看工具 -->
     <div id="tip" style="position: absolute;display:none;border: 1px;border-style: solid;">
     	<img id="photo" src="" height="450px" width="300px"/>
     </div>
  </body>
</html>
