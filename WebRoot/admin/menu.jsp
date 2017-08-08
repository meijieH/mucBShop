<%@ page contentType="text/html; charset=gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	//取得当前Web应用的名称
	String basepath = request.getContextPath();
%>
<html>
<head>
<title><s:text name="admin_title"/></title>
<s:head theme="ajax" debug="true"/>
<link href="<%=basepath%>/css/admin.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="<%=basePath%>images/title.png">
 <script >
 	var url = "#";
 	var root;
 	
	//响应菜单单击事件
	function treeNodeSelected(arg) {
		var node = dojo.widget.byId(arg.source.widgetId);
		if(node.isFolder){
			if(dojo.widget.byId(arg.source.widgetId).isExpanded){
				dojo.widget.byId(arg.source.widgetId).collapse();
			}else{
				dojo.widget.byId(arg.source.widgetId).expand();
			}		
		}else{
			processSelected(arg.source.widgetId);
		}
	}
	
	//处理菜单导航
	function processSelected(menuid){
		var tmp = (new Date()).getTime();
		if (menuid=='column'){
			url = "columns_browseColumns.action";
		}else if(menuid='appeal'){
			url ="Admin_browseAppeals.action";
		}
		//添加临时参数,标识这是一次全新的请求
		url = "<%=basepath%>/admin/"+url+"?tmp="+tmp;
		if (menuid=='exit'){
			window.parent.location=url;
		}else{
			window.parent.mainFrame.location=url;
		}		
	}
	
	//响应菜单展开事件
	function treeNodeExpanded(arg) {
	    alert('id['+arg.source.widgetId+'], name['+ arg.source.title+ '] expanded');
	}
	
	//响应菜单收缩事件
	function treeNodeCollapsed(arg) {
	    alert('id['+arg.source.widgetId+'], name['+ arg.source.title+ '] collapsed');
	}
	
	//注册菜单事件处理
	dojo.addOnLoad(function(){
	    root = dojo.widget.byId('adminctrl');
	    dojo.event.topic.subscribe(root.eventNames.titleClick, treeNodeSelected);
	});
	
	//展开所有菜单项
	function expandAll(){
       for(var i=0; i<root.children.length; i++) {
          var child = root.children[i];
          dojo.lang.forEach(child.getDescendants(),function(node) {node.expand(); });
       }
	}
</script>
</head>
<body style="padding:10px;">
<s:tree label="<b>后台管理</b>" id="adminctrl" theme="ajax" showRootGrid="true" showGrid="true">
    <s:treenode theme="ajax" label="书籍管理" id="book_search">
        <s:treenode theme="ajax" label="审批书籍" id="book"/>
        <s:treenode theme="ajax" label="书籍查询" id="search"/>
    </s:treenode>
    <s:treenode theme="ajax" label="申诉管理" id="appeal"/>
</s:tree>

</body>
<script type="text/javascript">
	//展开所有菜单项
	window.setTimeout("expandAll();",2000);
</script>
</html>