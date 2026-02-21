<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

               <c:if test="${not empty successMessage}">
                  <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-top: 30px;">
                     <strong>Success!</strong>
                     ${successMessage}
                     <button type="button" class="close" data-dismiss="alert" aria-label="Close"
                        style="background: none; border: none; float: right; font-size: 1.5rem; line-height: 1;">
                        <span aria-hidden="true">&times;</span>
                     </button>
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

                           <c:if test="${not empty previousPost}">
                              <a href="${pageContext.request.contextPath}/blog-post/${previousPost.seoUrl}"
                                 class="prev-post text-left d-flex align-items-center">
                                 <div class="icon prev">
                                    <i class="fa fa-angle-left"></i>
                                 </div>
                                 <div class="text">
                                    <strong class="text-primary">Previous Post </strong>
                                    <h6>${previousPost.title}</h6>
                                 </div>
                              </a>
                           </c:if>

                           <c:if test="${empty previousPost}">
                              <div class="prev-post"></div>
                           </c:if>

                           <c:if test="${not empty nextPost}">
                              <a href="${pageContext.request.contextPath}/blog-post/${nextPost.seoUrl}"
                                 class="next-post text-right d-flex align-items-center justify-content-end">
                                 <div class="text">
                                    <strong class="text-primary">Next Post </strong>
                                    <h6>${nextPost.title}</h6>
                                 </div>
                                 <div class="icon next">
                                    <i class="fa fa-angle-right"> </i>
                                 </div>
                              </a>
                           </c:if>

                           <c:if test="${empty nextPost}">
                              <div class="next-post"></div>
                           </c:if>

                        </div>


                        <div class="post-comments" id="post-comments">

                           <c:if test="${not empty post.enabledComments}">
                              <header>
                                 <h3 class="h6">
                                    Post Comments
                                    <span class="no-of-comments">${post.enabledComments.size()}</span>
                                 </h3>
                              </header>

                              <c:forEach var="comment" items="${post.enabledComments}">
                                 <div class="comment">
                                    <div class="comment-header d-flex justify-content-between">
                                       <div class="user d-flex align-items-center">
                                          <div class="image">
                                             <img src="${pageContext.request.contextPath}/front-theme/img/user.svg" alt="..." class="img-fluid rounded-circle">
                                          </div>
                                          <div class="title">
                                             <strong>${comment.name}</strong>
                                             <span class="date">
                                                <fmt:formatDate value="${comment.createdAtAsDate}" pattern="MMM yyyy" />
                                             </span>
                                          </div>
                                       </div>
                                    </div>
                                    
                                    <% pageContext.setAttribute("newLine", "\n"); %>
                                    <div class="comment-body">
                                       <p>
                                          <c:out value="${fn:replace(comment.content, newLine, '<br/>')}" escapeXml="false" />
                                       </p>
                                    </div>
                                 </div>
                              </c:forEach>
                           </c:if>

                           <c:if test="${empty post.enabledComments}">
                              <header>
                                 <h3 class="h6">No Comments</h3>
                              </header>
                           </c:if>

                        </div>


                        <div class="add-comment">
                           <header>
                              <h3 class="h6">Leave a reply</h3>
                           </header>

                           <form action="${pageContext.request.contextPath}/add-comment" method="post" class="commenting-form">

                              <input type="hidden" name="postId" value="${post.id}">
                              <input type="hidden" name="seoUrl" value="${post.seoUrl}">

                              <div class="row">
                                 <div class="form-group col-md-6">
                                    <input type="text" name="name" id="username" placeholder="Name" class="form-control" required>
                                 </div>
                                 <div class="form-group col-md-6">
                                    <input type="email" name="email" id="useremail" placeholder="Email Address (will not be published)" class="form-control"
                                       required>
                                 </div>
                                 <div class="form-group col-md-12">
                                    <textarea name="content" id="usercomment" placeholder="Type your comment" class="form-control" required></textarea>
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