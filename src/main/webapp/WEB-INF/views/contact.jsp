<div class="container mt-4">
    <h2 class="text-primary">This is the contact page.</h2>
    <p>Welcome, ${name}!</p>
    <div id="patchval"> # </div>
    <button id="changeContacts" class="btn btn-secondary btn-lg">
        Click me to change contacts in sequence
    </button>
    
    <div>
    	<button class="btn btn-primay btn-sm" id="ajxCallBtnQ"> Get all Questions </button>
    	<div id="ajxvalues"> </div>
    </div>
</div>

<script>
$(document).ready(function(){
    const contacts = ["Contact 1: John", "Contact 2: Alice", "Contact 3: Bob"];
    let index = 0;
    $("#changeContacts").click(function(){
        $("#patchval").text(contacts[index]);
        index = (index + 1) % contacts.length;
    });
    
    $("#ajxCallBtnQ").on("click", function(){
    	$.ajax({
    		url: '/'
    	})
    });
});
</script>
