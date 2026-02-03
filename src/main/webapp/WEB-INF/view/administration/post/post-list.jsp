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
                     <h1>Blog Posts</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Posts</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-12">

                     <div class="card border-primary mb-3">
                        <div class="card-header bg-info text-white">
                           <h3 class="card-title mb-0">
                              <i class="fas fa-filter"></i> Filter Posts
                           </h3>

                           <div class="card-tools">
                              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                 <i class="fas fa-minus"></i>
                              </button>
                           </div>
                        </div>

                        <div class="card-body bg-light">
                           <form:form action="${pageContext.request.contextPath}/administration/posts" modelAttribute="postSearch" method="get">

                              <div class="row">

                                 <div class="col-md-3">
                                    <div class="form-group">
                                       <label>Title</label>
                                       <form:input path="title" class="form-control" placeholder="Search by title" />
                                    </div>
                                 </div>

                                 <div class="col-md-3">
                                    <div class="form-group">
                                       <label>Category</label>
                                       <form:select path="categoryId" class="form-control">
                                          <form:option value="" label="-- All Categories --" />
                                          <form:options items="${categoryList}" itemValue="id" itemLabel="name" />
                                       </form:select>
                                    </div>
                                 </div>

                                 <div class="col-md-3">
                                    <div class="form-group">
                                       <label>Author</label>
                                       <form:select path="authorId" class="form-control">
                                          <form:option value="" label="-- All Authors --" />
                                          <c:forEach items="${authorList}" var="author">
                                             <form:option value="${author.username}">${author.name} ${author.surname}</form:option>
                                          </c:forEach>
                                       </form:select>
                                    </div>
                                 </div>

                                 <div class="col-md-3">
                                    <div class="form-group">
                                       <label>Status</label>
                                       <form:select path="enabled" class="form-control">
                                          <form:option value="" label="-- All Statuses --" />
                                          <form:option value="true" label="Enabled" />
                                          <form:option value="false" label="Disabled" />
                                       </form:select>
                                    </div>
                                 </div>

                              </div>

                              <div class="row">
                                 <div class="col-md-12 text-right">

                                    <a href="${pageContext.request.contextPath}/administration/posts" class="btn btn-secondary">
                                       <i class="fas fa-sync-alt"></i> Reset
                                    </a>

                                    <button type="submit" class="btn btn-info">
                                       <i class="fas fa-search"></i> Search
                                    </button>
                                 </div>
                              </div>

                           </form:form>
                        </div>
                     </div>
                     <div class="card">

                        <div class="card-header">
                           <h3 class="card-title mt-1">All Blog Posts</h3>

                           <div class="card-tools">
                              <a href="${pageContext.request.contextPath}/administration/posts/add" class="btn btn-success btn-sm">
                                 <i class="fas fa-plus-square"></i> Add New Post
                              </a>
                           </div>
                        </div>

                        <div class="card-body table-responsive p-0">

                           <c:if test="${not empty message}">
                              <div class="alert alert-success m-3 alert-dismissible">
                                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                 ${message}
                              </div>
                           </c:if>

                           <table class="table table-hover table-bordered text-nowrap">
                              <thead>
                                 <tr class="text-center">
                                    <th>Thumb</th>
                                    <th>Status</th>
                                    <th>Imp.</th>
                                    <th>Category</th>
                                    <th>Title</th>
                                    <th><i class="fas fa-comments" title="Comments"></i></th>
                                    <th><i class="fas fa-eye" title="Views"></i></th>
                                    <th>Author</th>
                                    <th>Created At</th>
                                    <th>Actions</th>
                                 </tr>
                              </thead>

                              <tbody>
                                 <c:forEach var="post" items="${postList}">
                                    <tr>
                                       <td class="text-center align-middle">
                                          <c:if test="${not empty post.image}">
                                             <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}" class="img-size-50">
                                          </c:if>
                                          <c:if test="${empty post.image}">
                                             <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg" class="img-size-50">
                                          </c:if>
                                       </td>


                                       <td class="text-center align-middle">
                                          <a href="${pageContext.request.contextPath}/uploads/posts/${post.image}" style="text-decoration: none;">

                                             <c:choose>
                                                <c:when test="${post.enabled}">
                                                   <span class="badge badge-success">Enabled</span>
                                                </c:when>
                                                <c:otherwise>
                                                   <span class="badge badge-danger">Disabled</span>
                                                </c:otherwise>
                                             </c:choose>

                                          </a>
                                       </td>

                                       <td class="text-center align-middle">
                                          <div class="btn-group">
                                             <a href="${pageContext.request.contextPath}/administration/posts/toggle-important/${post.id}"
                                                class="btn btn-default btn-sm" title="Toggle Important">
                                                <i class="${post.important ? 'fas fa-star text-warning' : 'far fa-star'}"></i>
                                             </a>
                                          </div>
                                       </td>

                                       <td class="align-middle">
                                          <c:out value="${post.category.name}" default="Uncategorized" />
                                       </td>

                                       <td class="align-middle" title="${post.title}">
                                          <c:choose>
                                             <c:when test="${fn:length(post.title) > 30}">
                                                ${fn:substring(post.title, 0, 30)}...
                                             </c:when>
                                             <c:otherwise>
                                                ${post.title}
                                             </c:otherwise>
                                          </c:choose>
                                       </td>

                                       <td class="text-center align-middle">
                                          <span class="badge badge-info">${fn:length(post.comments)}</span>
                                       </td>

                                       <td class="text-center align-middle">${post.viewCount}</td>

                                       <td class="align-middle">${post.user.name}</td>

                                       <td class="align-middle">
                                          <small>
                                             <fmt:formatDate value="${post.createdAtAsDate}" pattern="dd.MM.yyyy HH:mm" />
                                          </small>
                                       </td>

                                       <td class="text-center align-middle">
                                          <div class="btn-group">
                                             <a href="${pageContext.request.contextPath}/administration/posts/edit/${post.id}" class="btn btn-info btn-sm"
                                                title="Edit">
                                                <i class="fas fa-edit"></i>
                                             </a>

                                             <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-modal-${post.id}"
                                                title="Delete">
                                                <i class="fas fa-trash"></i>
                                             </button>
                                          </div>
                                       </td>
                                    </tr>

                                    <div class="modal fade" id="delete-modal-${post.id}">
                                       <div class="modal-dialog">
                                          <div class="modal-content">
                                             <div class="modal-header">
                                                <h4 class="modal-title">Delete Post</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                                </button>
                                             </div>

                                             <form action="${pageContext.request.contextPath}/administration/posts/delete" method="post">
                                                <div class="modal-body">
                                                   <p>Are you sure you want to delete this post?</p>
                                                   <p class="text-danger font-weight-bold">"${post.title}"</p>
                                                   <small class="text-muted">This will delete all comments associated with this post.</small>

                                                   <input type="hidden" name="id" value="${post.id}">
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                   <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                   <button type="submit" class="btn btn-danger">Delete Post</button>
                                                </div>
                                             </form>
                                          </div>
                                       </div>
                                    </div>
                                 </c:forEach>
                              </tbody>
                           </table>
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