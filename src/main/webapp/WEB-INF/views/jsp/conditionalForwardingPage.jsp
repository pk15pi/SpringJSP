<%
    boolean isLoggedIn = session.getAttribute("username") != null;
    if (!isLoggedIn) {
%>
	<!-- Forward to another page  -->
    <jsp:forward page="login.jsp" />
<%
    } else {
    	out.println(" Alredy logged in");
    	
	    <jsp:forward page="forwarded.jsp">
	        <jsp:param name="id" value="123"/>
	        <jsp:param name="type" value="student"/>
	    </jsp:forward>
    	
    }
%>