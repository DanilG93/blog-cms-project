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
   <section style="background: url(img/hero.jpg); background-size: cover; background-position: center center" class="hero">
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
               <form action="#" class="commenting-form">
                  <div class="row">
                     <div class="form-group col-md-6">
                        <input type="text" placeholder="Your Name" class="form-control">
                     </div>
                     <div class="form-group col-md-6">
                        <input type="email" placeholder="Email Address (will not be published)" class="form-control">
                     </div>
                     <div class="form-group col-md-12">
                        <textarea placeholder="Type your message" class="form-control" rows="20"></textarea>
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