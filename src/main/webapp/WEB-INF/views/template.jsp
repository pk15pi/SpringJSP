<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<div style="min-height:400px; padding:20px;">
    <jsp:include page="${contentPage}" />
</div>

<%@ include file="footer.jsp" %>
