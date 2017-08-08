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
   
    <h1>在库书籍管理</h1>

   	
   	
   	 <s:set name="label_rownum" value="%{getText('label_rownum')}"/>
     <s:set name="label_rownum" value="%{getText('label_rownum')}"/>
     <s:set name="book_label_price" value="%{getText('book_label_price')}"/>
     <s:set name="book_label_type" value="%{getText('book_label_type')}"/>
     <s:set name="book_label_pic" value="%{getText('book_label_pic')}"/>
     <s:set name="book_label_edit" value="%{getText('book_label_edit')}"/>
     
     
   	<div class="admin_browseAllRegBooks">
     	 <table class="table table-hover">
	      <tr>
			  <th> 序号</th>
			  <th> 图片</th>
			  <th> 书名</th>
			  <th> 类型</th>	
			  <th> 状态</th>		  
			  <th> 价格</th>
			  <th> 操作</th>					    
		   </tr>
	        <c:forEach  var="book" items="${allRegBooks}">
			   <tr>
			    	<td> 
			    		<span class="number">${book.id}</span>
			    	</td>
			    	<td>
			    	   <a href="webs/Book_queryBookInfo.action?id=${book.id }" target="_blank">
			    	    <img alt="${book.name}" src="<%=basePath%>bookPics/${book.pic}" width="100px" height="100px"/>
			    	  </a>
			    	</td>
			    	<td>
			    	 <a href="webs/Book_queryBookInfo.action?id=${book.id }" target="_blank">
			    		<span>${book.name}</span>
			    	   </a>
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
			     			<s:url action="Book_toEditBook" id="toEditBook">
			     				<s:param name="id" value="%{#attr.row.id}"/>
			     			</s:url>
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
