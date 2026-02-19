<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="widget search">
   <header>
      <h3 class="h6">Search the blog</h3>
   </header>
   <form action="${pageContext.request.contextPath}/search-handler" class="search-form" method="get">
      <div class="form-group">
         <input type="text" name="term" placeholder="What are you looking for?" required>
         <button type="submit" class="submit">
            <i class="icon-search"></i>
         </button>
      </div>
   </form>
</div>

<div class="widget latest-posts">
   <header>
      <h3 class="h6">Latest Posts</h3>
   </header>
   <div class="blog-posts">
      <c:forEach var="latest" items="${latestPosts}">
         <a href="${pageContext.request.contextPath}/blog-post/${latest.seoUrl}">
            <div class="item d-flex align-items-center">
               <div class="image">
                  <img src="${pageContext.request.contextPath}/uploads/posts/${latest.image}" alt="${latest.title}" class="img-fluid"
                     onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
               </div>
               <div class="title">
                  <strong>${latest.title}</strong>
                  <div class="d-flex align-items-center">
                     <div class="views">
                        <i class="icon-eye"></i> ${latest.viewCount}
                     </div>
                     <div class="comments">
                        <i class="icon-comment"></i>${latest.comments.size()}</div>
                  </div>
               </div>
            </div>
         </a>
      </c:forEach>
   </div>
</div>

<div class="widget categories">
   <header>
      <h3 class="h6">Categories</h3>
   </header>
   <c:forEach var="cat" items="${categories}">
      <div class="item d-flex justify-content-between">
         <a href="${pageContext.request.contextPath}/blog-category/${cat.seoUrl}">${cat.name}</a>
         <span>${cat.posts.size()}</span>
      </div>
   </c:forEach>
</div>

<div class="widget tags">
   <header>
      <h3 class="h6">Tags</h3>
   </header>
   <ul class="list-inline">
      <c:forEach var="tag" items="${tags}">
         <li class="list-inline-item">
            <a href="${pageContext.request.contextPath}/blog-tag/${tag.seoUrl}" class="tag">#${tag.name}</a>
         </li>
      </c:forEach>
   </ul>
</div>