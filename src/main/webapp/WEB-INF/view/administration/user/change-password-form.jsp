<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../fragments/head-admin.jsp" />
</head>
<body class="hold-transition sidebar-mini">
   <div class="wrapper">
      <jsp:include page="../../fragments/nav-bar-admin.jsp" />
      <jsp:include page="../../fragments/side-bar-admin.jsp" />

      <div class="content-wrapper">
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Security Settings</h1>
                  </div>

                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration/users">Bloggers</a>
                        </li>
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration/my-profile">My Profile</a>
                        </li>
                        <li class="breadcrumb-item active">Edit Password</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">


                  <div class="col-md-4">
                     <div class="card card-info card-outline">
                        <div class="card-body box-profile">
                           <div class="text-center">
                              <c:choose>
                                 <c:when test="${not empty user.image}">
                                    <img src="${pageContext.request.contextPath}/uploads/users/${user.image}" class="profile-user-img img-fluid img-circle"
                                       alt="User profile picture"
                                       onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                                 </c:when>
                                 <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg"
                                       class="profile-user-img img-fluid img-circle" alt="Default Avatar">
                                 </c:otherwise>
                              </c:choose>
                           </div>

                           <h3 class="profile-username text-center">${user.name}${user.surname}</h3>
                           <p class="text-muted text-center">@${user.username}</p>

                           <ul class="list-group list-group-unbordered mb-3">
                              <li class="list-group-item">
                                 <b>Roles</b>
                                 <div class="float-right">
                                    <c:forEach var="role" items="${user.authorities}">
                                       <span class="badge badge-info">${role.authority.replace('ROLE_', '')}</span>
                                    </c:forEach>
                                 </div>
                              </li>
                              <li class="list-group-item">
                                 <b>Status</b>
                                 <span class="float-right badge badge-${user.enabled ? 'success' : 'danger'}"> ${user.enabled ? 'Active' : 'Banned'} </span>
                              </li>
                           </ul>

                           <a href="${pageContext.request.contextPath}/administration/my-profile" class="btn btn-secondary btn-block">
                              <b>Back to Profile</b>
                           </a>
                        </div>
                     </div>
                  </div>


                  <div class="col-md-8">
                     <div class="card card-warning">
                        <div class="card-header">
                           <h3 class="card-title">Change Password</h3>
                        </div>

                        <form:form action="${pageContext.request.contextPath}/administration/my-profile/change-password-save" modelAttribute="passwordDTO"
                           method="POST">

                           <div class="card-body">
                              <c:if test="${not empty error}">
                                 <div class="alert alert-danger alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <i class="icon fas fa-ban"></i> ${error}
                                 </div>
                              </c:if>

                              <div class="form-group">
                                 <label>Current Password</label>
                                 <form:password path="oldPassword" cssClass="form-control" placeholder="Enter current password" />
                                 <form:errors path="oldPassword" cssClass="text-danger" />
                              </div>

                              <hr>

                              <div class="form-group">
                                 <label>New Password</label>
                                 <form:password path="newPassword" cssClass="form-control" placeholder="Enter new password" />
                                 <form:errors path="newPassword" cssClass="text-danger" />
                              </div>

                              <div class="form-group">
                                 <label>Confirm New Password</label>
                                 <form:password path="confirmPassword" cssClass="form-control" placeholder="Confirm new password" />
                                 <form:errors path="confirmPassword" cssClass="text-danger" />
                              </div>
                           </div>

                           <div class="card-footer">
                              <a href="${pageContext.request.contextPath}/administration/my-profile" class="btn btn-default">Cancel</a>

                              <button type="submit" class="btn btn-warning float-right">Update Password</button>
                           </div>
                        </form:form>
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