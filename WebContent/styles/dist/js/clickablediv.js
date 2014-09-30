$(document).delegate(".clickable", "click", function() {
   window.location = $(this).attr('id');  
});