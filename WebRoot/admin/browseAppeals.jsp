 <%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>���������Ϣ</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/admin.css"/>
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">
  </head>
  <body>

   	<h1>���ߴ���ƽ̨</h1>
   	
   	
   	
   	<table class="table table-hover">
      <tr>
		  <th> ���</th>
		  <th> ������</th>
		  <th> ��������</th>
		  <th> ��������</th>		  
		  <th> �����鼮</th>
		  <th> ����ʱ��</th>
		  <th> ����</th>					    
	   </tr>
        <c:forEach  var="appeal" items="${appeals}">
		   <tr>
		    	<td> 
		    		<a href="webs/Book_queryBookInfo.action?id=${book.id }"/>
		    		<span class="number">${appeal.id}</span>
		    	</td>
		    	<td>
		    	   <p>ѧ�ţ�${appeal.studentByComplainantId.stdnum}</p>
		    	   <p>������${appeal.studentByComplainantId.realname}</p>      
		    	</td>
		    	<td>
		    	     ${appeal.reason}
		    	</td>
		    	<td>
		    	    <p>ѧ�ţ�${appeal.studentByRespondentId.stdnum}</p>
     			    <p>������${appeal.studentByRespondentId.realname}</p>
		    	</td>
		    	<td>
		    	    <p> ������${appeal.order.book.name }</p>
     			    <p>��ۣ�${appeal.order.book.price }</p>
		    	</td>
		    	<td>
		    	     ${appeal.submitTime }
		    	</td>
		    	<td>
		    	     <span>
		    	        <s:url action="Admin_replyAppeal" id="replyAppeal">
		     				<s:param name="id" value="%{#attr.row.id}"/>
		     			 </s:url>
		     			 <a  class="btn btn-primary" href="${replyAppeal}" role="button" data-toggle="modal" data-target="#myModal">�ظ�</a>
		    	     </span>
		    	</td>					    
	    	</tr>
	    </c:forEach>
	</table>

	   <!--�ظ�������ģ̬��-->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">��������</h4>
		      </div>
		      <div class="modal-body">
		          <textarea name="reply">
		          </textarea>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">����</button>
		        <a class="btn btn-primary" href="${replyAppeal}" role="button">�ظ�</a>
		      </div>
		    </div>
		  </div>
		</div>
	  <script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
	  <script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
  </body>
</html>
