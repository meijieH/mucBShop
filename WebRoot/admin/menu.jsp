<%@ page contentType="text/html; charset=gbk"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	//ȡ�õ�ǰWebӦ�õ�����
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
 	
	//��Ӧ�˵������¼�
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
	
	//����˵�����
	function processSelected(menuid){
		var tmp = (new Date()).getTime();
		if (menuid=='column'){
			url = "columns_browseColumns.action";
		}else if(menuid='appeal'){
			url ="Admin_browseAppeals.action";
		}
		//�����ʱ����,��ʶ����һ��ȫ�µ�����
		url = "<%=basepath%>/admin/"+url+"?tmp="+tmp;
		if (menuid=='exit'){
			window.parent.location=url;
		}else{
			window.parent.mainFrame.location=url;
		}		
	}
	
	//��Ӧ�˵�չ���¼�
	function treeNodeExpanded(arg) {
	    alert('id['+arg.source.widgetId+'], name['+ arg.source.title+ '] expanded');
	}
	
	//��Ӧ�˵������¼�
	function treeNodeCollapsed(arg) {
	    alert('id['+arg.source.widgetId+'], name['+ arg.source.title+ '] collapsed');
	}
	
	//ע��˵��¼�����
	dojo.addOnLoad(function(){
	    root = dojo.widget.byId('adminctrl');
	    dojo.event.topic.subscribe(root.eventNames.titleClick, treeNodeSelected);
	});
	
	//չ�����в˵���
	function expandAll(){
       for(var i=0; i<root.children.length; i++) {
          var child = root.children[i];
          dojo.lang.forEach(child.getDescendants(),function(node) {node.expand(); });
       }
	}
</script>
</head>
<body style="padding:10px;">
<s:tree label="<b>��̨����</b>" id="adminctrl" theme="ajax" showRootGrid="true" showGrid="true">
    <s:treenode theme="ajax" label="�鼮����" id="book_search">
        <s:treenode theme="ajax" label="�����鼮" id="book"/>
        <s:treenode theme="ajax" label="�鼮��ѯ" id="search"/>
    </s:treenode>
    <s:treenode theme="ajax" label="���߹���" id="appeal"/>
</s:tree>

</body>
<script type="text/javascript">
	//չ�����в˵���
	window.setTimeout("expandAll();",2000);
</script>
</html>