<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
                     <h1>My Profile</h1>
                  </div>

                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <sec:authorize access="hasRole('ADMIN')">
                           <li class="breadcrumb-item">
                              <a href="${pageContext.request.contextPath}/administration/users">Bloggers</a>
                           </li>
                        </sec:authorize>

                        <sec:authorize access="!hasRole('ADMIN')">
                           <li class="breadcrumb-item active">Bloggers</li>
                        </sec:authorize>
                        <li class="breadcrumb-item active">Edit Personal Info</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <form:form action="${pageContext.request.contextPath}/administration/my-profile/save" modelAttribute="user" method="POST"
                  enctype="multipart/form-data">

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

                              <h3 class="profile-username text-center">${user.name}&nbsp;${user.surname}</h3>
                              <p class="text-muted text-center">@${user.username}</p>

                              <ul class="list-group list-group-unbordered mb-3">
                                 <li class="list-group-item">
                                    <b>Username</b>
                                    <a class="float-right">${user.username}</a>

                                    <form:hidden path="username" />
                                 </li>
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
                                    <form:hidden path="enabled" />
                                 </li>
                              </ul>

                              <a href="${pageContext.request.contextPath}/administration/my-profile/change-password" class="btn btn-info btn-block">
                                 <b>Change Password</b>
                              </a>
                           </div>
                        </div>
                     </div>


                     <div class="col-md-8">
                        <div class="card">
                           <div class="card card-info">
                              <div class="card-header">
                                 <h3 class="card-title">Edit Personal Info</h3>
                              </div>

                           </div>
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-6">
                                    <div class="form-group">
                                       <label>Name</label>
                                       <form:input path="name" cssClass="form-control" />
                                       <form:errors path="name" cssClass="text-danger" />
                                    </div>
                                 </div>
                                 <div class="col-6">
                                    <div class="form-group">
                                       <label>Surname</label>
                                       <form:input path="surname" cssClass="form-control" />
                                       <form:errors path="surname" cssClass="text-danger" />
                                    </div>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <label>Email Address</label>
                                 <form:input path="email" type="email" cssClass="form-control" />
                                 <form:errors path="email" cssClass="text-danger" />
                              </div>

                              <div class="form-group">
                                 <label>Phone Number</label>
                                 <form:input path="phone" cssClass="form-control" />
                                 <form:errors path="phone" cssClass="text-danger" />
                              </div>

                              <div class="form-group">
                                 <label>Update Avatar</label>
                                 <div class="input-group">
                                    <div class="custom-file">
                                       <input type="file" name="file" class="custom-file-input" id="exampleInputFile">
                                       <label class="custom-file-label" for="exampleInputFile">Choose new image</label>
                                    </div>
                                 </div>
                              </div>

                              <div class="form-group mt-4">
                                 <button type="submit" class="btn btn-success float-right">Save Changes</button>
                                 <a href="${pageContext.request.contextPath}/administration/users" class="btn btn-secondary">Cancel</a>
                              </div>
                           </div>
                        </div>
                     </div>

                  </div>
               </form:form>
            </div>
         </section>
      </div>
      <jsp:include page="../../fragments/footer-admin.jsp" />
   </div>
</body>
</html>