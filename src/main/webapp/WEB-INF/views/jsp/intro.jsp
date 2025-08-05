<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    request.setAttribute("clientIP", request.getRemoteAddr());
    request.setAttribute("clientPort", request.getRemotePort());
    request.setAttribute("serverPort", request.getLocalPort());
%>

<!DOCTYPE html>
<html>
<head>
    <title>Introduction to JSP</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .navbar {
            display: flex;
            gap: 10px;
            padding: 10px;
            background-color: #e0e0e0;
        }
        .navbar-item {
            margin-right: 10px;
        }
        .btn {
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="navbar">
        <div class="navbar-item">
            <button id="introBtn" class="btn btn-primary">Intro</button>
        </div>
        <div class="navbar-item">
            <button id="forwarding" class="btn btn-primary">Page Forwarding</button>
        </div>
        <div class="navbar-item">
            <button id="jspExpression" class="btn btn-primary">JSP Expressions</button>
        </div>
    </div>

    <div class="row">
        <!-- USING CORE JSP -->
        <div class="col-sm-2" style="background:#f0f0f0; padding:10px; border:1px solid #ccc;">
            <a>--- USING CORE JSP ---</a>
            <p> <% out.println("client IP: " + request.getRemoteAddr()); %> </p>
            <p> <% out.println("client Port: " + request.getRemotePort()); %> </p>
            <p> <% out.println("server Port: " + request.getLocalPort()); %> </p>
        </div>

        <!-- DOCUMENTATION -->
        <div class="col-sm-8" style="background:#f0f0f0; padding:10px; border:1px solid #ccc;">
            <p>In Core JSP, we use scriptlet tags <code>&lt;% %&gt;</code> to write Java code.</p>
            <p>With JSTL, use <code>&lt;c:.../&gt;</code> tags for logic, and <code>&lt;c:out value="${var}" /&gt;</code> for output.</p>
        </div>

        <!-- USING JSTL -->
        <div class="col-sm-2" style="background:#f0f0f0; padding:10px; border:1px solid #ccc;">
            <a>--- USING JSTL ---</a>
            <p>Client IP: <c:out value="${clientIP}" /></p>
            <p>Client Port: <c:out value="${clientPort}" /></p>
            <p>Server Port: <c:out value="${serverPort}" /></p>
        </div>
    </div>

    <div class="row" style="background:#f0f0f0; padding:10px; border:1px solid #ccc;">
        <h3>JSP Directives</h3>
        <ul>
            <li><code>&lt;%@ include file="relativePath.jsp" %&gt;</code> – Include another JSP</li>
            <li><code>&lt;%@ taglib uri="..." prefix="..." %&gt;</code> – Include tag libraries (e.g., JSTL)</li>
            <li>Always wrap JSTL output with <code>&lt;c:out ... /&gt;</code> to avoid XSS.</li>
        </ul>
    </div>

    <script>
        $(document).ready(function () {
            console.log("jQuery is ready");

            $("#introBtn").click(function () {
                console.log("Intro button clicked");
                window.location.href = "conditionalForwardingPage.jsp";
            });

            $("#forwarding").click(function () {
                console.log("Forwarding button clicked");
                window.location.href = "forwarded"; // update as needed
            });
            $("#jspExpression").on("click",function(){
            	window.location.href = "jspExpression";
            });
        });
    </script>

</body>
</html>
