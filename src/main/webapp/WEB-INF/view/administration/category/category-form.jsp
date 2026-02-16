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
      <!-- /.sidebar -->

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Add Category</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration/categories">Categories</a>
                        </li>
                        <li class="breadcrumb-item active">${empty category.id ? 'Add Category' : 'Edit Category'}</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>

         <!-- Main content -->
         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-6">
                     <div class="card card-info">
                        <div class="card-header">
                           <h3 class="card-title">Categories Form</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form:form action="${pageContext.request.contextPath}/administration/categories/save" modelAttribute="category" method="POST">
                          <form:hidden path="id" />
                          <form:hidden path="displayOrder" />
                           <div class="card-body">
                              <div class="form-group">
                                 <label>Category Name</label> 
                                 <form:input path="name" cssClass="form-control" placeholder="Enter name"/>
                                 <form:errors path="name" class="text-danger help-block" />
                              </div>
                              <div class="form-group">
                                 <label>Desription</label>
                                 <form:textarea path="description" cssClass="form-control" rows="3" />
                                 <form:errors path="description" class="text-danger help-block" />
                              </div>
                           </div>
                           <!-- /.card-body -->

                           <div class="card-footer">
                              <button type="submit" class="btn btn-info">Save Category</button>
                              <a href="${pageContext.request.contextPath}/administration/categories/" class="btn btn-default">Cancel</a>
                           </div>
                           
                           
                            
                           
                        </form:form>
                     </div>
                     <!-- /.card -->
                  </div>
                  <!-- /.col -->
               </div>
               <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->



      <!-- Main Footer -->
      <jsp:include page="../../fragments/footer-admin.jsp" />

   </div>
</body>
</html>
