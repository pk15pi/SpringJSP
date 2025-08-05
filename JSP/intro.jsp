<html>
    <head>
        <title>Introduction</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
    </head>

    <body>
        Hello, JSP!
        <p>Welcome to the introduction page.</p>
        <%
            String message = "This is a simple JSP page.";
            out.println("<p>" + message + "</p>");
        %>
        <p>Enjoy learning JSP!</p>

    </body>