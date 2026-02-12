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
                           <a href="${pageContext.request.contextPath}/administration">Home</a>
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
                        <form:form action="${pageContext.request.contextPath}/administration/sliders/save" modelAttribute="slider" method="post"
                           enctype="multipart/form-data">

                           <form:hidden path="id" />
                           <form:hidden path="displayOrder" />

                           <div class="card-body">

                              <div class="form-group">
                                 <label for="title">Slider Title</label>
                                 <form:input path="title" type="text" class="form-control" placeholder="Enter slider title" />
                                 <form:errors path="title" cssClass="text-danger help-block" />
                              </div>

                              <div class="form-group">
                                 <label for="sliderImage">Slider Image</label>

                                 <div class="input-group">
                                    <div class="custom-file">
                                       <input type="file" name="file" class="custom-file-input" id="sliderImage">
                                       <label class="custom-file-label" for="sliderImage">Choose file</label>
                                    </div>
                                 </div>
                                 <small class="text-muted">Recommended size: 1920x600px</small>

                                 <form:errors path="image" cssClass="text-danger help-block" style="display:block; margin-top:5px;" />

                                 <div class="mt-3">
                                    <label>Image Preview:</label><br>
                                    <c:choose>
                                       <c:when test="${not empty slider.image}">
                                          <img src="${pageContext.request.contextPath}/uploads/sliders/${slider.image}" class="img-fluid img-bordered"
                                             style="max-height: 250px;" id="preview"
                                             onerror="this.src='${pageContext.request.contextPath}/uploads/default/no_image_available.jpg';">
                                       </c:when>
                                       <c:otherwise>
                                          <img src="${pageContext.request.contextPath}/uploads/default/no_image_available.jpg" class="img-fluid img-bordered"
                                             style="max-height: 250px;" id="preview">
                                       </c:otherwise>
                                    </c:choose>
                                 </div>
                                 
                              </div>
                              <div class="row">
                                 <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="buttonText">Button Text</label>
                                       <form:input path="buttonText" type="text" class="form-control" placeholder="e.g. Read More" />
                                       <form:errors path="buttonText" cssClass="text-danger help-block" />
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="buttonUrl">Button Link</label>
                                       <form:input path="buttonUrl" type="text" class="form-control" placeholder="e.g. /contact" />
                                       <form:errors path="buttonUrl" cssClass="text-danger help-block" />
                                    </div>
                                 </div>
                              </div>

                              <div class="form-group">
                                 <div class="custom-control custom-switch">
                                    <form:checkbox path="enabled" class="custom-control-input" id="enabledSwitch" />
                                    <label class="custom-control-label" for="enabledSwitch">Enable this slider</label>
                                 </div>
                              </div>

                           </div>
                           <div class="card-footer">
                              <button type="submit" class="btn btn-info">Save</button>
                              <a href="${pageContext.request.contextPath}/administration/sliders" class="btn btn-default float-right">Cancel</a>
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