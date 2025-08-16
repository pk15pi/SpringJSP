<div class="container-fluid">
    <h1 class="display-4 text-center">ORM</h1>
    <div class="row">
        <div class="col-md-3 m-2">
            <button class="btn btn-primary" id="getOrmObject">Get Object</button>
        </div>
        <div class="col-md-9 text-dark" id="result1"></div>
    </div>
      <div class="row">
        <div class="col-md-3 m-2">
            <button class="btn btn-primary" id="getOrmObjectw">Get Object</button>
        </div>
        <div class="col-md-9" id="result"></div>
    </div>
</div>

<script>
$(function () {
    $("#getOrmObject").on("click", function () {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/orm/rawsql",
            success: function (result) {
            	let html = "";
            	result.forEach((value, index) => {
            		html += '<div id="h' + index + '">' + index + ' : ' + value + '</div>';
            	});
            	$("#result1").html(html);
            },
            error: function (xhr, status, error) {
                alert("Error occurred: " + status + " - " + error);
            }
        });
    });
    $("#getOrmObjectw").on("click", function () {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/orm/rawsql?w=yes",
            success: function (result) {
                let html = "";
                $.each(result, function(index, value) {
                    html += '<div id="h' + index + '">' + index + ' : ' + value + '</div>';
                });
                $("#result").html(html);
            },
            error: function (xhr, status, error) {
                alert("Error occurred: " + status + " - " + error);
            }
        });
    });

});
</script>
