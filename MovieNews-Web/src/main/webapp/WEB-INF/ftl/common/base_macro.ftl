<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<#macro base base_title base_keywords="" base_js=[] base_css=[]>
<#assign basePath=request.contextPath />
<!DOCTYPE html>
<html>
<head>
<title>My Show a Entertainment Category Flat Bootstarp responsive Website Template | Home :: w3layouts</title>
	<#include "head.ftl" />
</head>
<script type="text/javascript">
$(function() {
	//即将上映
	$("#demo-1").bootstrapDropdownOnHover({
		  mouseOutDelay: 400,//在鼠标离开下拉菜单之后多少时间才关闭下拉面板，单位毫秒
		  responsiveThreshold: 992,//在屏幕宽度为多少像素的时候不再激活下拉菜单鼠标滑过动画效果
		  hideBackdrop: true//十分隐藏下拉菜单的背景（mobile中有效）
	});//初始化鼠标经过提示
	//影视作品
	$("#demo-2").bootstrapDropdownOnHover({
		  mouseOutDelay: 400,//在鼠标离开下拉菜单之后多少时间才关闭下拉面板，单位毫秒
		  responsiveThreshold: 992,//在屏幕宽度为多少像素的时候不再激活下拉菜单鼠标滑过动画效果
		  hideBackdrop: true//十分隐藏下拉菜单的背景（mobile中有效）
	});//初始化鼠标经过提示
	
});
function toMoviesList(link){
	window.open(link);  
}

/**
 * 添加关注
 */
function addFocus(mid){
	$.ajax({
		   type: "POST",
		   url: "${basePath}/focus_save.action",
		   data: "mid="+mid,
		   success: function(data){
		     if(data.flag){
		    	 alert('关注成功!');
		    	$('[id=gz'+mid+']').text("已关注");
		    	$('[id=gz'+mid+']').attr('onclick','removeFocus('+mid+')');		    	 
		     }
		     else
		    	 alert('关注失败!'+data.msg);
		   }
		});
}
//移除关注 根据影片id
function removeFocus(mid){
	$.ajax({
		   type: "POST",
		   url: "${basePath}/focus_removeFocus.action",
		   data: "mid="+mid,
		   success: function(data){
		     if(data.flag){
		    	 alert('移除成功!');
		    	 $('[id=gz'+mid+']').text("关注");
		    	 $('[id=gz'+mid+']').attr('onclick','addFocus('+mid+')');		    	 
		     }
		     else
		    	 alert('移除失败!'+data.msg);
		   }
		});
}

</script>
<body>
	<!-- header-section-starts -->
	<#include "top.ftl" />
	<!-- header-section-end -->
	
	
	<div class="container">
		
		<#nested/>
		
		
	</div>
	<#include "foot.ftl" />
	</body>
</html>
</#macro >