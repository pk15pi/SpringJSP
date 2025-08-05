<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Enter Quiz Question</h1>

<form action="${pageContext.request.contextPath}/quiz/save" method="post">
    <label>Question:</label>
    <input type="text" name="questionText" required /><br><br>

    <label>Subject:</label>
    <select name="subjectId" required>
        <option value="">Select Subject</option>
        <c:forEach var="s" items="${subjects}">
            <option value="${s.id}">${s.name}</option>
        </c:forEach>
    </select><br><br>

    <h3>Options</h3>

    <div>
        <label>Option 1:</label>
        <input type="text" name="optionTexts" required />
        <input type="radio" name="correctIndex" value="0" class="correctIndex" required /> Correct
    </div>
    <div>
        <label>Option 2:</label>
        <input type="text" name="optionTexts" required />
        <input type="radio" name="correctIndex" value="1" class="correctIndex" /> Correct
    </div>
    <div>
        <label>Option 3:</label>
        <input type="text" name="optionTexts" required />
        <input type="radio" name="correctIndex" value="2" class="correctIndex" /> Correct
    </div>
    <div>
        <label>Option 4:</label>
        <input type="text" name="optionTexts" required />
        <input type="radio" name="correctIndex" value="3" class="correctIndex" /> Correct
    </div><br>

    <button type="submit">Submit</button>
    <button type="reset">Cancel</button>
</form>

<script>
$(document).ready(function(){
    $(".correctIndex").change(function(){
        console.log("Selected correct answer index: " + $(this).val());
    });
});
</script>
