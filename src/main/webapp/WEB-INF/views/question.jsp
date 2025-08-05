<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Manage Questions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body class="container mt-4">

<h2>Manage Questions</h2>

<!-- Question Form -->
<form action="${pageContext.request.contextPath}/questions/save" method="post" class="mb-4">
    <input type="hidden" name="id" value="${question.id}" />

    <div class="mb-3">
        <label for="name" class="form-label">Question</label>
        <input type="text" name="name" id="name" class="form-control" placeholder="Enter question" value="${question.name}" required />
    </div>

    <div class="mb-3">
        <label for="subjectSelect" class="form-label">Subject</label>
        <select name="subjectDropdown" id="subjectSelect" class="form-select" required>
            <option value="">-- Select Subject --</option>
            <c:forEach var="sub" items="${subjects}">
                <option value="${sub.id}" ${sub.id == question.subject.id ? 'selected' : ''}>${sub.name}</option>
            </c:forEach>
        </select>
        <!-- This will store the selected subject id for binding in controller -->
        <input type="hidden" name="subjectId" id="subjectId" value="${question.subject.id}" />
    </div>

    <div class="mb-3">
        <label for="addedBy" class="form-label">Added By</label>
        <input type="text" name="added_by" id="addedBy" class="form-control" value="${question.added_by}" readonly />
    </div>

    <button type="submit" class="btn btn-primary">Save</button>
</form>

<!-- Questions Table -->
<h4>All Questions</h4>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Question</th>
            <th>Subject</th>
            <th>Added By</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="q" items="${questions}">
            <tr>
                <td>${q.id}</td>
                <td>${q.name}</td>
                <td>${q.subject.name}</td>
                <td>${q.added_by}</td>
                <td>
                    <a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/questions/edit/${q.id}">Edit</a>
                    <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/questions/delete/${q.id}" onclick="return confirm('Are you sure you want to delete this question?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- JavaScript to sync selected subject ID -->
<script>
    $(document).ready(function () {
        $('#subjectSelect').on('change', function () {
            $('#subjectId').val($(this).val());
        });

        // Sync on page load for edit case
        $('#subjectId').val($('#subjectSelect').val());
    });
</script>

</body>
</html>
