<div>
	<div class="navbar">
		<div class="navbar navbar-item">
			<button class="btn btn-lg btn-primary" id="getSubject">Get Subjects</button>
			<button class="btn btn-lg btn-primary" id="getQuestion">Get Questions</button>
			<button class="btn btn-lg btn-primary" id="postSubject">Post Subject</button>
		</div>
	</div>

	<div id="question"></div>
	<div id="answers"></div>
	<div id="subjects"></div>

	<div>
		<form id="subjectForm" action="${pageContext.request.contextPath}/subjects/save-rb" method="post">
			<input type="text" name="name" id="subjectName" />
			<button type="submit" id="submitSubject"> Submit </button>		
		</form>
	</div>
	<div id="errmsg"></div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function(){

	// Hide the subject form initially
	$("#subjectForm").hide();

	// Show the form when Post Subject is clicked
	$("#postSubject").on("click", function(e){
		e.preventDefault();
		$("#subjectForm").show();
	});

	// Handle form submission via AJAX
	$("#subjectForm").on("submit", function(e){
		e.preventDefault();

		const form = $(this);
		const url = form.attr("action");
		const formData = form.serialize();

		$.ajax({
			type: "POST",
			url: url,
			data: formData,
			success: function(response){
				alert('Subject saved successfully!');
				$('#subjectName').val('');
				$('#subjectForm').hide(); // Hide the entire form after submission
			},
			error: function(xhr, status, error) {
				alert('Error saving subject: ' + xhr.responseText);
			}
		});
	});

	// Get Subjects
	$("#getSubject").on("click", function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/subjects/list",
			type: "GET",
			success: function(response){
				let html = "<ul>";
				if (Array.isArray(response)) {
					response.forEach(function(s){
						html += "<li>" + s.name + " (ID: " + s.id + ")</li>";
					});
				} else {
					html += "<li>Unexpected response format</li>";
				}
				html += "</ul>";
				$("#subjects").html(html);
			},
			error: function(xhr, status, error) {
				console.error("Error occurred:", xhr, status, error);
				$("#errmsg").html("Failed to fetch subjects.");
			}
		});
	});

	// Get Questions
	$("#getQuestion").on("click", function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/questions/list",
			type: "GET",
			success: function(res){
				let html = "<ul>";
				if (Array.isArray(res)) {
					res.forEach(function(r){
						html += "<li>" + r.name + " (ID: " + r.id + ")</li>";
					});
				} else {
					html += "<li>Unexpected response format</li>";
				}
				html += "</ul>";
				$("#question").html(html);
			},
			error: function(xhr, status, error){
				let html = "Error occurred<br/>";
				html += "XHR: " + xhr.responseText + "<br/>Status: " + status + "<br/>Error: " + error;
				$("#errmsg").html(html);
			}
		});
	});
});
</script>
