<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../fragments/head-front.jsp" />
</head>
<body>
   <header class="header">
      <jsp:include page="../fragments/header-nav-bar-front.jsp" />
   </header>
   <div class="container">
      <div class="row">
         <!-- Latest Posts -->
         <main class="posts-listing col-lg-8">
            <div class="container">
               <h2 class="mb-3">Category "${not empty category ? category.name : categoryForSearch}"</h2>
               
               <c:if test="${empty category}">
                  <div class="alert alert-warning p-4">
                     <h4>No results found</h4>
                     <p>
                        We couldn't find any posts matching "
                        <strong>${categoryForSearch}</strong>
                        ". Please try a different keyword.
                     </p>
                  </div>
               </c:if>

               <jsp:include page="../fragments/main-posts-list-to-search-and-pagination.jsp" />
            </div>
         </main>
         <aside class="col-lg-4">
            <jsp:include page="../fragments/aside-sajdbar-front.jsp" />
         </aside>
      </div>
   </div>
   <!-- Page Footer-->
   <jsp:include page="../fragments/footer-front.jsp" />
</body>
</html>