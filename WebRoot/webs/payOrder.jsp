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
    
    <title>订单支付-校园二手书交易</title>
    
	<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
	<script type="text/javascript">
	function checkInput(){
		var input=document.getElementById("input").value;
		if(input==""||input==null)
		{
			alert("请输入支付密码！");
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

	
  	 <%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	  <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
	  <%@include file="common/leftpanel.jsp"%>
	  <div class="payorder_main" >  
             
			 <s:form action="Order_payOrder.action" method="post" onsubmit="return checkInput()">
			      <h3>订单支付</h3>
				  <div class="form-group">
				    <label for="input">请输入支付密码</label>
				    <s:password id="input"  name="password" cssClass="form-control" />
				  </div>
				  <div class="form-group">
				    <input  type="button" onclick="cancelOrder()" class="btn btn-default" value="放弃支付"/>
				    <s:submit  cssClass="btn btn-primary" value="确认支付"/>
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
