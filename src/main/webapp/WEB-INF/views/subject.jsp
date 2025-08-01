<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Questions</title>
</head>
<body>
<h1>Manage Questions</h1>

<form action="${pageContext.request.contextPath}/questions/save" method="post">
    <input type="hidden" name="id" value="${question.id}" />
    <input type="text" name="name" placeholder="Enter question" value="${question.name}" required />

    <select name="subjectId" required>
        <option value="">-- Select Subject --</option>
        <c:forEach var="sub" items="${subjects}">
            <option value="${sub.id}" <c:if test="${question.subject != null && question.subject.id == sub.id}">selected</c:if>>
                ${sub.name}
            </option>
        </c:forEach>
    </select>

    <input type="text" name="addedBy" placeholder="Added By" value="${question.addedBy}" required />
    <button type="submit">Save</button>
</form>

<h2>All Questions</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Question</th>
        <th>Subject</th>
        <th>Added By</th>
        <th>Added On</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="q" items="${questions}">
        <tr>
            <td>${q.id}</td>
            <td>${q.name}</td>
            <td>${q.subject.name}</td>
            <td>${q.addedBy}</td>
            <td>${q.addedOn}</td>
            <td>
                <a href="${pageContext.request.contextPath}/questions/edit/${q.id}">Edit</a> |
                <a href="${pageContext.request.contextPath}/questions/delete/${q.id}" 
                   onclick="return confirm('Delete this question?')">Delete</a> |
                <a href="${pageContext.request.contextPath}/options?questionId=${q.id}">Options</a>
            </td>
        </tr>
    </c:forEach>
</table>

<br/>
<a href="${pageContext.request.contextPath}/subjects">Manage Subjects</a>
</body>
</html>
