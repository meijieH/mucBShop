<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="e" uri="/eBook" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="title_orderbook"/></title>
    
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
		    <%--菜单栏 --%>
	  	 <%@include file="common/menubar.jsp"%>
	  	 <br>
	  	 <br>
      <div class="addOrder_main" style="heigth:500px !important;">		    
		    <%--卖家信息介绍 --%>
		    <div class="divsellerdescription " style="width:200px;">
		    	<table class="table">
		    		<tr><td colspan="2" class="desc_sellerhead">卖家信息</td></tr>
		    		
		    		<tr><td>昵称：</td><td>${book.student.username}</td></tr>
		    		<tr><td>等级：</td><td>${book.student.level}***</td></tr>
		    		<tr><td>电话：</td><td>${book.student.phonenumber}</td></tr>
		    		<tr><td>邮箱:</td><td>${book.student.email}</td></tr>
		    		<tr><td>${book.student.grade}</td><td>${book.student.major}</td></tr>
		    	</table>
		    </div>
		    
		    <!-- 图片显示区 -->
		    <div class="divbookpic" style="width:300px;height:300px;margin-left:300px;">
		    	<img src="<%=basePath%>/bookPics/${book.pic}"/>
		    </div>
		    
		     <%--书籍信息介绍 --%>
		    <div class="divbookdescription">
		    	<table class="table">
		    		<tr><td colspan="4" class="desc_bookhead">书籍信息</td></tr>
		    		<tr><td >书名:</td><td colspan="3">${book.name}</td></tr><tr/>
		    		<tr><td >售价：</td><td colspan="3">${book.price}书币</td></tr>
		    		<tr><td>类别：</td><td>${book.type}</td><tr>
		    		<tr><td>状态：</td><td>${book.state}</td></tr>
		    		<tr><td>作者/主编:</td><td colspan="3">${book.author}</td></tr><tr/>
		    		<tr><td>出版社：</td><td colspan="3">${book.press}</td></tr>
		    		<tr><td>出售时间:</td><td colspan="3">${book.subtime}</td></tr>
		    		<tr><td>学科：</td><td colspan="3">${book.subject}</td></tr>		    		
		    	</table>
		    </div>
		    <%--提交按钮 --%>
		    <s:form action="Order_addOrder">
		    	<table>
		    		<tr><td>
		    			<s:textfield name="book.id" value="%{#request.book.id}" cssStyle="display:none"/>
		    			<s:textfield name="studentByBuyerId.id" value="%{#session.student.id}" cssStyle="display:none"/>
		    			<s:textfield name="studentBySalerId.id" value="%{#request.book.student.id}" cssStyle="display:none"/>
		    			<s:textfield name="state" value="待付款" cssStyle="display:none"/>
		    			<s:textfield name="count" value="1" cssStyle="display:none"/>
		    		    </td>
		    		</tr>
		    			<td>
		    				<%
		    					SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		    					String now=df.format(new Date(System.currentTimeMillis()));
		    					pageContext.setAttribute("now", now);
		    				 %>
		    			 	<s:textfield name="subDate" value="%{#attr.now}" cssStyle="display:none"/>
		    			</td>
		    		<tr/>
		    	</table>
		    	<br>
		    	<br>
		    	<br>
		    	<div class="addOrder_submit"><s:submit key="addOrder_submit" cssStyle="margin-top:50px;border-radius:4px;margin-left:-70px;border:2px solid RGB(202,242,244);background-color:#02ba85;color:white;font-size:22px;width:120px;height:42px;"/></div> 
		    	
		    </s:form>
	    </div>
	    
	    <%--信息反馈 --%>
	    <s:if test="hasFieldErrors()">
	    <e:msgdialog basepath="<%=basePath%>">
	    	<s:fielderror/>
	    </e:msgdialog>	
	    </s:if>
	    <s:if test="hasActionMessages()">
	    	<e:msgdialog basepath="<%=basePath%>">
	    	<s:actionmessage/>
	    </e:msgdialog>	
	    </s:if>
    </div>
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
