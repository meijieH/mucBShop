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
			alert("��������Ϊ��");
			return false;
		}
		var type=document.getElementsByName("type").item(0);
		if(type.value=="")
		{
			alert("��������Ϊ��");
			return false;
		}
		var price=document.getElementsByName("price").item(0);
		if(price.value=="")
		{
			alert("��ļ۸���Ϊ��");
			return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
  	<div class="container">
  	
  	<%--������ --%>
  	 <%@include file="common/searcolumn.jsp"%>
  	 
  	 <%--�˵��� --%>
  	 <%@include file="common/menubar.jsp"%>
  	  	 
     <!-- ѡ����� -->
    <%@include file="common/leftpanel.jsp"%>
    <!-- ע���鼮��� -->
    <div class="showPersonInfo">
    	<div class="editpersonhead">�鼮ע��</div>
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
    					<option value='���ӹ�ҵ������'/>
    					<option value='�ߵȽ���������'/>
    					<option value='��е��ҵ������'/>
    					<option value='�������������'/>
    					<option value='�廪��ѧ������'/>
    					<option value='����ӡ���'/>
    					<option value='���ֳ�����'/>
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
    			<td style="float:left;"><s:radio name="type" list="{'�̲�','����','��־','����','������','ɢ��','����'}"/></td>
    		</tr>
    		</table>
    		<br>
    			<div class="regbook_submit"><s:submit key="regbook_label_submit" cssStyle="margin-top:20px;border-radius:4px;border:2px solid RGB(202,242,244);background-color:#02ba85;color:white;font-size:22px;width:120px;height:42px;"/></div>
    		
    		<s:textfield name="state" value="�����" cssStyle="display:none"/>		
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
