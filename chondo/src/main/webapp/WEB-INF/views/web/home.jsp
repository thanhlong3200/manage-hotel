<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<%@page import="com.chondo.util.PriceUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body>

<!--About Section Title start-->
        <div class="about-section text-center ptb-80 white_bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title mb-80">
                            <h2>About <span>Chondo</span></h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered by injected humour.</p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="about-chondo">
                            <div class="about-member">
                            
                            
                            
                            <c:url value ='images/about.jpg'/>
                            
                            
                            
                                <img alt="" src="<c:url value ='/template/web/images/about.jpg'/>">
                                <h3>Mohin patwary</h3>
                                <h5 class="mb-0">hrd head</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--About Section end-->
        <!--Our Room start-->
        <div class="our-room text-center ptb-80 white-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title mb-75">
                            <h2>BEST <span>SELLER</span></h2>
                  
                        </div>
                    </div>
                </div>
                <div class="our-room-show">
                    <div class="row">
                        <div class="carousel-list">
                        <c:forEach items="${listBestSeller}" var="roomType">
                        	<div class="col-md-4">
                                <div class="single-room">
                                    <div class="room-img">
                                        <a href="#"><img src="<c:url value='/template/web/images/room/${roomType.image}'/>" alt=""></a>
                                    </div>
                                    <div class="room-desc">
                                        <div class="room-name">
                                            <h3><a href="#">${roomType.name }</a></h3>
                                        </div>
                                        <div class="room-rent" style="padding-top:5px">
                                            <h5>${PriceUtil.convert(roomType.sellPrice)} đ/ <span>Đêm</span></h5>
                                        </div>
                                        <div class="room-book" style="padding-top:20px">
                                            <a href="<c:url value='http://localhost:8080/chondo/tim-kiem?dateFrom=24/12/2021&dateTo=25/12/2021&adult=1&children=0&roomCount=1&location=V%C5%A9ng+T%C3%A0u&page=1&limit=2&roomTypeId=${roomType.id}'/>">Book ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
       
       <div class="our-room text-center ptb-80 white-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title mb-75">
                            <h2>GỢI Ý<span> CHỌN PHÒNG</span></h2>
                  
                        </div>
                    </div>
                </div>
                <div class="our-room-show">
                    <div class="row">
                        <div class="carousel-list">
                        <c:forEach items="${listRoomType}" var="roomType">
                        	<div class="col-md-4">
                                <div class="single-room">
                                    <div class="room-img">
                                        <a href="#"><img src="<c:url value='/template/web/images/room/${roomType.image}'/>" alt=""></a>
                                    </div>
                                    <div class="room-desc">
                                        <div class="room-name">
                                            <h3><a href="#">${roomType.name }</a></h3>
                                        </div>
                                        <div class="room-rent" style="padding-top:5px">
                                            <h5>${PriceUtil.convert(roomType.sellPrice)} đ/ <span>Đêm</span></h5>
                                        </div>
                                        <div class="room-book" style="padding-top:20px">
                                            <a href="<c:url value='http://localhost:8080/chondo/tim-kiem?dateFrom=24/12/2021&dateTo=25/12/2021&adult=1&children=0&roomCount=1&location=V%C5%A9ng+T%C3%A0u&page=1&limit=2&roomTypeId=${roomType.id}'/>">Book ngay</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
       
       
       
       
        <!--Testimonial start-->
        <div class="staff-tesimonial text-center white_bg">
            <div class="testimonail-bg-opacity"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="testimonial-list">
                            <div class="single-testimonial">
                                <h2>Louis Smith</h2>
                               <p>There are many variations of passages of Lorem I available, but the majority have suffered alteration in som, d humour, or randomised words which
    </p>
                            </div>
                            <div class="single-testimonial">
                                <h2>Louis Smith</h2>
                               <p>There are many variations of passages of Lorem I available, but the majority have suffered alteration in som, d humour, or randomised words which
    </p>
                            </div>
                            <div class="single-testimonial">
                                <h2>Louis Smith</h2>
                               <p>There are many variations of passages of Lorem I available, but the majority have suffered alteration in som, d humour, or randomised words which
    </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!--Testimonial end-->
        <!--Our gallery start-->
        <div class="our-gallery text-center ptb-80 white_bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title mb-80">
                            <h2>our <span>Gallery</span></h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered by injected humour.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="our-gallery-photo">
                <div class="single-gallery">
                    <img src="images/gallery/g-1.jpg" alt="">
                </div>
                <div class="single-gallery">
                    <img src="images/gallery/g-2.jpg" alt="">
                </div>
                <div class="single-gallery">
                    <img src="images/gallery/g-5.jpg" alt="">
                </div>
                <div class="single-gallery">
                    <img src="images/gallery/g-4.jpg" alt="">
                </div>
                <div class="single-gallery">
                    <img src="images/gallery/g-5.jpg" alt="">
                </div>
            </div>
        </div>
        <!--Our gallery end-->
        <!--Our news start-->
        <div class="our-news text-center white_bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-title mb-80">
                            <h2>our <span>News</span></h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered by injected humour.</p>
                        </div>
                    </div>
                </div>
                <div class="news-list">
                    <div class="row">
                        <div class="col-md-12 pb-80">
                            <div class="news-inner">
                                <div class="news-img">
                                    <img src="images/news/n-1.jpg" alt="">
                                    <div class="news-post">
                                        <div class="n-date">15 June 2015</div>
                                        <a href="#" class="comment"><span><i class="mdi mdi-comment-processing-outline"></i></span> 20</a>
                                        <div class="news-views">
                                            <a href="#"><span><i class="mdi mdi-heart"></i></span>40</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="news-desc">
                                    <h3 class="news-title"><a href="#">Best Things to Do In London Enjoy Your life
    the Night life.</a> </h3>
                                    <p class="news_desc">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of tystem, and expound the actual teachings of the great explorer of the truth, the master-builder uman happiness. No one rejects, dislikes, or avoids pleasure itself, because it</p>
                                    <div class="news-action">
                                        <div class="read-more">
                                            <a href="#">Read more</a>
                                        </div>
                                        <div class="news-share">
                                            <p>Share:</p>
                                            <a href="#"><i class="mdi mdi-facebook"></i></a>
                                            <a href="#"><i class="mdi mdi-rss"></i></a>
                                            <a href="#"><i class="mdi mdi-google-plus"></i></a>
                                            <a href="#"><i class="mdi mdi-instagram"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 pb-80">
                            <div class="news-inner">
                                <div class="news-img">
                                    <img src="images/news/n-2.jpg" alt="">
                                    <div class="news-post">
                                        <div class="n-date">15 June 2015</div>
                                        <a href="#" class="comment"><span><i class="mdi mdi-comment-processing-outline"></i></span> 20</a>
                                        <div class="news-views">
                                            <a href="#"><span><i class="mdi mdi-heart"></i></span>40</a>
                                        </div>

                                    </div>
                                </div>
                                <div class="news-desc">
                                    <h3 class="news-title"><a href="#">Best Things to Do In London Enjoy Your life
    the Night life. </a></h3>
                                    <p class="news_desc">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of tystem, and expound the actual teachings of the great explorer of the truth, the master-builder uman happiness. No one rejects, dislikes, or avoids pleasure itself, because it</p>
                                    <div class="news-action">
                                        <div class="read-more">
                                            <a href="#">Read more</a>
                                        </div>
                                        <div class="news-share">
                                            <p>Share:</p>
                                            <a href="#"><i class="mdi mdi-facebook"></i></a>
                                            <a href="#"><i class="mdi mdi-rss"></i></a>
                                            <a href="#"><i class="mdi mdi-google-plus"></i></a>
                                            <a href="#"><i class="mdi mdi-instagram"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--Our news end-->
        <!--Hotel communities start-->
        <div class="hotel-cmmunities ptb-100 text-center">
            <div class="community-bg-opacity"></div>
            <div class="container">
                <div class="row">
                    <div class="communities-list">
                        <div class="single-commmunites">
                            <h1 class="counter">500</h1>
                            <h2>Customer</h2>
                        </div>
                        <div class="single-commmunites">
                            <h1 class="counter">200</h1>
                            <h2>clecbrities</h2>
                        </div>
                        <div class="single-commmunites">
                            <h1 class="counter">850</h1>
                            <h2>return</h2>
                        </div>
                        <div class="single-commmunites hidden-xs">
                            <h1 class="counter">1250</h1>
                            <h2>Happy people</h2>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--Hotel communities end-->
        <!--hotel team start-->
        <div class="hotel-team pt-100 white_bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="team-brand pb-100">
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-1.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-3.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-5.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-1.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-3.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                            </div>
                            <div class="single-team">
                                <a href="#"><img src="images/brand/b-5.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="newsletter-title">
                                        <h2>SUBSCRIBE TO OUR NEWSLETTER</h2>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="newsletter-form">
                                        <form id="mc-form" class="mc-form" >
											<input id="mc-email" type="email" autocomplete="off" placeholder="Enter Address..." />
											<button id="mc-submit" type="submit">Subscribe</button>
										</form>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
</body>

</html>