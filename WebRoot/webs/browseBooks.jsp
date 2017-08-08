<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net"  prefix="display"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="title_browseMyBooks"></s:text></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	  <script type="text/javascript">
	   var xmlHttp;
	   var x;
	   var y;
	   function createXMLHttpRequest(){
		   if(window.ActiveXObject)
		   {
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		   }else if(window.XMLHttpRequest){
		   	xmlHttp=new XMLHttpRequest();
		   }	
		}
	   function over(id){
		   x=event.clientX;
		   y=event.clientY;
		   
		 
		   //创建一个XMLRequest对象
		   createXMLHttpRequest();
		   //将状态触发器绑定到一个函数
		   xmlHttp.onreadystatechange=processor;
		   //建立一个对服务器的调用
		   xmlHttp.open("GET","webs/Order_bookInfo.action?id="+id);
		   //发送请求
		   xmlHttp.send(null);
		   
	   }
	   //处理从服务器返回的XML文档
	   function processor(){
		   //定义一个变量用于存放从服务器返回的结果
		   var result;
		   if(xmlHttp.readyState==4){//如果响应结束
		   		if(xmlHttp.status==200){//如果返回成功
				    
					result=xmlHttp.responseText;
					document.all.tip.style.display="block";
					document.all.tip.style.top=y+20;
					document.all.tip.style.left=x+20;
					document.all.tip.innerHTML=result;
					}
			   }
		}
		//
		function mout()
		{
			document.all.tip.style.display="none";
		}
	</script>
  </head>
  
 
  <body>
  	<div class="container">
  	
  	<%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	 <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	 
  	 
    <!-- 账号管理面板 -->
    <%@include file="common/leftpanel.jsp"%>
    
    <!--我的书籍显示区-->
     <div class="showPersonInfo" >
	     <s:set name="label1" value="%{getText('label_rownum')}"/>
	     <s:set name="label2" value="%{getText('book_label_id')}"/>
	     <s:set name="label3" value="%{getText('book_label_generalinfo')}"/>
	     <s:set name="label4" value="%{getText('book_label_bookpic')}"/>
	     <s:set name="label5" value="%{getText('book_label_edit')}"/>
	     
	    <div class="displayTable">
	     	<display:table name="mybooks" id="row" pagesize="10" requestURI="webs/Student_browseBooks.action" >
	     		<display:column title="${label1 }" sortable="true" headerClass="sortable" style="text-align:center;">
	     			${row_rowNum}
	     		</display:column>
	     		<display:column property="id" title="${label2 }" style="text-align:center;"/>
	     		<display:column title="${label3 }" style="text-align:center;">
	     			<div>书籍名称；${row.name}</div>
	     		    <div>书籍状态；${row.state}</div>
	     		    <div>出售价格：${row.price}</div>
	     		</display:column>
	     		<display:column  title="${label4}" style="text-align: center;">
	     			<img src="<%=basePath%>bookPics/${row.pic}" height="80" width="80">
	     		</display:column>
	     		<display:column  title="${label5}"  style="text-align:center;">
	     			<s:url action="Student_delMyBook" id="delBook">
	     				<s:param name="id" value="%{#attr.row.id}"/>
	     			</s:url>
	     			<s:set name="tempstate" value="%{#attr.row.state}" scope="page"/>
	     			<%
	     				if(pageContext.getAttribute("tempstate").equals("待审核")||pageContext.getAttribute("tempstate").equals("正在售出"))
	     				{
	     			%>
	     					<a href="${delBook}">下架</a>
	     			<% 
	     				}else if(pageContext.getAttribute("tempstate").equals("冻结"))
	     				{
	     			%>
	     				<div onmouseover="over(${attr.row.id })" onmouseout="mout()"><font color="blue" style="text-decoration: underline;">查看信息</font></div>	
	     			<% } %>
	     			
	     		</display:column>     				
	     	</display:table>
        </div>
       </div>
    
    </div>
     <div id="tip" style="display: none;width: 230px;height: 180px;position: absolute;z-index: 1000;" onmouseout="mout()"></div>
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
