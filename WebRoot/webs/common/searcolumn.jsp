<%@ page contentType="text/html; charset=gbk"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<header>	
	<div class="stu_info">
		<img src="images/${session.student.headpic}" class="search_stu_headpic"/>
		<span class="search_stu_username">
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ÄãºÃ&nbsp;, &nbsp;${session.student.username}</span>
		<span class="search_stu_balance">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Êé±Ò£º${session.student.balance}</span>
	</div>		  
	 <div class="searcolumn">
		<s:form action="Book_searchByName" method="post">
			 <s:textfield name="keyword" cssClass="search_box" />
			 <s:submit value="" cssClass="search_button"></span></s:submit>
		</s:form>	
	</div>	
	<div class="logo">
		<img alt="logo" src="images/logo.png" />
	</div> 	
</header>
