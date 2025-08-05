<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Subject</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<h1>Manage Subject</h1>

<form action="${pageContext.request.contextPath}/subjects/save" method="post">
    <input type="hidden" name="id" value="${subject.id}" />
    <input type="text" name="name" placeholder="Enter Subject Name" value="${subject.name}" required />
    <button type="submit">Save</button>
</form>

<h2>All Subjects</h2>
<table border="1" cellpadding="5">
    <tr>
        <th>ID</th>
        <th>Subject</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="q" items="${subjects}">
        <tr>
            <td>${q.id}</td>
            <td>${q.name}</td>
            <td>
                <!-- Use class, not id, and pass data attributes -->
                <a href="#" class="editSubjectLink" 
                   data-id="${q.id}" 
                   data-name="${q.name}">
                    Edit
                </a> |
                <a href="${pageContext.request.contextPath}/subjects/delete/${q.id}" 
                   onclick="return confirm('Delete this Subject?')">Delete ${q.id}</a> |
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Edit Subject Modal -->
<div class="modal fade" id="editSubjectModal" tabindex="-1" aria-labelledby="editSubjectLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <form id="editSubjectForm" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="editSubjectLabel">Edit Subject</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="editSubjectId">
                    <input type="text" name="name" id="editSubjectName" class="form-control" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary btn-sm">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Script to Handle Modal Fill and Show -->
<script>
$(document).ready(function(){
    $('.editSubjectLink').on('click', function(e){
        e.preventDefault();

        // Get subject data from link
        var id = $(this).data('id');
        var name = $(this).data('name');

        // Fill the modal inputs
        $('#editSubjectId').val(id);
        $('#editSubjectName').val(name);

        // Update form action
        $('#editSubjectForm').attr('action', '${pageContext.request.contextPath}/subjects/save');

        // Show modal
        var modal = new bootstrap.Modal(document.getElementById('editSubjectModal'));
        modal.show();
    });
});
</script>

</body>
</html>
