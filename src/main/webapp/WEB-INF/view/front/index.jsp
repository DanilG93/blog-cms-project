<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../fragments/head-front.jsp" />
</head>
<body>
   <header class="header">
      <!-- Main Navbar-->
      <jsp:include page="../fragments/header-nav-bar-front.jsp" />
   </header>

   <!-- Hero Section-->
   <div id="index-slider" class="owl-carousel">
      <c:forEach var="slider" items="${sliderList}">
         <section style="background: url('${pageContext.request.contextPath}/uploads/sliders/${slider.image}');" class="hero-slider-custom">
            <div class="container">
               <div class="row">
                  <div class="col-lg-7">
                     <h1>${slider.title}</h1>
                     <a href="${slider.buttonUrl}" class="hero-link">${slider.buttonText}</a>
                  </div>
               </div>
            </div>
         </section>
      </c:forEach>
   </div>

   <!-- Intro Section-->
   <section class="intro">
      <div class="container">
         <div class="row">
            <div class="col-lg-8">
               <h2 class="h3">Some great intro here</h2>
               <p class="text-big">
                  Place a nice
                  <strong>introduction</strong>
                  here
                  <strong>to catch reader's attention</strong>
                  .
               </p>
            </div>
         </div>
      </div>
   </section>


   <section class="featured-posts no-padding-top">

      <div class="container">

         <c:forEach var="post" items="${firstThreeImportantPosts}" varStatus="status">


            <div class="row d-flex align-items-stretch">
               <c:choose>
                  <c:when test="${status.index % 2 == 0}">

                     <div class="text col-lg-7">
                        <div class="text-inner d-flex align-items-center">
                           <div class="content">
                              <header class="post-header">
                                 <div class="category">
                                    <a href="${pageContext.request.contextPath}/blog-category/${post.category.seoUrl}">${post.category.name}</a>
                                 </div>
                                 <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                                    <h2 class="h4">${post.title}</h2>
                                 </a>
                              </header>
                              <p>${post.description}</p>
                              <footer class="post-footer d-flex align-items-center">
                                 <a href="${pageContext.request.contextPath}/blog-author/${post.user.seoUrl}" class="author d-flex align-items-center flex-wrap">
                                    <div class="avatar">
                                       <img src="${pageContext.request.contextPath}/uploads/users/${post.user.image}"
                                          onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';"
                                          alt="${post.user.name}" class="img-fluid">
                                    </div>
                                    <div class="title">
                                       <span>${post.user.name} ${post.user.surname}</span>
                                    </div>
                                 </a>
                                 <div class="date">
                                    <i class="icon-clock"></i> ${post.timeAgo}
                                 </div>
                                 <div class="comments">
                                    <i class="icon-comment"></i>${post.comments.size()}
                                 </div>
                              </footer>
                           </div>
                        </div>
                     </div>
                     <div class="image col-lg-5">
                       <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                        <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';"
                           alt="${post.title}">
                           </a>
                     </div>

                  </c:when>

                  <c:otherwise>
                     <div class="image col-lg-5">
                       <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                        <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';"
                           alt="${post.title}">
                           </a>
                     </div>
                     <div class="text col-lg-7">
                        <div class="text-inner d-flex align-items-center">
                           <div class="content">
                              <header class="post-header">
                                 <div class="category">
                                    <a href="${pageContext.request.contextPath}/blog-category/${post.category.seoUrl}">${post.category.name}</a>
                                 </div>
                                 <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                                    <h2 class="h4">${post.title}</h2>
                                 </a>
                              </header>
                              <p>${post.description}</p>
                              <footer class="post-footer d-flex align-items-center">
                                 <a href="${pageContext.request.contextPath}/blog-author/${post.user.seoUrl}" class="author d-flex align-items-center flex-wrap">
                                    <div class="avatar">
                                       <img src="${pageContext.request.contextPath}/uploads/users/${post.user.image}" class="img-fluid"
                                          onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';"
                                          alt="${post.user.name}">
                                    </div>
                                    <div class="title">
                                       <span>${post.user.name} ${post.user.surname}</span>
                                    </div>
                                 </a>
                                 <div class="date">
                                    <i class="icon-clock"></i>${post.timeAgo}
                                 </div>
                                 <div class="comments">
                                    <i class="icon-comment"></i>${post.comments.size()}
                                 </div>
                              </footer>
                           </div>
                        </div>
                     </div>
                  </c:otherwise>
               </c:choose>
            </div>

         </c:forEach>
      </div>

   </section>
   <!-- Divider Section-->
   <section
      style="background: url(${pageContext.request.contextPath}/front-theme/img/divider-bg.jpg); background-size: cover; background-position: center bottom"
      class="divider">
      <div class="container">
         <div class="row">
            <div class="col-md-7">
               <h2>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</h2>
               <a href="${pageContext.request.contextPath}/contact" class="hero-link">Contact Us</a>
            </div>
         </div>
      </div>
   </section>
   <!-- Latest Posts -->


   <section class="latest-posts">
      <div class="container">
         <header>
            <h2>Latest from the blog</h2>
            <p class="text-big">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
         </header>
         <div class="owl-carousel" id="latest-posts-slider">


            <c:forEach var="post" items="${newPostList}">
               <div class="post">
                  <div class="post-thumbnail">
                     <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                        <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';"
                           alt="${post.title}" class="img-fluid">
                     </a>
                  </div>
                  <div class="post-details">
                     <div class="post-meta d-flex justify-content-between">
                        <div class="date">
                           <fmt:formatDate value="${post.createdAtAsDate}" pattern="dd MMM | yyyy" />
                        </div>
                        <div class="category">
                           <a href="${pageContext.request.contextPath}/blog-category/${post.category.seoUrl}">${post.category.name}</a>
                        </div>
                     </div>
                     <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                        <h3 class="h4">${post.title}</h3>
                     </a>
                     <p class="text-muted">${post.description}</p>
                  </div>
               </div>
            </c:forEach>


         </div>
      </div>
   </section>
   <!-- Gallery Section-->
   <section class="gallery no-padding">
      <div class="row">
         <div class="mix col-lg-3 col-md-3 col-sm-6">
            <div class="item">
               <a href="img/gallery-1.jpg" data-fancybox="gallery" class="image">
                  <img src="${pageContext.request.contextPath}/front-theme/img/gallery-1.jpg" alt="gallery image alt 1" class="img-fluid"
                     title="gallery image title 1">
                  <div class="overlay d-flex align-items-center justify-content-center">
                     <i class="icon-search"></i>
                  </div>
               </a>
            </div>
         </div>
         <div class="mix col-lg-3 col-md-3 col-sm-6">
            <div class="item">
               <a href="img/gallery-2.jpg" data-fancybox="gallery" class="image">
                  <img src="${pageContext.request.contextPath}/front-theme/img/gallery-2.jpg" alt="gallery image alt 2" class="img-fluid"
                     title="gallery image title 2">
                  <div class="overlay d-flex align-items-center justify-content-center">
                     <i class="icon-search"></i>
                  </div>
               </a>
            </div>
         </div>
         <div class="mix col-lg-3 col-md-3 col-sm-6">
            <div class="item">
               <a href="${pageContext.request.contextPath}/front-theme/img/gallery-3.jpg" data-fancybox="gallery" class="image">
                  <img src="${pageContext.request.contextPath}/front-theme/img/gallery-3.jpg" alt="gallery image alt 3" class="img-fluid"
                     title="gallery image title 3">
                  <div class="overlay d-flex align-items-center justify-content-center">
                     <i class="icon-search"></i>
                  </div>
               </a>
            </div>
         </div>
         <div class="mix col-lg-3 col-md-3 col-sm-6">
            <div class="item">
               <a href="${pageContext.request.contextPath}/front-theme/img/gallery-4.jpg" data-fancybox="gallery" class="image">
                  <img src="${pageContext.request.contextPath}/front-theme/img/gallery-4.jpg" alt="gallery image alt 4" class="img-fluid"
                     title="gallery image title 4">
                  <div class="overlay d-flex align-items-center justify-content-center">
                     <i class="icon-search"></i>
                  </div>
               </a>
            </div>
         </div>

      </div>
   </section>
   <!-- Page Footer-->
   <jsp:include page="../fragments/footer-front.jsp" />

   <script>
				$("#index-slider").owlCarousel({
					"items" : 1,
					"loop" : true,
					"autoplay" : true,
					"autoplayHoverPause" : true
				});

				$("#latest-posts-slider").owlCarousel({
					"items" : 3,
					"margin" : 30,
					"loop" : true,
					"autoplay" : true,
					"autoplayHoverPause" : true,
					"slideBy" : 'page'
				});
			</script>
</body>
</html>