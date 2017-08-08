 <%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://displaytag.sf.net"  prefix="display"%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>审批书籍-校园二手书交易</title>
    
	<link rel="stylesheet"  href="<%=basePath%>/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="<%=basePath%>/css/admin.css"/>
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">

  </head>
  
  <body>
  
     <s:set name="label_rownum" value="%{getText('label_rownum')}"/>
     <s:set name="book_label_name" value="%{getText('book_label_name')}"/>
     <s:set name="book_label_price" value="%{getText('book_label_price')}"/>
     <s:set name="book_label_type" value="%{getText('book_label_type')}"/>
     <s:set name="book_label_pic" value="%{getText('book_label_pic')}"/>
     
     
     <h1>书籍审批平台</h1>
     
     <table class="table table-hover">
      <tr>
		  <th> 编号</th>
		  <th> 图片</th>
		  <th> 书名</th>
		  <th> 类型</th>		  
		  <th> 价格</th>
		  <th> 操作</th>					    
	   </tr>
        <c:forEach  var="book" items="${books}">
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
		    	     <span>${book.price}</span>
		    	</td>
		    	<td>
		    	     <span>
		    	        <s:url action="Book_checkedPass" id="checkedPass">
		     				<s:param name="id" value="%{#attr.book.id}"/>
		     			</s:url>
		     			<a href="${checkedPass}" class="btn btn-primary" role="button">审核通过</a>
		    	     </span>
		    	</td>					    
	    	</tr>
	    </c:forEach>
	</table>
     	
    </div> 	
    
     
    
  </body>
</html>
