<%@ page contentType="text/html; charset=gbk"%>
<!--�����˵���-->
	<div class="navbar navbar-default" role="navigation">
		<ul class="nav nav-pills">
			<li class="dropdown">
				<a target="_self" href="webs/Book_browseValidBooks.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">��վ��ҳ</a>
			</li>
			<li class="dropdown">
  				<a target="_self" href="webs/Book_browseValidBooks.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">�鼮����</a>
        		<!-- <ul class="dropdown-menu">
        		    <li><a  target="_self" href="">������</a></li>
					<li><a  target="_self" href="">����ѧ��</a></li>
					<li><a  target="_self" href="">��������</a></li>
					<li><a  target="_self" href="">���ַ�Χ</a></li>
       			</ul> -->
			</li>	
			<li>
 				<a target="_self" href="webs/regBook.jsp" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">ע���鼮</a>
			</li>
			<li class="dropdown">
 				<a target="_self" href="webs/Student_viewMyShopList.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">�ҵĹ��ﳵ</a>
			</li>
			<li class="dropdown">
 				<a target="_self" href="webs/Student_browseBooks.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">�ҵ����</a>
			</li>
		    <li class="dropdown">
				<a href="##" data-toggle="dropdown" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">�˺Ź���</a>
      			<ul class="dropdown-menu">
					<li><a  target="_self" href="webs/editStudent.jsp">��������</a></li>
					<li><a  target="_self" href="webs/Student_browseOrders.action">�ҵĶ���</a></li>
					<li><a href="webs/Student_transferCredits.action">����ת��</a></li>
					<li><a  target="_self" href="webs/Student_exit.action">�˳�</a></li>
   			    </ul>
	   		</li>	
			<li class="dropdown">
				<a target="_self" href="webs/Appeal_createAppeal.action" data-toggle="dropdown" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">��������</a>  		
				<ul class="dropdown-menu">
				    <li><a href="webs/Order_seeApplyBack.action">�˿�����</a></li>
					<li><a  target="_self" href="webs/Appeal_createAppeal.action">����Ͷ��</a></li>
					<li><a  target="_self" href="webs/Appeal_getAppeals.action">�ҵ�����</a></li>
				</ul>
			</li>						
		</ul>	
	</div> 
<script language='javascript'>
$(document).ready(function(){	
	$(".menu ul li").mouseover(
	  function(){
	  $("ul",this).show();
	});
	
	
	$(".menu ul li").mouseout(
	  function(){
	  $("ul ",this).hide();
	});
});	
</script>	