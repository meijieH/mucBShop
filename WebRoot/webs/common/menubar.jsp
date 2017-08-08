<%@ page contentType="text/html; charset=gbk"%>
<!--导航菜单区-->
	<div class="navbar navbar-default" role="navigation">
		<ul class="nav nav-pills">
			<li class="dropdown">
				<a target="_self" href="webs/Book_browseValidBooks.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">网站首页</a>
			</li>
			<li class="dropdown">
  				<a target="_self" href="webs/Book_browseValidBooks.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">书籍分类</a>
        		<!-- <ul class="dropdown-menu">
        		    <li><a  target="_self" href="">出版社</a></li>
					<li><a  target="_self" href="">适用学生</a></li>
					<li><a  target="_self" href="">出售类型</a></li>
					<li><a  target="_self" href="">积分范围</a></li>
       			</ul> -->
			</li>	
			<li>
 				<a target="_self" href="webs/regBook.jsp" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">注册书籍</a>
			</li>
			<li class="dropdown">
 				<a target="_self" href="webs/Student_viewMyShopList.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">我的购物车</a>
			</li>
			<li class="dropdown">
 				<a target="_self" href="webs/Student_browseBooks.action" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">我的书库</a>
			</li>
		    <li class="dropdown">
				<a href="##" data-toggle="dropdown" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">账号管理</a>
      			<ul class="dropdown-menu">
					<li><a  target="_self" href="webs/editStudent.jsp">个人资料</a></li>
					<li><a  target="_self" href="webs/Student_browseOrders.action">我的订单</a></li>
					<li><a href="webs/Student_transferCredits.action">积分转让</a></li>
					<li><a  target="_self" href="webs/Student_exit.action">退出</a></li>
   			    </ul>
	   		</li>	
			<li class="dropdown">
				<a target="_self" href="webs/Appeal_createAppeal.action" data-toggle="dropdown" class="dropdown-toggle" style="padding-top:32px;padding-bottom:31px;">交易申诉</a>  		
				<ul class="dropdown-menu">
				    <li><a href="webs/Order_seeApplyBack.action">退款申请</a></li>
					<li><a  target="_self" href="webs/Appeal_createAppeal.action">交易投诉</a></li>
					<li><a  target="_self" href="webs/Appeal_getAppeals.action">我的申诉</a></li>
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