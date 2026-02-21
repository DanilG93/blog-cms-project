<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../fragments/head-admin.jsp" />
</head>

<body class="hold-transition sidebar-mini sidebar-no-expand">
   <div class="wrapper">

      <jsp:include page="../../fragments/nav-bar-admin.jsp" />
      <jsp:include page="../../fragments/side-bar-admin.jsp" />

      <div class="content-wrapper">

         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Comments Management</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Comments</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-12">
                     <div class="card">

                        <div class="card-header">
                           <h3 class="card-title">All comments</h3>

                           <div class="card-tools">
                              <form action="${pageContext.request.contextPath}/administration/comments" method="get" class="form-inline">

                                 <div class="input-group input-group-sm">

                                    <select name="postId" class="form-control float-right">
                                       <option value="">-- All Posts --</option>
                                       <c:forEach var="post" items="${postList}">
                                          <option value="${post.id}" ${post.id == selectedPostId ? 'selected' : ''}>${post.title}</option>
                                       </c:forEach>
                                    </select>

                                    <div class="input-group-append">
                                       <button type="submit" class="btn btn-default">
                                          <i class="fas fa-filter"></i> Filter
                                       </button>
                                       <a href="${pageContext.request.contextPath}/administration/comments" class="btn btn-default">
                                          <i class="fas fa-sync-alt"></i>
                                       </a>

                                       <button type="button" class="btn btn-default disabled" disabled>Active on post</button>
                                    </div>

                                 </div>
                              </form>
                           </div>
                        </div>

                        <div class="card-body">

                           <c:if test="${empty commentList}">
                              <div class="alert alert-warning">No comments found based on your criteria.</div>
                           </c:if>

                           <c:forEach var="comment" items="${commentList}">

                              <div class="card card-outline ${comment.isEnabled ? 'card-primary' : 'card-secondary'}">

                                 <div class="card-header">
                                    <strong class="card-title">
                                       <strong>${comment.name}</strong>
                                       left a comment on the post:
                                       <strong>${comment.post.title}</strong>
                                       <small style="color: gray; margin-left: 10px;">
                                          <fmt:formatDate value="${comment.createdAtAsDate}" pattern="(MMM yyyy)" />
                                       </small>


                                    </strong>
                                    <c:if test="${!comment.isRead}">
                                       <span class="right badge badge-danger fading-badge">New</span>
                                    </c:if>
                                 </div>


                                 <%
                                 pageContext.setAttribute("newLine", "\n");
                                 %>
                                 <div class="card-body d-flex align-items-center">

                                    <div>
                                       <c:out value="${fn:replace(comment.content, newLine, '<br/>')}" escapeXml="false" />
                                       <small class="text-muted d-block mt-1">
                                          <strong>Email:</strong>
                                          ${comment.email}
                                       </small>
                                    </div>

                                    <div class="custom-control custom-switch ml-auto pl-3">
                                       <input type="checkbox" class="custom-control-input" id="switch${comment.id}" ${comment.isEnabled ? 'checked' : ''}
                                          onchange="window.location.href='${pageContext.request.contextPath}/administration/comments/toggle-status/${comment.id}'">

                                       <label class="custom-control-label" for="switch${comment.id}"></label>
                                    </div>

                                 </div>
                              </div>

                           </c:forEach>
                        </div>
                        <div class="card-footer clearfix"></div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </div>
      <jsp:include page="../../fragments/footer-admin.jsp" />

   </div>
</body>
</html>