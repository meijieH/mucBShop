$(document).ready(function(){
	dropdownOpen();//����
});
/**
 * ��껮����չ���Ӳ˵��������Ҫ�������չ��
 */
function dropdownOpen() {

	var $dropdownLi = $('li.dropdown');

	$dropdownLi.mouseover(function() {
		$(this).addClass('open');
	}).mouseout(function() {
		$(this).removeClass('open');
	});
}
function toTop(){
    window.scroll(0,0);
    }
