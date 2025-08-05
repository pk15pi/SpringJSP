<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<!-- Check if session attribute 'username' exists -->
<c:if test="${empty sessionScope.username}">
  <c:redirect url="${pageContext.request.contextPath}/login" />
</c:if>

<div class="container mt-3" style="min-height:400px;">
    <c:if test="${not empty contentPage}">
        <jsp:include page="../${contentPage}" />
    </c:if>
</div>

<%@ include file="footer.jsp" %>
