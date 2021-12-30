<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="com.chondo.util.SecurityUtils"%>
<%@page import="com.chondo.util.PriceUtil"%>
<c:url var="searchAPI" value="/dat-phong" />
<c:url var="ratingAPI" value="/danh-gia" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết phòng</title>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.animated {
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	transition: height 0.2s;
}

.stars {
	margin: 20px 0;
	font-size: 24px;
	color: #d17581;
}
</style>
</head>
<body>
	<div class="roomDetailsPage">
		<div class="mainRoomDetails">
			<c:forEach items="${model.listResult}" var="roomType">
				<h3>${roomType.name}${search.location}</h3>
				<div class="sliderImage">
					<img alt="" id="mainImage"
						src="<c:url value='/template/web/images/room/${roomType.image}'/>">
					<ul id="allImage">
						<c:forEach items="${roomType.images}" var="image">
							<li><img
								src="<c:url value='/template/web/images/room/${image.url}'/>" /></li>
						</c:forEach>
					</ul>
				</div>
				<h3 style="margin-top: 20px;">Đánh giá</h3>
				<div class="container">
					<div class="row" style="margin-top: 40px;">
						<div class="col-md-6">
							<div class="well well-sm">
								<div class="text-right">
									<a class="btn btn-success btn-green" href="#reviews-anchor"
										id="open-review-box">Đánh giá của bạn</a>
								</div>

								<div class="row" id="post-review-box" style="display: none;">
									<div class="col-md-12">

										<form accept-charset="UTF-8"  method="post">
											<input id="ratings-hidden" name="rate" type="hidden">
											<textarea class="form-control animated" cols="50"
												id="new-review" name="comment"
												placeholder="Nhập bình luận của bạn..." rows="5"></textarea>

											<div class="text-right">
												<div class="stars starrr" data-rating="0"></div>
												<a class="btn btn-danger btn-sm" href="#"
													id="close-review-box"
													style="display: none; margin-right: 10px;"> <span
													class="glyphicon glyphicon-remove"></span>Hủy
												</a>
												<button class="btn btn-success btn-lg" style="line-height: 0;" type="submit">Gửi</button>
											</div>
										</form>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<h3 style="margin-top: 20px;">Giới thiệu</h3>
				<p style="margin-bottom: 20px; font-weight: 600; font-size: 19px;">
					Phòng có diện tích ${roomType.acreage} m<sup>2</sup>
				</p>
				<p style="font-size: 20px; margin-bottom: 20px;">Nội thất:</p>
				<c:forEach items="${roomType.furnitures}" var="furniture">
					<p style="font-weight: 600; font-size: 19px;">
						${furniture.quality} ${furniture.name}</p>
				</c:forEach>

				<div class="review">
					<input type="hidden" id="review" value="${roomType.review}">
				</div>

				<h3 style="margin-top: 20px;">Các dịch vụ miễn phí</h3>
				<c:forEach items="${roomType.services}" var="service">
					<span
						style="margin: 0px 20px 20px 0px; white-space: nowrap; display: inline-block; font-size: 19px;">
						${service.symbol} ${service.name}</span>
				</c:forEach>

				<div class="sliderServiceImage">
					<img alt="" id="mainServiceImage" src="">
					<ul id="allServiceImage">
						<c:forEach items="${roomType.services}" var="service">
							<c:if test="${service.image != null}">
								<li><img
									src="<c:url value='/template/web/images/service/${service.image}'/>" /></li>
							</c:if>
						</c:forEach>
					</ul>
				</div>


			</c:forEach>
		</div>

		<div class="filter">
			<div class="booking-box">
				<div class="booking-form">
					<form:form id="formSubmit" action="${searchAPI}" method="get"
						modelAttribute="search">
						<div class="b-date arrive mb-15">
							<form:input path="dateFrom" autocomplete="off"
								data-date-format="dd/mm/yyyy" class="date-picker"
								placeholder="Ngày đến" style="pointer-events: none;" />
						</div>
						<div class="b-date departure mb-15">
							<form:input path="dateTo" autocomplete="off"
								data-date-format="dd/mm/yyyy" class="date-picker"
								placeholder="Ngày đi" style="pointer-events: none;" />
						</div>
						<div class="mb-15">
							<form:select path="adult"
								style="pointer-events: none;appearance: none;">
								<option disabled value="">Số lượng người lớn</option>
								<form:option value="1">1 người lớn</form:option>
								<form:option value="2">2 người lớn</form:option>
								<form:option value="3">3 người lớn</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="children"
								style="pointer-events: none;appearance: none;">
								<option disabled value="">Số lượng trẻ em</option>
								<form:option value="0">0 trẻ em</form:option>
								<form:option value="1">1 trẻ em</form:option>
								<form:option value="2">2 trẻ em</form:option>
								<form:option value="3">3 trẻ em</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="roomCount"
								style="pointer-events: none;appearance: none;">
								<option disabled value="">Số lượng phòng</option>
								<form:option value="1">1 phòng</form:option>
								<form:option value="2">2 phòng</form:option>
								<form:option value="3">3 phòng</form:option>
							</form:select>
						</div>
						<div class="mb-15">
							<form:select path="location"
								style="pointer-events: none;appearance: none;">
								<option disabled value="">Địa điểm</option>
								<form:option value="Vũng Tàu">Vũng Tàu</form:option>
								<form:option value="Đà Lạt">Đà Lạt</form:option>
							</form:select>
						</div>
						<c:forEach items="${model.listResult}" var="roomType">

							<c:if test="${roomType.originalPrice == roomType.sellPrice}">
								<p>${PriceUtil.convert(roomType.originalPrice)}VND</p>
								<p style="font-size: 15px;">/ đêm / phòng</p>
							</c:if>
							<c:if test="${roomType.originalPrice != roomType.sellPrice}">
								<p id="orgPrice">${PriceUtil.convert(roomType.originalPrice)}
									VND</p>
								<p>${PriceUtil.convert(roomType.sellPrice)}VND</p>
								<p style="font-size: 15px;">/ đêm / phòng</p>
							</c:if>
							<p>x</p>
							<p style="font-size: 15px;">${search.nightCount}đêm/
								${search.roomCount} phòng</p>
							<p style="font-size: 25px;">${PriceUtil.convert(roomType.sellPrice * search.nightCount * search.roomCount)}
								VND</p>

							<input type="hidden" name="roomTypeId" value="${roomType.id}" />
						</c:forEach>

						<button id="booking" class="btn btn-success">Đặt phòng
							ngay</button>

					</form:form>
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		
	</script>
	<script
		src="<c:url value = "/template/pagination/jquery.twbsPagination.js" />"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {

					$('.review').html($('#review').val());
					$('#allImage li img').on('click', function(event) {
						var src = $(this).attr('src');
						$('#mainImage').attr('src', src);
					});
					$('#mainServiceImage').attr('src',
							$('#allServiceImage li img').first().attr('src'));
					$('#allServiceImage li img').on('click', function(event) {
						var src = $(this).attr('src');
						$('#mainServiceImage').attr('src', src);
					});

					/* $('#booking').on('click', function(event) {
						event.preventDefault();
						var data = {};
						var formData = $('#formSubmit').serializeArray();
						$.each(formData, function(i, v) {
							data["" + v.name + ""] = v.value;
						});
						booking(data);
						
					}); */
					$('#ratingForm').on('submit', function(event) {
						event.preventDefault();
						let data = {};
						let formData = $('#ratingForm').serializeArray();
						$.each(formData, function(i, v) {
							data["" + v.name + ""] = v.value;
						})
						console.log(formData);
					})

				});
		(function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);

		var __slice=[].slice;(function(e,t){var n;n=function(){function t(t,n){var r,i,s,o=this;this.options=e.extend({},this.defaults,n);this.$el=t;s=this.defaults;for(r in s){i=s[r];if(this.$el.data(r)!=null){this.options[r]=this.$el.data(r)}}this.createStars();this.syncRating();this.$el.on("mouseover.starrr","span",function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("mouseout.starrr",function(){return o.syncRating()});this.$el.on("click.starrr","span",function(e){return o.setRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("starrr:change",this.options.change)}t.prototype.defaults={rating:void 0,numStars:5,change:function(e,t){}};t.prototype.createStars=function(){var e,t,n;n=[];for(e=1,t=this.options.numStars;1<=t?e<=t:e>=t;1<=t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}return n};t.prototype.setRating=function(e){if(this.options.rating===e){e=void 0}this.options.rating=e;this.syncRating();return this.$el.trigger("starrr:change",e)};t.prototype.syncRating=function(e){var t,n,r,i;e||(e=this.options.rating);if(e){for(t=n=0,i=e-1;0<=i?n<=i:n>=i;t=0<=i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}if(e&&e<5){for(t=r=e;e<=4?r<=4:r>=4;t=e<=4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}if(!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}};return t}();return e.fn.extend({starrr:function(){var t,r;r=arguments[0],t=2<=arguments.length?__slice.call(arguments,1):[];return this.each(function(){var i;i=e(this).data("star-rating");if(!i){e(this).data("star-rating",i=new n(e(this),r))}if(typeof r==="string"){return i[r].apply(i,t)}})}})})(window.jQuery,window);$(function(){return $(".starrr").starrr()})

		$(function(){

		  $('#new-review').autosize({append: "\n"});

		  var reviewBox = $('#post-review-box');
		  var newReview = $('#new-review');
		  var openReviewBtn = $('#open-review-box');
		  var closeReviewBtn = $('#close-review-box');
		  var ratingsField = $('#ratings-hidden');

		  openReviewBtn.click(function(e)
		  {
		    reviewBox.slideDown(400, function()
		      {
		        $('#new-review').trigger('autosize.resize');
		        newReview.focus();
		      });
		    openReviewBtn.fadeOut(100);
		    closeReviewBtn.show();
		  });

		  closeReviewBtn.click(function(e)
		  {
		    e.preventDefault();
		    reviewBox.slideUp(300, function()
		      {
		        newReview.focus();
		        openReviewBtn.fadeIn(200);
		      });
		    closeReviewBtn.hide();
		    
		  });

		  $('.starrr').on('starrr:change', function(e, value){
		    ratingsField.val(value);
		  });
		});
	</script>
</body>
</html>