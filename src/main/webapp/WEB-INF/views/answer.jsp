<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Options</title>
</head>
<body>
<h1>Manage Options</h1>

<form action="${pageContext.request.contextPath}/options/save" method="post">
    <input type="hidden" name="id" value="${option.id}" />
    <input type="text" name="option" placeholder="Enter option" value="${option.option}" required />

    <select name="questionId" required>
        <option value="">-- Select Question --</option>
        <c:forEach var="q" items="${questions}">
            <option value="${q.id}" <c:if test="${option.question != null && option.question.id == q.id}">selected</c:if>>
                ${q.name}
            </option>
        </c:forEach>
    </select>

    <label>
        <input type="checkbox" name="correct" value="true" <c:if test="${option.correct}">checked</c:if> /> Correct
    </label>

    <button type="submit">Save</button>
</form>

<h2>All Options</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Option</th>
        <th>Question</th>
        <th>Is Correct?</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="op" items="${options}">
        <tr>
            <td>${op.id}</td>
            <td>${op.option}</td>
            <td>${op.question.name}</td>
            <td><c:choose><c:when test="${op.correct}">Yes</c:when><c:otherwise>No</c:otherwise></c:choose></td>
            <td>
                <a href="${pageContext.request.contextPath}/options/edit/${op.id}">Edit</a> |
                <a href="${pageContext.request.contextPath}/options/delete/${op.id}" 
                   onclick="return confirm('Delete this option?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>

<br/>
<a href="${pageContext.request.contextPath}/questions">Back to Questions</a>
</body>
</html>
