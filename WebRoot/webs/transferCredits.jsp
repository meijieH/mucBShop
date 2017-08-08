<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="e" uri="/eBook" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="积分转出"/></title>
    
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
		$(document).ready(function(){
			$('#isWhole').click(function(){
				$('#tr_credit').toggle(500);
			});
		});
		
		function check(){
			var to_stdnum=document.getElementById('to_stdnum');
			var isWhole=document.getElementById('isWhole');
			var credit=document.getElementById('credit');
			var info=document.getElementById('info');
			
			if(to_stdnum.value.match(/^\d{7,8}$/)==null){
				alert('学号为7位或8位数字！');
				return false;
			}
			
			if(isWhole.getAttribute('checked')=="checked"){
				if(credit.value.match(/^\d+$/)==null){
					alert('请填写转让积分');
					return false;
				}
			}
			
			
			return true;
		//	var form1=document.getElementById('form1');
		//	form1.action="webs/transferCredits.action";
		//	form1.submit();
	  }
 	</script>
  </head>
  
 <body class="editbody">
  <div class="container">
  	<%--搜索栏 --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	  <%--菜单栏 --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
  	 
    <!-- 账号管理面板 -->
    <%@include file="common/leftpanel.jsp"%>
    <!--积分转出信息-->
    <div id="lside" class="lside">
          <div class="editpersonhead">积分转让</div>
    	 <table>   
		    <form method="post" id='form1' action="webs/Student_transferCredits.action" onsubmit="return check()">
		       <tr> 
		         <td>接受者学号</td> 
		         <td><input name="to_stdnum" id="to_stdnum"/></td>
		       </tr>
		       <tr> 
		       <td>是否全转出&nbsp;&nbsp;</td>
		       	<td><input name="isWhole" type="checkbox" id="isWhole"/>是</td>
		       </tr>
		       <tr id='tr_credit'>
		      <td>转出积分：</td>
		       	<td><input name="credit" id="credit" class="credit"/></td>
		      </tr>
		       <tr>
		         <td><img src="./images/liuyan_icon.png"/></td>
		         <td><textarea name="info" id="info" cols="50" rows="2" style="vertical-align: top;"></textarea></td>
		       </tr>
		       <tr>
		         <td></td>
		       	 <td>
		       	    <br>
		       	    <br>
		       	 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"  value="确认转出" class="btn-success"/>
		       	 </td>
		       </tr>
		     </form>
		  </table> 
    </div> 
  </div>
  <s:if test="hasActionMessages()">
		   	<e:msgdialog basepath="<%=basePath%>">
		   		<s:actionmessage/>
		   	</e:msgdialog> 	
    </s:if>
    <div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script> 
 </body>
</html>
