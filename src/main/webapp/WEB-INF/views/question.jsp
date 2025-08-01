<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Subjects</title>
</head>
<body>
<h1>Manage Subjects</h1>

<form action="${pageContext.request.contextPath}/subjects/save" method="post">
    <input type="hidden" name="id" value="${subject.id}" />
    <input type="text" name="name" placeholder="Enter subject name" value="${subject.name}" required />
    <button type="submit">Save</button>
</form>

<h2>All Subjects</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="s" items="${subjects}">
        <tr>
            <td>${s.id}</td>
            <td>${s.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/subjects/edit/${s.id}">Edit</a> |
                <a href="${pageContext.request.contextPath}/subjects/delete/${s.id}" 
                   onclick="return confirm('Delete this subject?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<br/>
<a href="${pageContext.request.contextPath}/questions">Manage Questions</a>
</body>
</html>
