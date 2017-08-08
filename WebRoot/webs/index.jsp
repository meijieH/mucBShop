 <%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
 <%@ page import="com.ORM.Student" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	System.out.println("path:"+path);
	System.out.println("basePath:"+basePath);
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net"  prefix="display"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title><s:text name="index_title"></s:text></title>
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="<%=basePath%>/css/style.css">
	<link rel="stylesheet" href="<%=basePath%>/css/index.css">
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
	
	
  </head>
  
  <body>  
  
     <s:set name="label_rownum" value="%{getText('label_rownum')}"/>
     <s:set name="book_label_name" value="%{getText('book_label_name')}"/>
     <s:set name="book_label_price" value="%{getText('book_label_price')}"/>
     <s:set name="book_label_type" value="%{getText('book_label_type')}"/>
     <s:set name="book_label_pic" value="%{getText('book_label_pic')}"/>
     
  	<div class="container">
  	
  	 <%@include file="common/searcolumn.jsp"%>
  	 <%@include file="common/menubar.jsp"%>	 
    
     <div class="interval">
    	<div class="interval_top"></div>
    	<div class="interval_left"><hr /></div>
    	<div class="interval_middle">&nbsp;&nbsp;&nbsp;�鼮����</div>
    	<div class="interval_right"><hr /></div>
    	<div class="interval_bottom"></div>
    </div>
 
		<ul>
			<table class="table">
				<tr><th>�����磺</th><td><a class="table_a" href="webs/Student_getBooksByConditions.action?press=0">�������������</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?press=1">���ӹ�ҵ������</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?press=2">�廪��ѧ������</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?press=3">�ߵȽ���������</a></td><tr>
				<tr><th>ѧ�ƣ�</th><td><a class="table_a" href="webs/Student_getBooksByConditions.action?subject=0">����</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?subject=2">�����</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?subject=3">����</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?subject=">����</a></td><tr>
				<tr><th>����ѧ����</th><td><a class="table_a" href="webs/Student_getBooksByConditions.action?grade=1">��һ����</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?grade=2">���</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?grade=3">����</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?grade=4">���ļ�����</a></td><tr>
				<tr><th>�������ͣ�</th><td><a class="table_a" href="webs/Student_getBooksByConditions.action?type=0">�̲�</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?type=1">����</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?type=2">��־</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?type=4">������</a></td><tr>
				<tr><th>���ַ�Χ��</th><td><a class="table_a" href="webs/Student_getBooksByConditions.action?min_price=0&max_price=30">0-30</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?min_price=31&max_price=50">31-50</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?min_price=50&max_price=100">50-100</a></td><td><a class="table_a" href="webs/Student_getBooksByConditions.action?min_price=101">100����</a></td><tr>
			</table>
		</ul>
	
    
    <div class="interval">
    	<div class="interval_top"></div>
    	<div class="interval_left"><hr /></div>
    	<div class="interval_middle">&nbsp;&nbsp;&nbsp;�鼮�Ƽ�</div>
    	<div class="interval_right"><hr /></div>
    	<div class="interval_bottom"></div>
    </div>
        <div class="tjdiv">
	    <table>
		   <tr>
			    <c:forEach  var="book" items="${tjbooks}">
		    		<td>
		    			<a href="webs/Book_queryBookInfo.action?id=${book.id }">
		    			<img alt="${book.name}" src="<%=basePath%>bookPics/${book.pic}" width="150px" height="150px"/><br>
		    			<span class="fl">${book.name}</span><span class="fr">${book.price}</span>
		    			</a>
		    		</td>
			    </c:forEach>
	    	</tr>
	    </table>
    </div>
    <div class="interval">
    	<div class="interval_top"></div>
    	<div class="interval_left"><hr /></div>
    	<div class="interval_middle">&nbsp;&nbsp;&nbsp;�ڼ��鼮</div>
    	<div class="interval_right"><hr /></div>
    	<div class="interval_bottom"></div>
    </div>
    <div class="mainbody">
	    
	     <div class="displayTable row_bname_ashop">
	     	<display:table name="books" id="row" pagesize="10" requestURI="webs/Book_browseValidBooks.action" >
	     		<display:column title="${label_rownum}" sortable="true" headerClass="sortable" style="text-align:center;" >
	     			${row_rowNum}
	     		</display:column>
	     		<display:column  title="${book_label_name}"  >
	     			<s:url action="webs/Book_queryBookInfo" id="queryBookInfo">
	     				<s:param name="id" value="%{#attr.row.id}"/>
	     			</s:url>
	     			<s:url action="webs/Student_addShopList" id="addShoplist">
	     				<s:param name="book_id" value="%{#attr.row.id}"/>
	     			</s:url>
	     			<a href="${queryBookInfo}">${row.name}</a>
	     			<a href="${addShoplist}" style="color:#02ba85;">���빺�ﳵ</a>
	     		</display:column>
	     		<display:column property="price" title="${book_label_price}" sortable="true" headerClass="sortable" style="text-align:center;"/>
	     		<display:column property="press" title="������"  style="text-align:center;"/>
	     		<display:column property="author" title="������"  style="text-align:center;"/>
	     		<%-- <display:column property="subtime" title="�ϼ�ʱ��"  style="text-align:center;"/> --%>
	     		<display:column property="type" title="${book_label_type}"  style="text-align:center;"/>
	     		<display:column title="${book_label_pic}" style="text-align: center;">
	     			<a href="${queryBookInfo}" style="cursor: pointer;"><img src="<%=basePath%>/bookPics/${row.pic}" style="width: 80px;height:80px;"/></a>
	     		</display:column>			
	     	</display:table>
	     </div>
	     
	    
	  	<%--   <%@include file="common/rightbar.jsp"%>  --%>
     </div>
    <br>
    <br>

	<div class="foot" style="margin-top:500px;">
		<div class="row">
			<div class="col-xs-6 col-md-6">
				<a href="index.jsp" class="thumbnail foot-logo">
					<img alt="100%x100%" src="images/logo1.png" style="height: 100%; width: 100%; display: block;padding-left:30px;padding-right:-22px;" alt="">
				</a>
				<div class="caption caption-de">
					<h4 style="margin:3 auto;font-size:22px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;У԰������ƽ̨</h4>			
				</div>  
			</div>
		    <div class="col-xs-6 col-md-6 ">
			    <div class="caption caption-de white">
			    	<br />
			    	<p><a href="##">��������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">��������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">��������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">�������</a></p>
					<p>��Ȩ���� ��ICP08000853��</p>
					<p>@MUC eshop�Ŷ�</p>
			    </div>   
	    	</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-12 foot_link">
				<hr />
				<p>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; ��������:&nbsp;&nbsp; 
				<a href="http://www.amazon.cn/?tag=360hydracnnav-23&ref=pz_ic_xmo_360_Title">����ѷ</a>|
				<a href="http://www.kongfz.com/">�׷��Ӿ�����</a>|
				<a href="http://book.jd.com/?cu=true&utm_source=haosou-search&utm_medium=cpc&utm_campaign=t_262767352_haosousearch&utm_term=2496904098_0_9f3ed190ece74f07ba8e0e8f4d206772">����ͼ��</a>|
				<a href="http://www.youlu.net/">��·��</a>|
				<a href="http://www.ganji.com/tushu/">�ϼ���</a>|
				<a href="http://www.edeng.cn/13/shuji/?f=bd/">�׵���������</a>|
				<a href="http://www.usedbook.tw/">������֮��</a>
				<br />
				</p>
			</div>		
	    </div>
	</div>
	<div id="toTop" onclick="toTop()"><img src="images/totop.png" /></div>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/main.js"></script>
  </body>
</html>
