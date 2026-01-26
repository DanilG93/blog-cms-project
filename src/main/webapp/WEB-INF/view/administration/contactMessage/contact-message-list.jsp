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

      <div class="content-wrapper">

         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Message Management</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                           <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item active">Messages</li>
                     </ol>
                  </div>
               </div>
               <h5>All Messages</h5>
            </div>
         </section>

         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-12">






                     <div class="timeline ">


                        <c:forEach var="contactMessage" items="${contactMessageList}">


                           <div class="time-label">
                              <span class="${contactMessage.isRead ? 'bg-secondary' : ' bg-info'}">${contactMessage.dateFormatted}</span>
                           </div>
                           <div>
                              <i class="fas ${contactMessage.isRead ? 'fa-envelope-open bg-secondary' : 'fa-envelope bg-info'} "></i>
                              <div class="timeline-item card-primary">
                                 <span class="time">
                                    <i class="fas fa-clock"></i> ${contactMessage.timeFormatted}
                                 </span>
                                 <h3 class="timeline-header  card-outline ${contactMessage.isRead ? 'card-secondary' : 'card-info'}">
                                    <a class="${contactMessage.isRead ? 'text-info' : 'text-primary'}">${contactMessage.name}</a>
                                    sent you message
                                    <c:if test="${!contactMessage.isRead}">
                                       <span class="badge badge-primary">New</span>
                                    </c:if>
                                 </h3>

                                 <div class="timeline-body">${contactMessage.message}</div>
                                 <div class="timeline-footer">
                                 
                                    <c:if test="${!contactMessage.isRead}">
                                       <a href="${pageContext.request.contextPath}/administration/messages/mark-read?id=${contactMessage.id}"
                                          class="btn btn-primary btn-sm"> Mark as read </a>
                                    </c:if>

                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete-modal-${contactMessage.id}">
                                       Delete</button>
                                 </div>
                              </div>
                           </div>


                           <div class="modal fade" id="delete-modal-${contactMessage.id}">
                              <div class="modal-dialog">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h4 class="modal-title">Delete Message</h4>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                       </button>
                                    </div>

                                    <form:form action="${pageContext.request.contextPath}/administration/messages/delete" method="post">
                                       <div class="modal-body text-left">
                                          <p>Are you sure you want to delete message ?</p>
                                          <input type="hidden" name="id" value="${contactMessage.id}">
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