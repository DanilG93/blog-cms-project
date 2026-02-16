<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
   <ul class="navbar-nav">
      <li class="nav-item">
         <a class="nav-link" data-widget="pushmenu" href="#" role="button">
            <i class="fas fa-bars"></i>
         </a>
      </li>
   </ul>

   <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
         <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-user"></i>
         </a>
         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <div class="dropdown-item">
               <div class="media align-items-center">




                  <c:choose>
                     <c:when test="${not empty currentUser.image}">
                        <img src="${pageContext.request.contextPath}/uploads/users/${currentUser.image}" alt="User Avatar" class="img-size-50 mr-3 img-circle"
                           onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                     </c:when>
                     <c:otherwise>
                        <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg" alt="Default Avatar"
                           class="img-size-50 mr-3 img-circle">
                     </c:otherwise>
                  </c:choose>



                  <div class="media-body">
                     <h3 class="dropdown-item-title">${currentUser.name}&nbsp;${currentUser.surname}</h3>
                     <p class="text-sm text-muted">${currentUser.username}</p>
                  </div>
               </div>
            </div>
            <div class="dropdown-divider"></div>
            <a href="${pageContext.request.contextPath}/administration/my-profile" class="dropdown-item">
               <i class="fas fa-user mr-2"></i> Profile
            </a>
            <div class="dropdown-divider"></div>
            <a href="${pageContext.request.contextPath}/logout" class="dropdown-item text-danger">
               <i class="fas fa-sign-out-alt mr-2"></i> Log Out
            </a>
         </div>
      </li>
   </ul>
</nav>