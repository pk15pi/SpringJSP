<!-- menu.jsp -->
<div style="background:#f4f4f4; padding:10px;">
<!-- Get each part of the URL seperately and make it complete url  -->
<%--     <a href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/home">Home</a> | --%>
    
    
    <a href="${pageContext.request.contextPath}/questions">Questions</a> |
    <a href="${pageContext.request.contextPath}/answers">Answers</a> |
    <a href="${pageContext.request.contextPath}/subjects">Subjects</a> |
    <a href="${pageContext.request.contextPath}/contact">Contact</a> |
    <a href="${pageContext.request.contextPath}/quiz">Quiz</a> |
    <a href="${pageContext.request.contextPath}/ajaxTest">AJAX</a> |
	<a href="${pageContext.request.contextPath}/jsp/intro">Learn JSP</a> |
	<a href="${pageContext.request.contextPath}/datetime">Date Time</a> |
    <a href="${pageContext.request.contextPath}/orm">Raw Query - ORM</a> |
    <a href="${pageContext.request.contextPath}/jsn">JSON</a> |
    <a href="${pageContext.request.contextPath}/logout">Logout</a> |
    
</div>
