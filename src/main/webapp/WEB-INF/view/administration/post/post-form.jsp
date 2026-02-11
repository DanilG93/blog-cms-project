<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
                     <h1>Add Post</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration/posts">Posts</a>
                        </li>
                        <li class="breadcrumb-item active">${empty post.id ? 'Add Post' : 'Edit Post'}</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-12">

                     <form:form action="${pageContext.request.contextPath}/administration/posts/save" modelAttribute="post" method="post"
                        enctype="multipart/form-data">

                        <form:hidden path="id" />

                        <div class="card card-primary">
                           <div class="card-header">
                              <h3 class="card-title">Post Content</h3>
                           </div>

                           <div class="card-body">
                              <div class="row">

                                 <div class="col-md-8">
                                    <div class="form-group">
                                       <label>Title</label>
                                       <form:input path="title" class="form-control" placeholder="Enter title" />
                                       <form:errors path="title" class="text-danger help-block"/>
                                    </div>

                                    <div class="form-group">
                                       <label>Description</label>
                                       <form:textarea path="description" class="form-control" rows="3" placeholder="Enter short description" />
                                       <form:errors path="description" class="text-danger help-block"/>
                                    </div>

                                    <div class="form-group">
                                       <label>Body Content</label>
                                       <form:textarea path="content" id="summernote" class="form-control" rows="12" />
                                       <form:errors path="content" class="text-danger help-block"/>
                                    </div>
                                 </div>

                                 <div class="col-md-4">

                                    <div class="form-group">
                                       <label>Category</label>
                                       <form:select path="category.id" class="form-control">
                                          <form:option value="" label="-- Uncategorized --" />
                                          <form:options items="${categoryList}" itemValue="id" itemLabel="name" />
                                       </form:select>
                                    </div>

                                    <div class="form-group">
                                       <label>Tags</label>
                                       <form:select path="tags" class="form-control select2" multiple="true" style="width: 100%;">
                                          <form:options items="${tagList}" itemValue="id" itemLabel="name" />
                                       </form:select>
                                       
                                       <form:errors path="tags" class="text-danger help-block"/>
                                    </div>

                                    <div class="form-group">

                                       <label>Featured Image</label>

                                       <div class="input-group">
                                          <div class="custom-file">
                                             <input type="file" name="file" class="custom-file-input" id="postImage">
                                             <label class="custom-file-label" for="postImage">Choose file</label>
                                          </div>
                                       </div>

                                       <c:if test="${not empty post.image}">
                                          <div class="mt-3 text-center">
                                             <img src="${pageContext.request.contextPath}/uploads/posts/${post.image}"
                                                class="img-fluid img-thumbnail" style="width: 300px;">
                                             <p class="text-muted small mt-1">Current Image</p>
                                          </div>
                                       </c:if>
                                    </div>




                                    <hr>

                                    <div class="form-group">
                                       <div class="custom-control custom-switch">
                                          <form:checkbox path="important" class="custom-control-input" id="importantSwitch" />
                                          <label class="custom-control-label" for="importantSwitch">Important Post</label>
                                       </div>
                                    </div>

                                    <div class="form-group">
                                       <div class="custom-control custom-switch">
                                          <form:checkbox path="enabled" class="custom-control-input" id="enabledSwitch" />
                                          <label class="custom-control-label" for="enabledSwitch">Enabled</label>
                                       </div>
                                    </div>

                                 </div>
                              </div>
                           </div>

                           <div class="card-footer text-right">
                              <a href="${pageContext.request.contextPath}/administration/posts" class="btn btn-secondary">Cancel</a>
                              <button type="submit" class="btn btn-primary">Save Post</button>
                           </div>
                        </div>
                     </form:form>

                  </div>
               </div>
            </div>
         </section>
      </div>

      <jsp:include page="../../fragments/footer-admin.jsp" />

   </div>
</body>
</html>