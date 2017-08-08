 <%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="e" uri="/eBook" %>

<!DOCTYPE HTML >
<html>
  <head>
    <title><s:text name="title_label_regstudent"></s:text></title>
    <base href="<%=basePath%>">	
    
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/regStudent.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
	
 <script language="javascript">//看看输入正确要不要换成一个√的符号
    function checkname(from){//要不要对特殊字符做出限制    做一个对用户名是否存在的判断
	    if(from.username.value==""){
	       loginName_tip.innerHTML="请输入用户名!";
	    }else{
	       loginName_tip.innerHTML="输入正确";
	    }
    }
    
    function checkpwd(from){
	    if(from.pwd.value==""){
	       loginPwd_tip.innerHTML="请输入密码!";
	    }else if(from.pwd.value.length<6){
	       loginPwd_tip.innerHTML="密码长度不小于6位!";
	    }else{
	       loginPwd_tip.innerHTML="输入正确";
	    }
    }
    
    function checkagainPwd(from){
	    if(from.againPwd.value==""){
	       againPwd_tip.innerHTML="请输入确认密码!";
	    }else if(from.againPwd.value.length<6){
	       againPwd_tip.innerHTML="密码长度不小于6位!";
	    }else if(from.pwd.value!=from.againPwd.value){
	       againPwd_tip.innerHTML="两次密码输入不同!";
	    }else{
	       againPwd_tip.innerHTML="输入正确";
	    }
    }
    
    function checkstdnum(from){
	    if(from.stdnum.value==""){
	       stdnum_tip.innerHTML="请输入学号!";
	    }else if(from.stdnum.value.length<6){
	       stdnum_tip.innerHTML="待定";//学号长度是多少
	    }else{
	       stdnum_tip.innerHTML="输入正确";
	    }
    }
    
    function checkrealname(from){
	    if(from.realname.value==""){
	      realname_tip.innerHTML="请输入真实姓名!";
	    }else if(false){
	       realname_tip.innerHTML="姓名中含有非法字符";//这里需要添加正则表达式
	    }else{
	       realname_tip.innerHTML="输入正确";
	    }
    }
    
    function checkemail(from){
	    if(from.email.value==""){
	      email_tip.innerHTML="请输入邮箱地址!";
	    }else if(false){
	       email_tip.innerHTML="请输入有效地址";//这里需要添加正则表达式
	    }else{
	       email_tip.innerHTML="输入正确";
	    }
    }
   
    </script>
  </head>
  
  <body onLoad="javascript:regStudent_table.username.focus()" style="background-image: url(images/bg1.jpg);">
  
  <main class="container">
  	   
  <div class="reg_form">
     <p style="font-size:28px;color:#02ba85;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请完善以下信息</p>
	 <s:form id="regStudent_table" action="Student_regStudent" enctype="multipart/form-data" method="POST">
	    <ul>
	       <li>
	          <label for="username"><s:text name="student_label_loginName"/></label>
	          <s:textfield id="username"  name="username" onblur="checkname(regStudent_table)"/>
	       </li>
	       <li>
	          <label for="pwd"><s:text name="student_label_loginPwd"/></label>
	          <s:password id="pwd" name="pwd" onblur="checkpwd(regStudent_table)"  />
	       </li>
	       <li>
	          <label for="againPwd"><s:text name="student_label_againPwd"/></label>
	          <s:password id="againPwd" name="againPwd" onblur="checkagainPwd(regStudent_table)" />
	       </li>
	       <li>
	          <label for="stdnum"><s:text name="student_label_stdnum"/></label>
	          <s:textfield  id="stdnum" name="stdnum" onblur="checkstdnum(regStudent_table)"/>
	       </li>
	       <li>
	          <label for="realname"><s:text name="student_label_realname"/></label>
	          <s:textfield  id="realname" name="realname" onblur="checkrealname(regStudent_table)"/>
	       </li>
	       <li>
	          <label for="email"><s:text name="student_label_email"/></label>
	          <s:textfield  id="email" name="email" onblur="checkemail(regStudent_table)"/>
	       </li>
	       <li>
	          <label for="phonenumber"><s:text name="student_label_phonenumber"/></label>
	          <s:textfield id="phonenumber" name="phonenumber"/>
	       </li>
	       <li>
	          <label for="grade"><s:text name="student_label_grade"/></label>
	          <s:select id="grade" name="grade" list="{'大一','大二','大三','大四','研究生'}"/> 
	       </li>
	       <li>
	          <label for="major"><s:text name="student_label_major"/></label>
	          <s:select id="major" name="major" list="{'科学','艺术','经济','信息与计算科学','体育'}"/> 
	       </li>
	       <li>
	          <label for="pic"><s:text name="student_label_photo"/></label>
	          <s:file id="pic" name="pic"/>
	       </li>
	       <li>
	          <s:submit key="label_signin" cssClass="btn login_button_login"/>
	       </li>
	    </ul>	   
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
	   
	  <div class="reg_back">
	  	<a href="<%=basePath%>webs/login.jsp">
	  	  <s:text name="back"></s:text>
	  	</a>
	  </div>
	  
    </main>
   
  </body>
</html>
