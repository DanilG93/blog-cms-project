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
                     <h1>Blogger Management</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Bloggers</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="card card-solid">
               <div class="card-body pb-0">
                  <div class="row d-flex align-items-stretch">

                     <div class="col-12 mb-3 text-right">
                        <a href="${pageContext.request.contextPath}/administration/users/add" class="btn btn-success">
                           <i class="fas fa-plus"></i> Add New Blogger
                        </a>
                     </div>

                     <c:forEach var="user" items="${userList}">

                        <div class="col-12 d-flex align-items-stretch">
                           <div class="card bg-light d-flex flex-fill">
                              <div class="card-header text-muted border-bottom-0">


                                 <c:forEach var="role" items="${user.authorities}">
                                    <span class="badge badge-info">${role.authority.replace('ROLE_', '')}</span>
                                 </c:forEach>

                                 <span class="float-right badge badge-${user.enabled ? 'success' : 'danger'}"> ${user.enabled ? 'Active' : 'Banned'} </span>
                              </div>

                              <div class="card-body pt-0">
                                 <div class="row">

                                    <div class="col-2 text-center align-self-center">
                                       <c:choose>
                                          <c:when test="${not empty user.image}">
                                             <img src="${pageContext.request.contextPath}/uploads/users/${user.image}" alt="User Image"
                                                class="profile-user-img img-fluid img-circle"
                                                onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                                          </c:when>
                                          <c:otherwise>
                                             <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg" alt="User Image"
                                                class="profile-user-img img-fluid img-circle">
                                          </c:otherwise>
                                       </c:choose>
                                    </div>

                                    <div class="col-10">
                                       <h2 class="lead">
                                          <b>${user.name} ${user.surname}</b>
                                       </h2>
                                       <p class="text-muted text-sm">
                                          <b>Username: </b> ${user.username}
                                       </p>

                                       <ul class="ml-4 mb-0 fa-ul text-muted">
                                          <li class="small">
                                             <span class="fa-li">
                                                <i class="fas fa-lg fa-envelope"></i>
                                             </span>
                                             Email: ${user.email}
                                          </li>
                                          <li class="small mt-1">
                                             <span class="fa-li">
                                                <i class="fas fa-lg fa-phone"></i>
                                             </span>
                                             Phone: ${user.phone}
                                          </li>
                                       </ul>
                                    </div>

                                 </div>
                              </div>

                              <div class="card-footer">
                                 <div class="text-right">

                                    <c:choose>
                                       <c:when test="${user.username eq pageContext.request.userPrincipal.name}">

                                          <span class="badge badge-info p-2 mr-2">
                                             <i class="fas fa-user-check"></i> It's You
                                          </span>

                                          <a href="${pageContext.request.contextPath}/administration/my-profile" class="btn btn-sm btn-outline-primary">
                                             <i class="fas fa-cog"></i> Manage My Profile
                                          </a>

                                       </c:when>

                                       <c:otherwise>

                                          <form action="${pageContext.request.contextPath}/administration/users/toggle-status" method="post"
                                             style="display: inline;">
                                             <input type="hidden" name="username" value="${user.username}" />
                                             <button type="submit" class="btn btn-sm btn-${user.enabled ? 'danger' : 'success'}">
                                                <i class="fas fa-${user.enabled ? 'ban' : 'check'}"></i> ${user.enabled ? 'Ban User' : 'Activate User'}
                                             </button>
                                          </form>

                                          <a href="${pageContext.request.contextPath}/administration/users/edit/${user.username}"
                                             class="btn btn-sm btn-primary ml-1">
                                             <i class="fas fa-user-edit"></i> Edit Profile
                                          </a>

                                       </c:otherwise>

                                    </c:choose>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>

               <div class="card-footer">
                  <nav aria-label="Contacts Page Navigation">
                     <ul class="pagination justify-content-center m-0">

                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                           <a class="page-link" href="?page=${currentPage - 1}">Previous</a>
                        </li>


                        <c:forEach begin="1" end="${totalPages}" var="i">
                           <li class="page-item ${currentPage == i ? 'active' : ''}">
                              <a class="page-link" href="?page=${i}">${i}</a>
                           </li>
                        </c:forEach>


                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                           <a class="page-link" href="?page=${currentPage + 1}">Next</a>
                        </li>
                     </ul>
                  </nav>
               </div>

            </div>
         </section>
      </div>

      <jsp:include page="../../fragments/footer-admin.jsp" />

   </div>
</body>
</html>