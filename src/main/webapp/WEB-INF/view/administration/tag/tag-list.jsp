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
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Tags Management</h1>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">

                  <div class="col-md-4">
                     <jsp:include page="tag-form.jsp" />
                  </div>

                  <div class="col-md-8">


                     <div class="card card-info">
                        <div class="card-header">
                           <h3 class="text-uppercase" class="card-title">Existing Tags</h3>
                        </div>
                        <div class="card-body p-0">
                           <table class="table table-bordered">
                              <thead>
                                 <tr class="text-uppercase">
                                    <th class="text-center" style="width: 10%">Tag No.</th>
                                    <th>Tag Name</th>
                                    <th class="text-black-50">Seo-Url</th>
                                    <th style="width: 20%" class="text-center tag-actions">Actions</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <c:forEach var="t" items="${tagList}" varStatus="loop">
                                    <tr>
                                       <td class="text-center">${loop.index + 1}</td>
                                       <td>
                                          <strong>${t.name}</strong>
                                       </td>
                                       <td>
                                          <span class="text-black-50">${t.seoUrl}</span>
                                       </td>
                                       <td class="text-center tag-actions">
                                          <div class="btn-group">
                                             <a href="${pageContext.request.contextPath}/administration/tags/edit/${t.id}" class="btn btn-sm btn-info">
                                                <i class="fas fa-edit"></i>
                                             </a>
                                             <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete-modal-${t.id}">
                                                <i class="fas fa-trash"></i>
                                             </button>
                                          </div>
                                       </td>
                                    </tr>

                                    <div class="modal fade" id="delete-modal-${t.id}">
                                       <div class="modal-dialog">
                                          <div class="modal-content">
                                             <div class="modal-header">
                                                <h4 class="modal-title">Delete Tag</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                                </button>
                                             </div>

                                             <form:form action="${pageContext.request.contextPath}/administration/tags/delete" method="post">
                                                <div class="modal-body text-left">
                                                   <p>Are you sure you want to delete tag ?</p>
                                                   <strong class="text-danger">${t.name}</strong>
                                                   <input type="hidden" name="id" value="${t.id}">
                                                </div>
                                                <div class="modal-footer justify-content-between">
                                                   <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                   <button type="submit" class="btn btn-danger">Delete</button>
                                                </div>
                                             </form:form>
                                          </div>
                                          <!-- /.modal-content -->
                                       </div>
                                       <!-- /.modal-dialog -->
                                    </div>

                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>

               </div>
            </div>
         </section>
      </div>



      <!-- Main Footer -->
      <jsp:include page="../../fragments/footer-admin.jsp" />

   </div>
</body>
</html>
