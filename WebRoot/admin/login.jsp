<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="title_label_index"></s:text></title>
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/admin.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
  </head>
  
  <body>
  
  
  <main>
  
  
  <div class="login_admin">
    <form action="admin/Admin_login.action" onsubmit="return check()" method="post" class=" form-horizontal col-sm-3 col-sm-offset-4 ">
      <h2>校园二手书交易管理员</h2>
	  <div class="form-group">
	    <label for="inputEmail3" class="col-sm-4 control-label">用户名</label>
	    <div class="col-sm-8">
	        <s:textfield id="username" name="username" cssClass="form-control"/>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword3" class="col-sm-4 control-label">密码</label>
	    <div class="col-sm-8">
	      <s:password name="pwd" cssClass="form-control" />
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-4 col-sm-8">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox"> 记住密码
	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-3 col-sm-8">
	      <s:submit key="label_submit" cssClass="btn btn-primary col-sm-9"/>
	    </div>
	  </div>
  </form>
  
  </div>


  </main>
    
   <s:if test="hasActionMessages()">
   	<e:msgdialog basepath="<%=basePath%>">
   		<s:actionmessage/>
   	</e:msgdialog> 	
   </s:if>
   
  </body>
</html>