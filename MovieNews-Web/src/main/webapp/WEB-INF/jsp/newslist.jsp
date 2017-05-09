<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>My Show a Entertainment Category Flat Bootstarp responsive Website Template | Home :: w3layouts</title>
	<%@ include file="head.jsp" %>

</head>
 <script src="${pageContext.request.contextPath}/js/js/responsive-tabs.js"></script>
    <script type="text/javascript">
      $( '#myTab a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      $( '#moreTabs a' ).click( function ( e ) {
        e.preventDefault();
        $( this ).tab( 'show' );
      } );

      ( function( $ ) {
          // Test for making sure event are maintained
          $( '.js-alert-test' ).click( function () {
            alert( 'Button Clicked: Event was maintained' );
          } );
          fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
      } )( jQuery );
     // header-top-strip
    </script>	
    <script type="text/javascript">
   		function doSearchNews(){
   			var query=$("#searchNews").val();
   			var d="{query:'"+query+"'}";
   			//$.post('{pageContext.request.contextPath}/news_searchNews.action',d,function(data){
   			//},'json');
   			//var s={pageContext.request.contextPath};
   			window.location.href='./news_searchNews.action?query='+query;
   			
   		}
    </script>
<body>
	<!-- header-section-starts -->
		<%@ include file="top.jsp" %>
	<!-- header-section-end -->
		<div class="container">
		  <div class="main-content">
		<!-- menu starts -->
			<%@ include file="menu.jsp" %>
   		 <!-- menu end -->
    
<!-- AddThis Smart Layers END -->

	<ol class="breadcrumb">
			  <li><a href="index.html">Home</a></li>
			  <li class="active">新闻</li>
			</ol>
	<!----->
	<div class="blog-section">
		<div class="col-md-4 blog-categories">
			<h3 class="post">搜索</h3>
			<form class="form-inline" role="form">
			<input type="text"  class="form-control col-md-6" id="searchNews" placeholder="输入要搜索的内容"/>
			<button type="button" class="btn btn-default btn-sm col-md-2" onclick="doSearchNews()" >搜索</button>
			</form>
		</div>
		<div class="col-md-8 blog-posts">
			<h3 class="post"><s:property value="type"/></h3>
			<div class="blog-top">
			  <div class="col-md-12 grid_3">
					
					<!--  
					<div class="blog-poast-info">
						<ul>
							<li><i class="fa fa-user"></i><a class="admin" href="#"><span> </span> Admin </a></li>
							<li><i class="fa fa-calendar"></i><span> </span>12-04-2015</li>
							<li><i class="fa fa-comments"></i><a class="p-blog" href="#"><span> </span>3 Comments </a></li>
						</ul>
				    </div>
				    -->
					<s:iterator var="p" value="nList">
						<div class="post-article">
							<a href="${pageContext.request.contextPath}/news_jumpToNews.html?nid=<s:property value="#p.nid"/>" class="post-title" target="_blank"><s:property value="#p.title"/></a>
							<i><s:date name="#p.time"  format="yyyy-MM-dd HH:mm:ss"/></i>
							<a id="sc<s:property value="#p.nid"/>" href="javascript:void(0)" onclick="addFavorites(<s:property value="#p.nid"/>)" style="float:right">收藏</a>
							<s:iterator var="f" value="fList">
								<s:if test="#f.nid==#p.nid">
									<script>
										//alert(<s:property value="#p.nid"/>);
										$('#sc<s:property value="#p.nid"/>').text("已收藏");
										$('#sc<s:property value="#p.nid"/>').attr('onclick','removeFavorites(<s:property value="#p.nid"/>)');
									</script>
								</s:if>
							</s:iterator>
							
							<p><s:property value="#p.lead"/><br> 
							<a href="${pageContext.request.contextPath}/news_jumpToNews.html?nid=<s:property value="#p.nid"/>" style="color:blue" target="_blank">Read more</a></p>
						</div>
					</s:iterator>
				</div>
				
				<div class="clearfix"></div>
			  </div>
			</div>
		
				
	</div>
	<div class="blog-pagimation">
	<ul class="pagination sint">
			<s:if test="pageBean.totalPage!=0"> <!-- 总页数不为0 -->
			<s:if test="pageBean.pageNum == 1">
				<li class="disabled">
				<a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">«上一页</span></a>
				</li>
			</s:if>
			<s:else>
				<li class="abled">
				<a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="pageBean.pageNum-1"/>&<s:property value="searchType" /><s:property value="query" />" aria-label="Previous"><span aria-hidden="true">«上一页</span></a>
				</li>
			</s:else>
			</s:if>
			<!-- 总页数大于10 -->
			<s:if test="pageBean.totalPage>10">
				<!-- 当前页数为前5页 -->
				<s:if test="pageBean.pageNum<5 ">
					<s:iterator var="i" begin="1" end="5">
						<s:if test="pageBean.pageNum != #i">
							<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />" ><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
						</s:if>
						<s:else>
							<li class="active"><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
						</s:else>
					</s:iterator>
					<li><a href="javascript:void(0);">... <span class="sr-only">(current)</span></a></li>
					<s:if test="pageBean.pageNum==pageBean.totalPage">
						<li class="active"><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="pageBean.totalPage"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="pageBean.totalPage"/> <span class="sr-only">(current)</span></a></li>
					</s:if>
					<s:else>
						<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="pageBean.totalPage"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="pageBean.totalPage"/> <span class="sr-only">(current)</span></a></li>
					</s:else>
				</s:if>
				<!-- 当前页数为最后5页 -->
				<s:elseif test="pageBean.pageNum>(pageBean.totalPage-5)">
					<s:if test="pageBean.pageNum==1">
						<li class="active" ><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=1&<s:property value="searchType" /><s:property value="query" />">1 <span class="sr-only">(current)</span></a></li>
					</s:if>
					<s:else>
						<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=1&<s:property value="searchType" /><s:property value="query" />">1 <span class="sr-only">(current)</span></a></li>
					</s:else>
					<li><a href="javascript:void(0);">... <span class="sr-only">(current)</span></a></li>
					<s:iterator var="i" begin="pageBean.totalPage-5" end="pageBean.totalPage">
						<s:if test="pageBean.pageNum != #i">
							<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
						</s:if>
						<s:else>
							<li class="active"><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
						</s:else>
					</s:iterator>
				</s:elseif>
				<!-- 当前页数为其他页数 -->
				<s:else>
					<s:if test="pageBean.pageNum==1">
						<li class="active" ><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=1&<s:property value="searchType" /><s:property value="query" />">1 <span class="sr-only">(current)</span></a></li>
					</s:if>
					<s:else>
						<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=1&<s:property value="searchType" /><s:property value="query" />">1 <span class="sr-only">(current)</span></a></li>
					</s:else>
					<li><a href="javascript:void(0);">... <span class="sr-only">(current)</span></a></li>
					<s:iterator var="i" begin="pageBean.pageNum-2" end="pageBean.pageNum+2">
						<s:if test="pageBean.pageNum != #i">
							<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
						</s:if>
						<s:else>
							<li class="active"><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
						</s:else>
					</s:iterator>
					<li><a href="javascript:void(0);">... <span class="sr-only">(current)</span></a></li>
					<s:if test="pageBean.pageNum==pageBean.totalPage">
						<li class="active"><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="pageBean.totalPage"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="pageBean.totalPage"/> <span class="sr-only">(current)</span></a></li>
					</s:if>
					<s:else>
						<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="pageBean.totalPage"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="pageBean.totalPage"/> <span class="sr-only">(current)</span></a></li>
					</s:else>
				</s:else>
			</s:if>
			<!-- 总页数少于5 -->
			<s:else>
				<s:iterator var="i" begin="1" end="pageBean.totalPage">
					<s:if test="pageBean.pageNum != #i">
						<li><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
					</s:if>
					<s:else>
						<li class="active"><a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="#i"/>&<s:property value="searchType" /><s:property value="query" />"><s:property value="#i"/> <span class="sr-only">(current)</span></a></li>
					</s:else>
				</s:iterator>
			</s:else>
					
			
					
			<s:if test="pageBean.totalPage!=0"> <!-- 总页数不为0 -->
			<s:if test="pageBean.pageNum == pageBean.totalPage">
				<li class="disabled">
				<a href="javascript:void(0);" aria-label="Next"><span aria-hidden="true">下一页»</span></a>
				</li>
			</s:if>
			<s:else>
				<li class="abled">
				<a href="${pageContext.request.contextPath}/news_<s:property value="link" />.html?page=<s:property value="pageBean.pageNum+1"/>&<s:property value="searchType" /><s:property value="query" />" aria-label="Next"><span aria-hidden="true">下一页»</span></a>
				</li>
			</s:else>
			</s:if>
			
		  </ul>
		  </div>
	<div class="clearfix"></div>
	</div>
	
	<%@ include file="foot.jsp" %>
	</body>
</html>
