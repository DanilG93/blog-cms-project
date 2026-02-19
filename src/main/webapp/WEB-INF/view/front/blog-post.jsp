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
      <jsp:include page="../fragments/header-nav-bar-front.jsp" />
   </header>
   <div class="container">
      <div class="row">
         <!-- Latest Posts -->
         <main class="post blog-post col-lg-8">
            <div class="container">

               <c:if test="${empty post}">
                  <div class="alert alert-warning p-4 mt-4">
                     <h4>Post not found</h4>
                     <p>
                        We couldn't find the post "
                        <strong>${postForSearch}</strong>
                        ". It may have been deleted or the URL is incorrect.
                     </p>
                  </div>
               </c:if>

               <c:if test="${not empty post}">
                  <div class="post-single">
                     <div class="post-thumbnail">
                        <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}" alt="${post.title}" class="img-fluid"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                     </div>
                     <div class="post-details">
                        <div class="post-meta d-flex justify-content-between">
                           <div class="category">
                              <a href="${pageContext.request.contextPath}/blog-category/${post.category.seoUrl}">${post.category.name}</a>
                           </div>
                        </div>
                        <h1>
                           ${post.title}
                           <a href="#">
                              <i class="fa fa-bookmark-o"></i>
                           </a>
                        </h1>
                        <div class="post-footer d-flex align-items-center flex-column flex-sm-row">
                           <a href="${pageContext.request.contextPath}/blog-author/${post.user.seoUrl}" class="author d-flex align-items-center flex-wrap">
                              <div class="avatar">
                                 <img src="${pageContext.request.contextPath}/uploads/users/${post.user.image}" alt="${post.user.name}" class="img-fluid"
                                    onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                              </div>
                              <div class="title">
                                 <span>${post.user.name} ${post.user.surname}</span>
                              </div>
                           </a>
                           <div class="d-flex align-items-center flex-wrap">
                              <div class="date">
                                 <i class="icon-clock"></i> ${post.timeAgo}
                              </div>
                              <div class="views">
                                 <i class="icon-eye"></i> ${post.viewCount}
                              </div>
                              <div class="comments meta-last">
                                 <a href="#post-comments">
                                    <i class="icon-comment"></i>${post.comments.size()}
                                 </a>
                              </div>
                           </div>
                        </div>

                        <div class="post-body">
                           <p class="lead">${post.description}</p>
                           <c:out value="${post.content}" escapeXml="false" />
                        </div>


                        <div class="post-tags">
                           <c:forEach var="tag" items="${tags}">
                              <a href="${pageContext.request.contextPath}/blog-tag/${tag.seoUrl}" class="tag">#${tag.name}</a>
                           </c:forEach>
                        </div>


                        <div class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row">
                           <a href="#" class="prev-post text-left d-flex align-items-center">
                              <div class="icon prev">
                                 <i class="fa fa-angle-left"></i>
                              </div>
                              <div class="text">
                                 <strong class="text-primary">Previous Post </strong>
                                 <h6>I Bought a Wedding Dress.</h6>
                              </div>
                           </a>
                           <a href="#" class="next-post text-right d-flex align-items-center justify-content-end">
                              <div class="text">
                                 <strong class="text-primary">Next Post </strong>
                                 <h6>I Bought a Wedding Dress.</h6>
                              </div>
                              <div class="icon next">
                                 <i class="fa fa-angle-right"> </i>
                              </div>
                           </a>
                        </div>


                        <div class="post-comments" id="post-comments">
                           <header>
                              <h3 class="h6">
                                 Post Comments
                                 <span class="no-of-comments">(3)</span>
                              </h3>
                           </header>
                           <div class="comment">
                              <div class="comment-header d-flex justify-content-between">
                                 <div class="user d-flex align-items-center">
                                    <div class="image">
                                       <img src="img/user.svg" alt="..." class="img-fluid rounded-circle">
                                    </div>
                                    <div class="title">
                                       <strong>Jabi Hernandiz</strong>
                                       <span class="date">May 2016</span>
                                    </div>
                                 </div>
                              </div>
                              <div class="comment-body">
                                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua. Ut enim ad minim veniam.</p>
                              </div>
                           </div>
                           <div class="comment">
                              <div class="comment-header d-flex justify-content-between">
                                 <div class="user d-flex align-items-center">
                                    <div class="image">
                                       <img src="img/user.svg" alt="..." class="img-fluid rounded-circle">
                                    </div>
                                    <div class="title">
                                       <strong>Nikolas</strong>
                                       <span class="date">May 2016</span>
                                    </div>
                                 </div>
                              </div>
                              <div class="comment-body">
                                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua. Ut enim ad minim veniam.</p>
                              </div>
                           </div>
                           <div class="comment">
                              <div class="comment-header d-flex justify-content-between">
                                 <div class="user d-flex align-items-center">
                                    <div class="image">
                                       <img src="img/user.svg" alt="..." class="img-fluid rounded-circle">
                                    </div>
                                    <div class="title">
                                       <strong>John Doe</strong>
                                       <span class="date">May 2016</span>
                                    </div>
                                 </div>
                              </div>
                              <div class="comment-body">
                                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                                    aliqua. Ut enim ad minim veniam.</p>
                              </div>
                           </div>
                        </div>
                        <div class="add-comment">
                           <header>
                              <h3 class="h6">Leave a reply</h3>
                           </header>
                           <form action="#" class="commenting-form">
                              <div class="row">
                                 <div class="form-group col-md-6">
                                    <input type="text" name="username" id="username" placeholder="Name" class="form-control">
                                 </div>
                                 <div class="form-group col-md-6">
                                    <input type="email" name="username" id="useremail" placeholder="Email Address (will not be published)" class="form-control">
                                 </div>
                                 <div class="form-group col-md-12">
                                    <textarea name="usercomment" id="usercomment" placeholder="Type your comment" class="form-control"></textarea>
                                 </div>
                                 <div class="form-group col-md-12">
                                    <button type="submit" class="btn btn-secondary">Submit Comment</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>

               </c:if>
            </div>
         </main>
         <aside class="col-lg-4">
            <jsp:include page="../fragments/aside-sajdbar-front.jsp" />
         </aside>
      </div>
   </div>
   <!-- Page Footer-->
   <jsp:include page="../fragments/footer-front.jsp" />
</body>
</html>