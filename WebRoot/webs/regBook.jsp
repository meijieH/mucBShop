<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="title_regbook"/></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
	<script type="text/javascript">
	function check(){
		var name=document.getElementsByName("bookname").item(0);
		if(name.value=="")
		{
			alert("书名不能为空");
			return false;
		}
		var type=document.getElementsByName("type").item(0);
		if(type.value=="")
		{
			alert("书的类别不能为空");
			return false;
		}
		var price=document.getElementsByName("price").item(0);
		if(price.value=="")
		{
			alert("书的价格不能为空");
			return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
  	<div class="container">
  	
  	<%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	 <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
     <!-- 选择面板 -->
    <%@include file="common/leftpanel.jsp"%>
    <!-- 注册书籍面板 -->
    <div class="showPersonInfo">
    	<div class="editpersonhead">书籍注册</div>
    	<br>
    	<s:form action="Book_regBook" enctype="multipart/form-data" method="POST" onsubmit="return check()">
    		<table class="table">
    		<tr>
    			<td ><s:text name="regbook_bookname"/></td>
    			<td><s:textfield name="name"/></td>
    		</tr>
    		<tr>
    			<td ><s:text name="regbook_author"/></td>
    			<td><s:textfield name="author"/></td>
    		</tr>
    		<tr>
    			<td><s:text name="regbook_press"/></td>
    			<td>
    				<input name='press' list='pl'/>
    				<datalist id='pl'>
    					<option value='电子工业出版社'/>
    					<option value='高等教育出版社'/>
    					<option value='机械工业出版社'/>
    					<option value='人民教育出版社'/>
    					<option value='清华大学出版社'/>
    					<option value='商务印书馆'/>
    					<option value='译林出版社'/>
    				</datalist>
    			</td>
    		</tr>
    		<tr>
    			<td ><s:text name="regbook_subject"/></td>
    			<td><s:textfield name="subject"/></td>
    		</tr>
    		<tr>
    			<td ><s:text name="regbook_expectedprice"/></td>
    			<td><s:textfield name="price"/></td>
    		</tr>
    		<tr>
    			<td ><s:text name="regbook_photodescription"/></td>
    			<td >
    				
    				<img height="80"  width="80" alt="loading" src="<%=basePath%>bookPics/${pic}"/>
    				<s:file name="tpic"/>
    			</td>
    		</tr>
    		<tr>
    			<td><s:text name="regbook_booktype"/></td>
    			<td style="float:left;"><s:radio name="type" list="{'教材','论文','杂志','名著','技术类','散文','其他'}"/></td>
    		</tr>
    		</table>
    		<br>
    			<div class="regbook_submit"><s:submit key="regbook_label_submit" cssStyle="margin-top:20px;border-radius:4px;border:2px solid RGB(202,242,244);background-color:#02ba85;color:white;font-size:22px;width:120px;height:42px;"/></div>
    		
    		<s:textfield name="state" value="待审核" cssStyle="display:none"/>		
    	</s:form>
    </div>
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
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
