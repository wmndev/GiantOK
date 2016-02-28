$(document).ready(function() {
	
	$('#msg-suc').hide();
	$("#example").popover();
	$('#modal-trigger').click(function() {
		
		$("#myModal").modal('show');
	});
	$('#signInHref').click(function() {
//		event.preventDefault();
		$("#signInModal").modal('show');
	});
	
	$('#dish-recipe-link').click(function() {
//		event.preventDefault();
		$("#dishRecipeModal").modal('show');
	});
	
	
	
	
	$( "#order-form" ).submit(function( event ) {
		  event.preventDefault();
		  
		    $.ajax({  
		        type : "POST",   
		        url : "Order",   
		        data : $("#order-form").serialize(),  
		        success : function(response) {  
		        $('#msg-suc').show();
		         $('#msg-suc').text(response); 
		         
		        },  
		        error : function(e) {  
		         alert('Error: ' + e);   
		        }  
		       });  
		  
		  
		});
});