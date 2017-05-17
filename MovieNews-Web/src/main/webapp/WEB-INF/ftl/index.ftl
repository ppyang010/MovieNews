	<#include "/common/base_macro.ftl">
	
	<@base base_title="index">

		<div class="main-content">
			<!-- menu starts -->
			<#include "/common/menu.ftl">
	   		<!-- menu end -->
	
			<!-- AddThis Smart Layers END -->
	
	
			<div class="main-banner">
			 <div class="banner col-md-8">
				<section class="slider">
					<div class="flexslider">
							<ul class="slides">
							<s:iterator var="p" value="pList">
							<li>
							  <a href="${basePath}/movies_moviesSingle.html?id=">
								<img src="${basePath}/static/images/pic4.jpg" class="img-responsive" alt="" />
								</a>
							</li>
							</s:iterator>
					  </ul>
					</div>
						</section>
					 <!-- FlexSlider -->
					 <script defer src="${basePath}/js/js/jquery.flexslider.js"></script>
					 <link rel="stylesheet" href="${basePath}/js/css/flexslider.css" type="text/css" media="screen" />
						<script type="text/javascript">
					$(function(){
					 //SyntaxHighlighter.all();
					});
					//使用 响应式旋转木马插件jquery Flexisel
					$(window).load(function(){
					  $('.flexslider').flexslider({
						animation: "slide",
						start: function(slider){
						  $('body').removeClass('loading');
						}
					 });
					});
				 </script>
	         </div>
			 <div class="col-md-4 banner-right">
			 	${hello!}
				<h2>系统公告</h2>
						<div class="post-article">
							<a href="${basePath}/notice_toNotice.html?id="  class="post-title" target="_blank" style="font-weight:500">
							空白标题</a>
							<span >2017-01-01 24：00</span>
						</div>
				<a href="${basePath}/notice_toNoticeList.html">更多...</a>
			 </div>
			 <div class="clearfix"></div>
		</div>
		
			<div class="review-slider">
				<h4 style="display: inline;">正在热映- <s:property value="#session.city"/></h4> 
				 <a class="play-icon " data-toggle="modal" data-target="#cityModal" >切换城市</a>
				
				
				<ul id="flexiselDemo1">
				<s:iterator var="im" value="imList" status="status">
					<li>
						<a href="${basePath}/movies_moviesSingle.html?id=<s:property value="#im.id" />"  target="blank" >
						<img src="<s:property value="#im.images.large" />" alt="" style="max-height:277px"/></a>
						<div class="slide-title"><h4 style="height:30px"> <s:property value="#im.title" /> </h4></div>
						<div class="date-city">
							<p>评分：<s:property value="#im.rating.average"/></p>
							<!-- struts计数 
							<h6><s:property value="#status.count"/></h6>-->
							<div class="buy-tickets">
								<a id="gz<s:property value="#im.id" />" href="javascript:void(0);" onclick="addFocus(<s:property value="#im.id" />)">关注</a>
									<s:iterator var="f" value="focusList">
										<s:if test="#f.mid==#im.id">
											<script>
												//alert(<s:property value="#p.nid"/>);
												$('[id=gz<s:property value="#im.id"/>]').text("已关注");
												$('[id=gz<s:property value="#im.id"/>]').attr('onclick','removeFocus(<s:property value="#im.id"/>)');
											</script>
										</s:if>
									</s:iterator>
							</div>
						</div>
					</li>
				</s:iterator>
			</ul>
			<script type="text/javascript">
			$(window).load(function() {
				//使用 响应式旋转木马插件jquery Flexisel
			  $("#flexiselDemo1").flexisel({
					visibleItems: 6,//一行显数的个数
					animationSpeed: 1000,//动画时间
					autoPlay: true,		//自动播放
					autoPlaySpeed: 3000, //播放间隔时间	
					pauseOnHover: false, //鼠标悬浮是否停止播放
					enableResponsiveBreakpoints: true, //是否开启响应式
					responsiveBreakpoints: { 
						portrait: {  //项目名，可随意命名
							changePoint:480,  //屏幕最大像素，意思为当屏幕最大像素为480时，只显示一个Item，即例子只显示一张图片。
							visibleItems: 2  //只显示一个Item，下面的雷同
						}, 
						landscape: { 
							changePoint:640,
							visibleItems: 3
						},
						tablet: { 
							changePoint:800,
							visibleItems: 4
						}
					}
				});
				});
			</script>
			<script type="text/javascript" src="${basePath}/js/js/jquery.flexisel.js"></script>	
			</div>
			<div class="footer-top-grid">
		<div class="list-of-movies col-md-8">
			<div class="tabs">
				<div class="sap_tabs">	
				<!-- 新闻列表 -->
						 <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>新闻</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>猜你喜欢</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>你的关注</span></li>
							  <div class="clearfix"></div>
						  </ul>				  	 
							<div class="resp-tabs-container">
							    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							    	<a href="${basePath}/news_toNewsList.html">更多...</a>
										<#list pageBean.list as n>
											<div class="post-article">
												<a href="${basePath}/news_jumpToNews.html?nid="  class="post-title" target="_blank">
												${n.title}</a>
												<i>${n.time?string("yyyy-MM-dd HH:mm:ss")}</i>
												<a id="sc" href="javascript:void(0)" onclick="addFavorites()" style="float:right">收藏</a>
												<!--<s:iterator var="f" value="fList">
													<s:if test="#f.nid==#p.nid">
														<script>
															//alert(<s:property value="#p.nid"/>);
															$('[id=sc<s:property value="#p.nid"/>]').text("已收藏");
															$('[id=sc<s:property value="#p.nid"/>]').attr('onclick','removeFavorites(<s:property value="#p.nid"/>)');
														</script>
													</s:if>
												</s:iterator>-->
												<p>${n.lead}<br> 
												<a href="${basePath}/news_jumpToNews.html?nid="  style="color:blue" target="_blank">Read more</a></p>
											</div>
										</#list>	
							     </div>	
							     
			     		    </div>	
                        </div>
					</div>
				</div>	
				<div class="clearfix"></div>
			
			</div>
			<div class="right-side-bar">
				<div class="top-movies-in-india">
					<h4>即将上映</h4>
					<!-- class="mov_list" -->
					<ul  id='demo-1'  class="mov_list" style="margin-top:10px">
					<s:iterator var="com" value="comList" status="status" >
					<li>
						<ul>
							<li><a href="${basePath}/movies_moviesSingle.html?id=<s:property value="#com.id" />" target="_blank" ><i class="fa fa-star"></i></a></li>
							<li class="dropdown">
							 <a data-toggle="dropdown" href="#"   onclick="toMoviesList('${basePath}/movies_moviesSingle.html?id=<s:property value="#com.id" />')">
							<b><s:property value="#com.title"/></b></a>
								 <ul class="dropdown-menu animated" data-animation="fadeInDown" style="min-width:300px">
		                        	<li>
		                        		<div class="left-img col-md-5" >
										<a href="${basePath}/movies_moviesSingle.html?id=<s:property value="#com.id" />"  target="_blank" >	<img src="<s:property value="#com.images.small" />" /></a>
										</div>
										<div class="left-img col-md-7">
										<p>导演：<s:iterator var="d" value="#com.directors"><s:property value="#d.name" /> </s:iterator>  <br/>
										主演：<s:iterator var="d" value="#com.casts"><s:property value="#d.name" /> </s:iterator><br/>
										类型：<s:property value="#com.genres" /><br/>
										豆瓣评分：<s:property value="#com.rating.average" /><br/>
										<a id="gz<s:property value="#com.id" />" href="javascript:void(0);" onclick="addFocus(<s:property value="#com.id" />)">关注</a>
										<s:iterator var="f" value="focusList">
											<s:if test="#f.mid==#com.id">
												<script>
													//alert(<s:property value="#p.nid"/>);
													$('[id=gz<s:property value="#com.id"/>]').text("已关注");
													$('[id=gz<s:property value="#com.id"/>]').attr('onclick','removeFocus(<s:property value="#com.id"/>)');
												</script>
											</s:if>
										</s:iterator>
										</p>
										</div>
		                        	</li>
		                    	</ul>
							</li>
						</ul>
					</li>	<br/> <br/>
					
					</s:iterator>
	                </ul>
				</div>
				<div class="quick-pay">
					<h3>票房榜</h3>
					<p class="payText">数据缺失<a href="#">Read more</a></p>
				</div>
				
			</div>
			<div class="clearfix"></div>			
		</div>
		
		</div>
	</@base>
		