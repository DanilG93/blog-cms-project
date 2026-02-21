<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                     <h1>Sliders</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Sliders</li>
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
                  <div class="col-md-12">
                     <div class="card">
                        <div class="card-header">

                           <div class="alert alert-info alert-dismissible">
                              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                              <h5>
                                 <i class="icon fas fa-info"></i> Notification!
                              </h5>
                              Use the 'Change Order' button to set the sequence of slider displayed in the home page.
                           </div>

                           <h3 class="card-title">All sliders</h3>

                           <div class="card-tools">

                              <c:if test="${empty isSorting}">
                                 <a href="${pageContext.request.contextPath}/administration/sliders/?mode=sort" class="btn btn-outline-secondary btn-sm">
                                    <i class="fas fa-sort"></i> Change Order
                                 </a>
                              </c:if>

                              <c:if test="${not empty isSorting}">
                                 <a href="${pageContext.request.contextPath}/administration/sliders/" class="btn btn-success btn-sm">
                                    <i class="fas fa-check"></i> Done
                                 </a>
                              </c:if>

                              <a href="${pageContext.request.contextPath}/administration/sliders/add" class="btn btn-success btn-sm">
                                 <i class="fas fa-plus-square"></i> Add new Slider
                              </a>
                           </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">

                           <table class="table table-bordered">

                              <c:if test="${not empty message}">
                                 <div class="alert alert-success">${message}</div>
                              </c:if>

                              <c:if test="${not empty errorMessage}">
                                 <div class="alert alert-danger">${errorMessage}</div>
                              </c:if>

                              <thead>
                                 <tr class="text-center">
                                    <th style="width: 5%">Order</th>
                                    <th style="width: 15%;">Title</th>
                                    <th>Background Image</th>
                                    <th style="width: 10%">Button Text</th>
                                    <th>Button Link</th>
                                    <th style="width: 5%">Enabled</th>
                                    <th style="width: 10%;" class="text-center">Actions</th>
                                 </tr>
                              </thead>


                              <tbody id="sort-list">

                                 <c:forEach var="slider" items="${sliderList}" varStatus="status">


                                    <tr class="text-center ">
                                       <td class="align-middle">
                                          <c:choose>

                                             <c:when test="${empty isSorting}">
                                                <strong class="align-middle ">${slider.displayOrder}</strong>
                                             </c:when>


                                             <c:otherwise>
                                                <div class="btn-group" role="group">

                                                   <c:choose>
                                                      <c:when test="${!status.first}">
                                                         <a
                                                            href="${pageContext.request.contextPath}/administration/sliders/change-order?id=${slider.id}&direction=up"
                                                            class="btn btn-sm btn-outline-info">
                                                            <i class="fas fa-arrow-up"></i>
                                                         </a>
                                                      </c:when>
                                                      <c:otherwise>

                                                         <button type="button" class="btn btn-sm btn-outline-light text-muted" disabled>
                                                            <i class="fas fa-arrow-up"></i>
                                                         </button>
                                                      </c:otherwise>
                                                   </c:choose>

                                                   <button type="button" class="btn btn-sm btn-secondary" style="opacity: 1; cursor: default; min-width: 35px;"
                                                      disabled>
                                                      <strong>${slider.displayOrder}</strong>
                                                   </button>

                                                   <c:choose>
                                                      <c:when test="${!status.last}">
                                                         <a
                                                            href="${pageContext.request.contextPath}/administration/sliders/change-order?id=${slider.id}&direction=down"
                                                            class="btn btn-sm btn-outline-info">
                                                            <i class="fas fa-arrow-down"></i>
                                                         </a>
                                                      </c:when>
                                                      <c:otherwise>
                                                         <button type="button" class="btn btn-sm btn-outline-light text-muted" disabled>
                                                            <i class="fas fa-arrow-down"></i>
                                                         </button>
                                                      </c:otherwise>
                                                   </c:choose>

                                                </div>
                                             </c:otherwise>
                                          </c:choose>
                                       </td>

                                       <td class="align-middle ">
                                          <strong>${slider.title}</strong>
                                       </td>
                                       <td class="align-middle text-center">
                                          <c:choose>
                                             <c:when test="${not empty slider.image}">
                                                <img src="${pageContext.request.contextPath}/uploads/sliders/${slider.image}"
                                                   class="img-lg img-bordered-sm img-rounded float-none d-inline-block"
                                                   onerror="this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                                             </c:when>
                                             <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg"
                                                   class="img-lg img-bordered-sm img-rounded float-none d-inline-block">
                                             </c:otherwise>
                                          </c:choose>
                                       </td>


                                       <td class="align-middle">
                                          <button type="button" class="btn btn-block btn-outline-secondary disabled">${slider.buttonText}</button>
                                       </td>
                                       
                                       <td class="align-middle">
                                          <c:set var="rawLink" value="${slider.buttonUrl}" />
                                          <c:choose>
                                             <c:when test="${fn:startsWith(rawLink, 'http://') or fn:startsWith(rawLink, 'https://')}">
                                                <a href="${rawLink}" target="_blank">${rawLink}</a>
                                             </c:when>
                                             <c:otherwise>
                                                <a href="${pageContext.request.contextPath}${fn:startsWith(rawLink, '/') ? '' : '/'}${rawLink}" target="_blank">
                                                   ${rawLink} </a>
                                             </c:otherwise>
                                          </c:choose>
                                       </td>

                                       <td class="align-middle">
                                          <div class="custom-control custom-switch">
                                             <input type="checkbox" class="custom-control-input" id="switch${slider.id}" ${slider.enabled ? 'checked' : ''}
                                                onclick="window.location.href='sliders/slider-enable?id=${slider.id}'">

                                             <label class="custom-control-label" for="switch${slider.id}"></label>
                                          </div>
                                       </td>


                                       <td class="align-middle">
                                          <div class="btn-group">
                                             <a href="${pageContext.request.contextPath}/administration/sliders/edit/${slider.id}" class="btn btn-info">
                                                <i class="fas fa-edit"></i>
                                             </a>
                                             <button type="button" class="btn btn-info" data-toggle="modal" data-target="#delete-modal-${slider.id}">
                                                <i class="fas fa-trash"></i>
                                             </button>
                                          </div>
                                       </td>
                                    </tr>

                                    <div class="modal fade" id="delete-modal-${slider.id}">
                                       <div class="modal-dialog">
                                          <div class="modal-content">
                                             <div class="modal-header">
                                                <h4 class="modal-title">Delete Slider</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                   <span aria-hidden="true">&times;</span>
                                                </button>
                                             </div>

                                             <form:form action="${pageContext.request.contextPath}/administration/sliders/delete" method="post">
                                                <div class="modal-body text-left">
                                                   <p>Are you sure you want to delete slider ?</p>
                                                   <input type="hidden" name="id" value="${slider.id}">
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



                                 <!-- /.card -->


                              </tbody>

                           </table>


                        </div>
                        <!-- /.col -->
                     </div>
                  </div>
                  <!-- /.row -->
               </div>
               <!-- /.container-fluid -->
            </div>
         </section>
         <!-- /.content -->


         <!-- /.modal -->
      </div>
      <!-- /.content-wrapper -->



      <!-- Main Footer -->
      <jsp:include page="../../fragments/footer-admin.jsp" />


   </div>
</body>
</html>
