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
   <!-- Hero Section -->
   <section style="background: url(${pageContext.request.contextPath}/front-theme/img/hero.jpg); background-size: cover; background-position: center center"
      class="hero">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <h1>Have an interesting news or idea? Don't hesitate to contact us!</h1>
            </div>
         </div>
      </div>
   </section>
   <div class="container">
      <div class="row">
         <!-- Latest Posts -->
         <main class="col-lg-8">
            <div class="container">
               <c:if test="${not empty successMessage}">
                  <div class="alert alert-success alert-dismissible fade show" role="alert" style="margin-bottom: 30px;">
                     <strong>Success!</strong>
                     ${successMessage}
                     <button type="button" class="close" data-dismiss="alert" aria-label="Close"
                        style="background: none; border: none; float: right; font-size: 1.5rem; line-height: 1;">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
               </c:if>

               <form action="${pageContext.request.contextPath}/contact-submit" method="post" class="commenting-form">
                  <div class="row">
                     <div class="form-group col-md-6">
                        <input type="text" name="name" placeholder="Your Name" class="form-control" required>
                     </div>
                     <div class="form-group col-md-6">
                        <input type="email" name="email" placeholder="Email Address (will not be published)" class="form-control" required>
                     </div>
                     <div class="form-group col-md-12">
                        <textarea name="message" placeholder="Type your message" class="form-control" rows="20" required></textarea>
                     </div>
                     <div class="form-group col-md-12">
                        <button type="submit" class="btn btn-secondary">Submit Your Message</button>
                     </div>
                  </div>
               </form>
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