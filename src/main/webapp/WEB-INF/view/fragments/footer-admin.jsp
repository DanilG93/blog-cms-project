<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer class="main-footer">
   <div class="float-right d-none d-sm-inline">Java Spring Boot</div>
   <strong>Copyright &copy; 2026 <a href="https://cubes.edu.rs">Cubes School</a>.</strong> All rights reserved.
</footer>

<script src="${pageContext.request.contextPath}/admin-theme/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-theme/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-theme/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/admin-theme/dist/js/adminlte.min.js"></script>
<script src="https://kit.fontawesome.com/c36e69fd85.js" crossorigin="anonymous"></script>

<script>
   $(document).ready(function() {
      var currentUrl = window.location.href.split(/[?#]/)[0];
      $('.nav-sidebar a').each(function() {
         if (this.href === currentUrl) {
            $(this).addClass('active');
            $(this).parentsUntil(".nav-sidebar", ".nav-item").addClass('menu-open');
            $(this).parentsUntil(".nav-sidebar", ".nav-item").children(".nav-link").addClass('active');
         }
      });
   });
</script>