<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="row">
   <c:forEach var="post" items="${posts}">
      <div class="post post-custom col-xl-6">

         <div class="post-thumbnail">
            <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
               <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}" alt="${post.title}" class="img-fluid"
                  onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
            </a>
         </div>

         <div class="post-details">
            <div class="post-meta d-flex justify-content-between">
               <div class="date meta-last">
                  <fmt:formatDate value="${post.createdAtAsDate}" pattern="dd MMM | yyyy" />
               </div>
               <div class="category">
                  <c:choose>
                     <c:when test="${not empty post.category}">
                        <a href="${pageContext.request.contextPath}/blog-category/${post.category.seoUrl}"> ${post.category.name} </a>
                     </c:when>
                     <c:otherwise>
                        <span class="text-uppercase" style="color: #999; font-weight: bold; font-size: 0.9em;">Uncategorized</span>
                     </c:otherwise>
                  </c:choose>
               </div>
            </div>

            <a href="${pageContext.request.contextPath}/blog-post/${post.seoUrl}">
               <h3 class="h4">${post.title}</h3>
            </a>

            <p class="text-muted">${post.description}</p>

            <footer class="post-footer d-flex align-items-center">
               <a href="${pageContext.request.contextPath}/blog-author/${post.user.seoUrl}" class="author d-flex align-items-center flex-wrap">
                  <div class="avatar">
                     <img src="${pageContext.request.contextPath}/uploads/users/${post.user.image}" alt="${post.user.name}" class="img-fluid"
                        onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                  </div>
                  <div class="title">
                     <span>${post.user.name} ${post.user.surname}</span>
                  </div>
               </a>
               <div class="date">
                  <i class="icon-clock"></i> ${post.timeAgo}
               </div>
               <div class="comments meta-last">
                  <i class="icon-comment"></i>${post.comments.size()}
               </div>
            </footer>
         </div>
      </div>
   </c:forEach>
</div>

<c:if test="${totalPages > 1}">
   <nav aria-label="Page navigation example">
      <ul class="pagination pagination-template d-flex justify-content-center">

         <c:if test="${currentPage > 1}">
            <li class="page-item">
               <a href="?page=${currentPage - 1}" class="page-link">
                  <i class="fa fa-angle-left"></i>
               </a>
            </li>
         </c:if>

         <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
               <a href="?page=${i}" class="page-link">${i}</a>
            </li>
         </c:forEach>

         <c:if test="${currentPage < totalPages}">
            <li class="page-item">
               <a href="?page=${currentPage + 1}" class="page-link">
                  <i class="fa fa-angle-right"></i>
               </a>
            </li>
         </c:if>

      </ul>
   </nav>
</c:if>