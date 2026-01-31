<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<aside class="main-sidebar sidebar-dark-primary elevation-4 sidebar-no-expand">
   <!-- Brand Logo -->
   <a href="index3.html" class="brand-link">
      <img src="${pageContext.request.contextPath}/admin-theme/dist/img/AdminLTELogo.png" alt="Cubes School Logo" class="brand-image img-circle elevation-3">
      <span class="brand-text font-weight-light">Cubes School</span>
   </a>

   <!-- Sidebar -->
   <div class="sidebar">
      <!-- Sidebar Menu -->
      <nav class="mt-2 text-sm">
         <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <li class="nav-header text-bold pt-0 pb-1">DASHBOARD</li>
            <li class="nav-item">
               <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>Overview</p>
               </a>
            </li>

            <li class="nav-header text-bold pt-2 pb-1">MEDIA &amp; SLIDERS</li>
            <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-images"></i>
                  <p>
                     Slider Management <i class="right fas fa-angle-left"></i>
                  </p>
               </a>

               <ul class="nav nav-treeview">
                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/sliders" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>All Slides</p>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/sliders/add" class="nav-link">
                        <i class="fas fa-plus nav-icon text-success"></i>
                        <p>Add New Slide</p>
                     </a>
                  </li>
               </ul>
            </li>

            <li class="nav-header text-bold pt-2 pb-1">CONTENT MANAGEMENT</li>
            <li class="nav-item has-treeview menu-open">
               <a href="#" class="nav-link active">
                  <i class="nav-icon fas fa-edit"></i>
                  <p>
                     Blog Content <i class="right fas fa-angle-left"></i>
                  </p>
               </a>
               <ul class="nav nav-treeview">
                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/posts" class="nav-link">
                        <i class="far fa-file-alt nav-icon"></i>
                        <p>All Posts</p>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/posts/add" class="nav-link">
                        <i class="fas fa-plus-circle nav-icon text-primary"></i>
                        <p>Add New Post</p>
                     </a>
                  </li>

                  <li class="nav-header pt-1 pb-0 text-muted" style="font-size: 0.7rem; padding-left: 1rem;">ORGANIZATION</li>

                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/categories" class="nav-link">
                        <i class="far fa-list-alt nav-icon text-warning"></i>
                        <p>Categories List</p>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/categories/add" class="nav-link">
                        <i class="fas fa-plus-square nav-icon text-warning"></i>
                        <p>Add Category</p>
                     </a>
                  </li>

                  <li class="nav-item">
                     <a href="${pageContext.request.contextPath}/administration/tags" class="nav-link">
                        <i class="fas fa-tags nav-icon"></i>
                        <p>Tags List</p>
                     </a>
                  </li>
               </ul>
            </li>

            <li class="nav-header text-bold pt-2 pb-1">COMMUNICATION</li>
            <li class="nav-item has-treeview">
               <a href="#" class="d-flex align-items-center nav-link">
                  <i class="nav-icon fas fa-comments text-info"></i> Interaction
                  <c:if test="${hasUnread}">
                     <span class="right badge bg-warning">New</span>
                  </c:if>
                  <i class="right fas fa-angle-left"></i>




               </a>
               <ul class="nav nav-treeview">

                  <li class="nav-item">

                     <a class="d-flex align-items-center nav-link" href="${pageContext.request.contextPath}/administration/comments">
                        <i class="far fa-comment nav-icon"> </i> Comments
                        <c:if test="${commentCount > 0}">
                           <span class="badge badge-info right">${commentCount}</span>
                        </c:if>

                     </a>
                  </li>

                  <li class="nav-item">

                     <a class="d-flex align-items-center nav-link" href="${pageContext.request.contextPath}/administration/messages">
                        <i class="far fa-envelope nav-icon"></i> Messages
                        <c:if test="${messageCount > 0}">
                           <span class="badge badge-info right">${messageCount}</span>
                        </c:if>

                     </a>
                  </li>
               </ul>
            </li>

            <li class="nav-header text-bold pt-2 pb-1">ADMINISTRATION</li>
            <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-users"></i>
                  <p>
                     User Management <i class="right fas fa-angle-left"></i>
                  </p>
               </a>
               <ul class="nav nav-treeview">
                  <li class="nav-item">
                     <a href="#" class="nav-link">
                        <i class="fas fa-user-friends nav-icon"></i>
                        <p>Bloggers List</p>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a href="#" class="nav-link">
                        <i class="fas fa-user-plus nav-icon text-success"></i>
                        <p>Add New Blogger</p>
                     </a>
                  </li>
               </ul>
            </li>

            <li class="nav-header text-bold pt-2 pb-1">MY ACCOUNT</li>
            <li class="nav-item has-treeview">
               <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-user-cog"></i>
                  <p>
                     My Profile <i class="right fas fa-angle-left"></i>
                  </p>
               </a>
               <ul class="nav nav-treeview">
                  <li class="nav-item">
                     <a href="#" class="nav-link">
                        <i class="fas fa-id-card nav-icon"></i>
                        <p>Edit Personal Info</p>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a href="#" class="nav-link">
                        <i class="fas fa-key nav-icon text-danger"></i>
                        <p>Change Password</p>
                     </a>
                  </li>
               </ul>
            </li>

            <li class="nav-item">
               <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-sign-out-alt text-danger"></i>
                  <p>Logout</p>
               </a>
            </li>

         </ul>
      </nav>
      <!-- /.sidebar-menu -->
   </div>


   <!-- /.sidebar -->
</aside>