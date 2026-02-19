<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<footer class="main-footer">
   <div class="container">
      <div class="row">
         <div class="col-md-4">
            <div class="logo">
               <h6 class="text-white">Bootstrap Blog</h6>
            </div>
            <div class="contact-details">
               <p>53 Broadway, Broklyn, NY 11249</p>
               <p>Phone: (381) 430 453 937</p>
               <p>
                  Email:
                  <a href="mailto:danilogomanjuk93@gmail.com">danilogomanjuk93@gmail.com</a>
               </p>
               <ul class="social-menu">

                  <li class="list-inline-item">
                     <a href="https://www.linkedin.com/in/danilgomanjuk/">
                        <i class="fa fa-linkedin"></i>
                     </a>
                  </li>

                  <li class="list-inline-item">
                     <a href="https://github.com/DanilG93/blog-cms-project">
                        <i class="fa fa-github"></i>
                     </a>
                  </li>

               </ul>
            </div>
         </div>
         <div class="col-md-4">
            <div class="menus d-flex">
               <ul class="list-unstyled">
                  <li>
                     <a href="${pageContext.request.contextPath}/">Home</a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/blog">Blog</a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/contact">Contact</a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/login">Login</a>
                  </li>
               </ul>
               <ul class="list-unstyled">
                  <c:forEach var="category" items="${categories}" begin="0" end="3">
                     <li>
                        <a href="${pageContext.request.contextPath}/blog-category/${category.seoUrl}">${category.name}</a>
                     </li>
                  </c:forEach>
               </ul>
            </div>
         </div>
         <div class="col-md-4">
            <div class="latest-posts">

               <c:forEach var="post" items="${firstThreeImportantPosts}">
                  <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
                     <div class="post d-flex align-items-center">
                        <div class="image">
                           <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}" alt="${post.title}" class="img-fluid"
                              onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                        </div>
                        <div class="title">
                           <strong>${post.title}</strong>
                           <span class="date last-meta">
                              <fmt:formatDate value="${post.createdAtAsDate}" pattern="MMMM dd, yyyy" />
                           </span>
                        </div>
                     </div>
                  </a>
               </c:forEach>
            </div>
         </div>
      </div>
   </div>
   <div class="copyrights">
      <div class="container">
         <div class="row">
            <div class="col-md-6">
               <p>&copy; 2017. All rights reserved. Your great site.</p>
            </div>
            <div class="col-md-6 text-right">
               <p>
                  Template By
                  <a href="https://bootstrapious.com/p/bootstrap-carousel" class="text-white">Bootstrapious</a>
                  <!-- Please do not remove the backlink to Bootstrap Temple unless you purchase an attribution-free license @ Bootstrap Temple or support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :)                         -->
               </p>
            </div>
         </div>
      </div>
   </div>
</footer>
<!-- JavaScript files-->
<script src="${pageContext.request.contextPath}/front-theme/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/front-theme/vendor/popper.js/umd/popper.min.js">
	
</script>
<script src="${pageContext.request.contextPath}/front-theme/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/front-theme/vendor/jquery.cookie/jquery.cookie.js">
	
</script>
<script src="${pageContext.request.contextPath}/front-theme/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
<script src="${pageContext.request.contextPath}/front-theme/js/front.js"></script>


<script src="${pageContext.request.contextPath}/front-theme/plugins/owl-carousel2/owl.carousel.min.js"></script>
