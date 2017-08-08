<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'video.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div>
    <span id="flvspan" style="display:none">
	<e:msgdialog basepath="<%=basePath%>" title="在线视频播放" height="1020" top="140" boxwidth="460" tmpid="flv">
		<!-- FLV在线播放器 -->
		<e:flvplayer red5FullUrl="http://localhost:8080/red5" red5ServerIp="localhost" flvFilename="${video}" picFilename="${picture}"/>
	</e:msgdialog>
	</span>
	<script language='javascript'>
	//播放flv视频
	function playflv(){
		document.getElementById('flvspan').style.display='inline';
		document.getElementById('maskflv').style.display='inline';
		document.getElementById('msgpromptflv').style.display='inline';
	}	
	//关闭带遮罩的网页对话框
	closemaskflv();
	</script>
    </div>
  </body>
</html>
