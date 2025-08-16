<h1 class="display4"> This is datetime page</h1>
<style>
div {
	padding:2px;
}
</style>
<div class="text-center text-dark">
<div>
	<span> <button class="btn btn-info btn-sm" id="dtnow" > Date Time now</button> </span>
	<span id="dt1"> </span>
</div>
<div>
	<span> <button class="btn btn-info btn-sm" id="dtnow2" data-bs-toggle="modal" data-bs-target="#exampleModal"> (JS)Convert to MM-DD-YYYY hh:ss</button> </span>
	<span id="dt2"> </span>
</div>
<div>
	<span> <button class="btn btn-info btn-sm" id="dtnow3" > (JAVA: SimpleDateFormat)Convert to MM-DD-YYYY hh:ss</button> </span>
	<span id="dt3"> </span>
</div>
<div>
	<span> <button class="btn btn-info btn-sm" id="dtnow4" > (JAVA: DateTimeFormatter.ofPattern)Convert to MM-DD-YYYY hh:ss</button> </span>
	<span id="dt4"> </span>
</div>
<div>
	<form name="dateform", id="dateform1">
		<input name="datetype" class="form form-contoller" placeholder="provide any formate to see the date / time" />
		<input name="test" class="form form-contoller" placeholder="any value" />
	</form>
	<span><button type="submit" class="btn btn-info btn-sm" id="dtnow5" > (J-Query form ussage and get from spring by dateType</button> </span></span>
	<span id="dt5"> </span>
</div>
<div id="dt6"></div>
<div id="dt7"></div>
<div id="dt8"></div>
<div id="dt9"></div>
<div id="dt10"></div>
</div>

<div class="modal fade" id="jsmodal" tabindex="-1" id="exampleModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="model-header"> 
				<div class="model-title"> Date time using JS </div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	$("#dtnow").click(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/datetime/date1",
			type: "GET",
			success : function(response) {
				console.log(response);
				$("#dt1").text(response);
			},
			error(xhr ,error, status){
				alert("error Occured" + error);
			}
		});
	});
	
	$("#dtnow2").click(function(){
		let dt = new Date();
		$("#dt2").text(dt);
	});
	
	$("#dtnow3").click(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/datetime/date1",
			type : "GET",
			success : function(res) {
				$("#dt3").text(res);
			},
			error(xhr, error, status) {
				alert("error occurred" + error);
			}
		});
	});
	
	$("#dtnow5").click(function() {
	    let $form = $("#dateform1");
	    let formData = $form.serialize();
	    let datetype = $form.find("input[name='datetype']").val();
	    
	    // Configure form attributes
	    $form.attr({
	        "method": "get",
	        "action": `${pageContext.request.contextPath}/datetime/date2`
	    });

	    // Prepare data for AJAX
	    let ajaxData = {};
	    if (datetype) {  // Checks for both empty string and null
	        ajaxData = { 'datetype': datetype };
	    }

	    // AJAX request
	    $.ajax({
	        type: $form.attr("method"),
	        url: $form.attr("action"),
	        data: ajaxData,
	        success: function(response) {
	            $("#dt5").text(response);
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error:", status, error);
	        }
	    });
	});
	
	
});
</script>