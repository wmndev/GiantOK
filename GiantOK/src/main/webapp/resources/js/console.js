$(document).ready(function() {
	
	$('#new-dish-btn').click(function() {
		
		$("#newDishModal").modal('show');
	});
	
	$(".comment").shorten({
	    "showChars" : 200
	});
	
	
	$( "#new-dish-form" ).submit(function( event ) {
		  event.preventDefault();
		    $.ajax({  
		        type : "POST",   
		        url : "newDish",   
		        data : $("#new-dish-form").serialize(),  
		        success : function(response) {  
		         alert(response);   
		        },  
		        error : function(e) {  
		         alert('Error: ' + e);   
		        }  
		       });  
		  
		  
		});
	
});