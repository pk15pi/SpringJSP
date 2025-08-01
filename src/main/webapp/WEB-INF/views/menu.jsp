<!-- menu.jsp -->
<div style="background:#f4f4f4; padding:10px;">
    <a href="home.jsp">Home</a> |
    <a href="about.jsp">About</a> |
    <a href="contact.jsp">Contact</a> |
    <a href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/logout">Logout</a>
</div>
