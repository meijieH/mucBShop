<%@page import="com.sun.xml.internal.ws.client.RequestContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="com.ORM.Book"%>
<%@taglib prefix="e" uri="/eBook" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editBook.jsp' starting page</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css"/>
	<link rel="shortcut icon" href="<%=basePath%>images/title.png">

  </head>
  
  <body>
  <div class="container">
  <!-- ͼ����ʾ�� -->
  	<div class="photoarea">
  	<!-- ��ͼ400*400�� -->
	  	<div id="bigphoto">
	  	<img alt="������" src="<%=basePath%>/bookPics/${book.pic}">
	  	</div>
	<!-- Сͼ100*100�� -->
		<div id="smallphotos">
			<table>
			<tr>
				<td><img alt="������" src="<%=basePath%>/bookPics/${book.pic}"></td>
				<td><img alt="������" src=""></td>
				<td><img alt="������" src=""></td>
				<td><img alt="������" src=""></td>
			</tr>
			</table>
		</div>
  	</div>
  	
  	<!-- �鼮��ѧ�༭�� -->
  	<div class="booktextedit">
  	<s:form action="Book_editBook.action" method="get">
  		<table>
  			<tr>
  				<td><s:text name="regbook_bookname"/></td>
  				<td><s:textfield name="bookname" value="%{#request.book.bookname}"/></td>
  			</tr>
  			<tr>
  				<td><s:text name="regbook_expectedprice"/></td>
  				<td><s:textfield name="price" value="%{#request.book.price}"/></td>
  			</tr>
  			<tr>
  				<td><s:text name="regbook_booktype"/></td>
  				<td><s:textfield name="type" value="%{#request.book.type}"/></td>
  			</tr>
  			<tr><td>�鼮״̬��</td><td>${book.state}</td></tr><tr/>
  			<tr><td>�������ǳ�:</td><td>${book.student.username}</td></tr>
    		<tr><td>��������ʵ����:</td><td>${book.student.realname}</td></tr>
    		<tr><td>��������ϵ�绰:</td><td>${book.student.phonenumber}</td></tr>
    		<tr><td>�����ߵ�������:</td><td>${book.student.email}</td></tr>
    		<%
    			    Book book=(Book)request.getAttribute("book");
    			    if(book!=null){
    			        if(book.getState().equals("\u5F85\u5BA1\u6838"))
	    			    {
		    				out.println("<tr><td colspan='2' align='center'>");
		    				out.println("<input type='submit' value='���沢ͨ��ע��' class='book_editsavepass'");
		    				out.println("</td></tr>");
	    				}
	    				else
	    				{		
	    					out.println("<tr><td colspan='2' align='center'>");
		    				out.println("<input type='submit' value='���沢ͨ��ע��' class='book_editsavepass' disabled='true'>");
		    				out.println("</td></tr>");
		    			}
    			    }
    		 %>
    		
  		</table>
  		<s:textfield name="student.id" value="%{#request.book.student.id}" cssStyle="display:none"/>
  		<s:textfield name="pic" value="%{#request.book.pic}" cssStyle="display:none"/>
  		<s:textfield name="state" value="%{#request.book.state}" cssStyle="display:none"/>
  		<s:textfield name="id" value="%{#request.book.id}" cssStyle="display:none"/>
  	</s:form>
  	</div>
  	 <s:if test="hasActionMessages()">
    	<e:msgdialog basepath="<%=basePath%>">
    	<s:actionmessage/>
    	</e:msgdialog>	
    </s:if>
  </div> 
  </body>
</html>
