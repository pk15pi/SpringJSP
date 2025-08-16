<div class="container text-center text-secondary display-4">JSON</div>
<div class="row mt-3">
    <div class="col-md-4 d-flex flex-column gap-2">
        <button class="btn btn-primary" id="pojojson">Using POJO</button>
        <button class="btn btn-primary" id="mapjson">Using MAP</button>
        <button class="btn btn-primary" id="usingRecord">Using Record</button>
    </div>
    <div class="col-md-8" id="result" style="white-space: pre-wrap;"></div>
</div>

<script>
$(function() {
    // Common function to fetch and display JSON
    function fetchJson(url) {
        $.ajax({
            type: "GET",
            url: url,
            success: function(response) {
                $("#result").text(JSON.stringify(response, null, 2));
            },
            error: function(xhr, status, error) {
                $("#result").text("Error: " + status + " - " + error);
            }
        });
    }

    $("#pojojson").on("click", function() {
        fetchJson("${pageContext.request.contextPath}/jsn/usingPOJO");
    });

    $("#mapjson").on("click", function() {
        fetchJson("${pageContext.request.contextPath}/jsn/usingMAP");
    });

    $("#usingRecord").on("click", function() {
        fetchJson("${pageContext.request.contextPath}/jsn/usingRecord");
    });
});
</script>
