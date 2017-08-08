<%@ page contentType="text/html; charset=gbk"%>

<!--右侧辅助航标区 -->
	<div class="right_bar">
	  <a href="#">意见</a>
	  <a href="#">分享</a>
	  <a id="backtop" >顶部</a>
    </div>
    
    <script language='javascript'> 
    $(document).ready(function(){//防止文档在完全加载（就绪）之前运行 jQuery 代码
    
		$("#backtop").on("click",move);
		$(window).scroll(function(){
			checkPosition();
		});
		
		function move(){
			$("html,body").animate({
				scrollTop:0
			},200);
		}
	
		function checkPosition(){
				if($(window).scrollTop()>0){
					$("#backtop").css("opacity","1");//出现
				}else {   
				  $("#backtop").css("opacity","0");//隐藏
			}
		}
	});
</script>