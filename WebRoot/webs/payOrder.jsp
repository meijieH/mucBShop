<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
 <%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����֧��-У԰�����齻��</title>
    
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
	<script type="text/javascript">
	function checkInput(){
		var input=document.getElementById("input").value;
		if(input==""||input==null)
		{
			alert("������֧�����룡");
			return false;
		}
		return true;
	}
	function cancelOrder(){	
		var oid=document.getElementById("oid");
		window.location.href="webs/Order_delOrder.action?oid="+oid.value;
	}
	</script>

  </head>
  
  <body >
  
 	 <div class="container">

	
  	 <%--������ --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	  <%--�˵��� --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
	  <%@include file="common/leftpanel.jsp"%>
	  <div class="payorder_main" >  
             
			 <s:form action="Order_payOrder.action" method="post" onsubmit="return checkInput()">
			      <h3>����֧��</h3>
				  <div class="form-group">
				    <label for="input">������֧������</label>
				    <s:password id="input"  name="password" cssClass="form-control" />
				  </div>
				  <div class="form-group">
				    <input  type="button" onclick="cancelOrder()" class="btn btn-default" value="����֧��"/>
				    <s:submit  cssClass="btn btn-primary" value="ȷ��֧��"/>
				  </div>
				  <s:textfield name="id" value="%{#request.id}" cssStyle="display:none" id="oid"/>
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
	
	<div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
	
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
