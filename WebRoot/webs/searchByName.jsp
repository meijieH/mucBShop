<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.ORM.Student" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net"  prefix="display"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="index_title"></s:text></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
  </head>
  
  <body>
  	<div class="container">
  	
  	<%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
     <s:set name="label1" value="%{getText('label_rownum')}"/>
     <s:set name="label2" value="%{getText('book_label_name')}"/>
     <s:set name="label3" value="%{getText('book_label_price')}"/>
     <s:set name="label4" value="%{getText('book_label_type')}"/>
     <s:set name="label5" value="%{getText('book_label_pic')}"/>
     
  	 <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  		  <div class="mainbody">
		    <%--书籍展示区 --%>
		     <div class="displayTable">
		     	<display:table name="books" id="row" pagesize="10" requestURI="webs/Book_serachByName.action" >
		     		<display:column title="${label1 }" sortable="true" headerClass="sortable" style="text-align:center;">
		     			${row_rowNum}
		     		</display:column>
		     		<display:column  title="${label2}"  style="text-align:center;">
		     			<s:url action="webs/Book_queryBookInfo" id="queryBookInfo">
		     				<s:param name="id" value="%{#attr.row.id}"/>
		     			</s:url>
		     			<a href="${queryBookInfo}">${row.name}</a>
		     		</display:column>
		     		<display:column property="price" title="${label3}" sortable="true" headerClass="sortable" style="text-align:center;"/>
		     		<display:column property="press" title="出版社"  style="text-align:center;"/>
		     		<display:column property="author" title="作者"  style="text-align:center;"/>
		     		<display:column property="subtime" title="出售时间"  style="text-align:center;"/>
		     		<display:column property="type" title="${label4}"  style="text-align:center;"/>
		     		<display:column title="${label5}" style="text-align: center;">
		     			<img src="<%=basePath%>/bookPics/${row.pic}" height="80" width="80">
		     		</display:column>			
		     	</display:table>
		     </div>
		     
		  <%--右侧辅助航标区 --%>
	  	  <%@include file="common/rightbar.jsp"%>	     
		     
       </div>
	 <%--页尾版权区 --%>
	   <div class="footer">
		     <span >
		          muc@URTP项目@二手书
		     </span>
	  </div>
    </div> 
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
