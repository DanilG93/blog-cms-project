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
                     <h1>Slider Form</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                           <a href="${pageContext.request.contextPath}/administration/sliders/">Sliders</a>
                        </li>
                        <li class="breadcrumb-item active">${empty slider.id ? 'Add Slider' : 'Edit Slider'}</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-12">
                     <div class="card card-info">
                        <div class="card-header">
                           <h3 class="card-title">Slider Details</h3>
                        </div>
                        <form:form action="${pageContext.request.contextPath}/administration/sliders/save" modelAttribute="slider" method="post">

                           <form:hidden path="id" />
                           <form:hidden path="displayOrder" />

                           <div class="card-body">

                              <div class="form-group">
                                 <label for="title">Slider Title</label>
                                 <form:input path="title" type="text" class="form-control" id="title" placeholder="Enter slider title" />
                                 <form:errors path="title" cssClass="text-danger help-block" />
                              </div>

                              <div class="form-group">
                                 <label for="image">Image URL</label>
                                 <form:input path="image" type="text" class="form-control" id="image" placeholder="Enter image URL (http://...)" />
                                 <small class="form-text text-muted">Paste the full URL of the image.</small>
                                 <form:errors path="image" cssClass="text-danger help-block" />
                              </div>

                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="buttonText">Button Text</label>
                                       <form:input path="buttonText" type="text" class="form-control" id="buttonText" placeholder="e.g. Read More" />
                                       <form:errors path="buttonText" cssClass="text-danger help-block" />
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="buttonUrl">Button Link (Internal path or External URL)</label>
                                       <form:input path="buttonUrl" type="text" class="form-control" id="buttonUrl"
                                          placeholder="e.g. /blog or https://google.com" />
                                       <small class="form-text text-muted">
                                          "You can enter an internal path (e.g. <code>/contact</code> ) or a full external URL (e.g. <code>https://example.com</code>).
                                       </small>
                                       <form:errors path="buttonUrl" cssClass="text-danger help-block" />
                                    </div>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <div class="custom-control custom-switch">
                                    <form:checkbox path="enabled" class="custom-control-input" id="enabledSwitch" />
                                    <label class="custom-control-label" for="enabledSwitch">Enable this slider immediately</label>
                                 </div>
                              </div>

                           </div>
                           <div class="card-footer">
                              <button type="submit" class="btn btn-info">
                                 <i class="fas fa-save"></i> Save Slider
                              </button>

                              <a href="${pageContext.request.contextPath}/administration/sliders/" class="btn btn-default float-right"> Cancel </a>
                           </div>
                        </form:form>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </div>
      <jsp:include page="../../fragments/footer-admin.jsp" />
   </div>
</body>
</html>