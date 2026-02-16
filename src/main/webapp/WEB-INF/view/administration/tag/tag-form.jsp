<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card card-primary" id="tag-card">
   <div class="card-header">
      <h3 class="card-title">
         <c:choose>
            <c:when test="${tag.id > 0}">Edit Tag: ${tag.name}</c:when>
            <c:otherwise>Add New Tag</c:otherwise>
         </c:choose>
      </h3>
   </div>

   <form:form action="${pageContext.request.contextPath}/administration/tags/save" modelAttribute="tag" method="POST">
      <form:hidden path="id" />

      <div class="card-body">
         <div class="form-group">
            <label for="tagName">Tag Name</label>
            <form:input path="name" id="tagName" cssClass="form-control" placeholder="Enter tag name" />
            <form:errors path="name" class="text-danger help-block" />
         </div>
      </div>

      <div class="card-footer">
         <button type="submit" class="btn btn-primary">
            <i class="fas fa-save"></i> Save Tag
         </button>

         <a href="${pageContext.request.contextPath}/administration/tags/" class="btn btn-default float-right">Cancel</a>

      </div>
   </form:form>

   <c:if test="${(tag.id == null || tag.id == 0) && showForm == null}">
      <div class="overlay" id="tag-overlay" style="flex-direction: column;">
         <i class="fas fa-2x fa-lock mb-3" style="color: #adb5bd;"></i>
         <button type="button" id="btn-unlock-tag" class="btn btn-success btn-lg">
            <i class="fas fa-plus"></i> CLICK TO ADD NEW TAG
         </button>
      </div>
   </c:if>
</div>

<c:if test="${showForm}">
   <input type="hidden" id="has-validation-errors" value="true">
</c:if>


