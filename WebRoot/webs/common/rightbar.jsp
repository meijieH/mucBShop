<%@ page contentType="text/html; charset=gbk"%>

<!--�Ҳศ�������� -->
	<div class="right_bar">
	  <a href="#">���</a>
	  <a href="#">����</a>
	  <a id="backtop" >����</a>
    </div>
    
    <script language='javascript'> 
    $(document).ready(function(){//��ֹ�ĵ�����ȫ���أ�������֮ǰ���� jQuery ����
    
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
					$("#backtop").css("opacity","1");//����
				}else {   
				  $("#backtop").css("opacity","0");//����
			}
		}
	});
</script>