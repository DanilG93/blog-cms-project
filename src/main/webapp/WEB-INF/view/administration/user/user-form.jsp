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
                     <h1>${user.username == null ? 'Add New Blogger' : 'Edit Blogger'}</h1>
                  </div>

                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration/users">Bloggers</a>
                        </li>
                        <li class="breadcrumb-item active">${empty user.username ? 'Add Blogger' : 'Edit Blogger'}</li>
                     </ol>
                  </div>
               </div>

            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <form:form action="${pageContext.request.contextPath}/administration/users/save" modelAttribute="user" method="POST"
                  enctype="multipart/form-data">

                  <div class="row">
                     <div class="col-md-8">
                        <div class="card card-info">
                           <div class="card-header">
                              <h3 class="card-title">Personal Info</h3>
                           </div>
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-6">
                                    <div class="form-group">
                                       <label>Name</label>
                                       <form:input path="name" cssClass="form-control" placeholder="Enter name" required="required" />
                                       <form:errors path="name" cssClass="text-danger" />
                                    </div>
                                 </div>
                                 <div class="col-6">
                                    <div class="form-group">
                                       <label>Surname</label>
                                       <form:input path="surname" cssClass="form-control" placeholder="Enter surname" />
                                       <form:errors path="surname" cssClass="text-danger" />
                                    </div>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Email</label>
                                 <form:input path="email" type="email" cssClass="form-control" placeholder="email@example.com" required="required" />
                                 <form:errors path="email" cssClass="text-danger" />
                              </div>
                              <div class="form-group">
                                 <label>Phone</label>
                                 <form:input path="phone" type="tel" cssClass="form-control" placeholder="Phone number ex. (+381 60 123 456)" required="required" maxlength="20" />
                                 <form:errors path="phone" cssClass="text-danger" />
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <div class="card card-success">
                           <div class="card-header">
                              <h3 class="card-title">Login & Access</h3>
                           </div>
                           <div class="card-body">

                              <div class="form-group">
                                 <label>Username</label>
                                 <c:choose>
                                    <c:when test="${empty user.username}">
                                       <form:input path="username" cssClass="form-control" required="required" />
                                    </c:when>
                                    <c:otherwise>
                                       <form:input path="username" cssClass="form-control" readonly="true" />
                                    </c:otherwise>
                                 </c:choose>
                                 <form:errors path="username" cssClass="text-danger" />
                              </div>

                              <div class="form-group">
                                 <label>Password</label>

                                 <c:choose>

                                    <c:when test="${empty user.username}">
                                       <form:password path="password" cssClass="form-control" placeholder="Enter password" required="required" />
                                       <form:errors path="password" cssClass="text-danger" />
                                    </c:when>


                                    <c:otherwise>
                                       <input type="password" class="form-control" value="********" disabled="disabled" />
                                       <small class="text-muted">To change password, please use "Change Password" page.</small>
                                    </c:otherwise>
                                 </c:choose>
                              </div>

                              <div class="form-group">
                                 <label>Status</label>
                                 <div class="custom-control custom-switch">
                                    <form:checkbox path="enabled" cssClass="custom-control-input" id="statusSwitch" />
                                    <label class="custom-control-label" for="statusSwitch">User is Active (Unbanned)</label>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <label>Roles</label>
                                 <c:forEach var="role" items="${roleList}">
                                    <div class="form-check">
                                       <input class="form-check-input" type="checkbox" name="roles" value="${role.authority}"
                                          ${user.rolesList.contains(role.authority) ? 'checked' : ''}>
                                       <label class="form-check-label"> ${role.authority.replace('ROLE_', '')} </label>
                                    </div>
                                 </c:forEach>
                              </div>

                              <div class="form-group">

                                 <div class="mb-3">
                                    <c:choose>

                                       <c:when test="${not empty user.image}">
                                          <img src="${pageContext.request.contextPath}/uploads/users/${user.image}"
                                             class="profile-user-img img-fluid img-circle" alt="User Avatar"
                                             onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                                       </c:when>

                                       <c:otherwise>
                                          <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg"
                                             class="profile-user-img img-fluid img-circle" alt="Default Avatar">
                                       </c:otherwise>
                                    </c:choose>
                                 </div>

                                 <input type="file" name="file" class="form-control-file">

                              </div>

                           </div>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12">
                        <a href="${pageContext.request.contextPath}/administration/users" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-success float-right">Save User</button>
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