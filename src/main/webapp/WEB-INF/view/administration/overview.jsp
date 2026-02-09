<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../fragments/head-admin.jsp" />
<title>Blog Admin | Overview</title>
</head>
<body class="hold-transition sidebar-mini">
   <div class="wrapper">


      <jsp:include page="../fragments/nav-bar-admin.jsp" />
      <jsp:include page="../fragments/side-bar-admin.jsp" />

      <div class="content-wrapper">
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Dashboard Overview</h1>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">

               <div class="row">
                  <div class="col-lg-3 col-6">
                     <div class="small-box bg-info">
                        <div class="inner">
                           <h3>${postCount}</h3>
                           <p>Total Posts</p>
                        </div>
                        <div class="icon">
                           <i class="fas fa-file-alt"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/administration/posts" class="small-box-footer">
                           More info <i class="fas fa-arrow-circle-right"></i>
                        </a>
                     </div>
                  </div>

                  <div class="col-lg-3 col-6">
                     <div class="small-box bg-success">
                        <div class="inner">
                           <h3>${categoryCount}</h3>
                           <p>Categories</p>
                        </div>
                        <div class="icon">
                           <i class="fas fa-th-list"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/administration/categories" class="small-box-footer">
                           More info <i class="fas fa-arrow-circle-right"></i>
                        </a>
                     </div>
                  </div>

                  <div class="col-lg-3 col-6">
                     <div class="small-box bg-warning">
                        <div class="inner">
                           <h3>${tagCount}</h3>
                           <p>Total Tags</p>
                        </div>
                        <div class="icon">
                           <i class="fas fa-tags"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/administration/tags" class="small-box-footer">
                           More info <i class="fas fa-arrow-circle-right"></i>
                        </a>
                     </div>
                  </div>

                  <div class="col-lg-3 col-6">
                     <div class="small-box bg-danger">
                        <div class="inner">
                           <h3>${totalCommentCount}</h3>
                           <p>Comments</p>
                        </div>
                        <div class="icon">
                           <i class="far fa-comment nav-icon"></i>
                        </div>
                        <a href="${pageContext.request.contextPath}/administration/comments" class="small-box-footer">
                           More info <i class="fas fa-arrow-circle-right"></i>
                        </a>
                     </div>
                  </div>
               </div>

               <div class="row">
                  <div class="col-md-12">
                     <div class="card">
                        <div class="card-header border-transparent">
                           <h3 class="card-title">Recent Blog Posts</h3>
                        </div>
                        <div class="card-body p-0">
                           <div class="table-responsive">
                              <table class="table m-0">
                                 <thead>
                                    <tr>
                                       <th>Post ID</th>
                                       <th>Title</th>
                                       <th>Category</th>
                                       <th>Status</th>
                                       <th>Views</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach var="post" items="${recentPosts}">
                                       <tr>
                                          <td>
                                             <a href="${pageContext.request.contextPath}/administration/posts/edit/${post.id}">#${post.id}</a>
                                          </td>
                                          <td>${post.title}</td>
                                          <td>
                                             <span class="badge badge-info">${post.category.name}</span>
                                          </td>
                                          <td>
                                             <span class="badge badge-${post.enabled ? 'success' : 'secondary'}"> ${post.enabled ? 'Enable' : 'Disable'}
                                             </span>
                                          </td>
                                          <td>
                                             <i class="fas fa-eye"></i> ${post.viewCount}
                                          </td>
                                       </tr>
                                    </c:forEach>
                                    <c:if test="${empty recentPosts}">
                                       <tr>
                                          <td colspan="5" class="text-center">No recent posts found.</td>
                                       </tr>
                                    </c:if>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                        <div class="card-footer clearfix">
                           <a href="${pageContext.request.contextPath}/administration/posts/add" class="btn btn-sm btn-info float-left">Create New Post</a>
                           <a href="${pageContext.request.contextPath}/administration/posts" class="btn btn-sm btn-secondary float-right">View All Posts</a>
                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </section>
      </div>

      <jsp:include page="../fragments/footer-admin.jsp" />
   </div>
</body>
</html>