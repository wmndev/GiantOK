$(document).ready(function() {
	
	var $addLinkBtn;

	//	$(".rating").rating('size'=>'xs']);

	$('.hide-section').toggle();
	$('.alert-msg-suc').hide();

	$('.dish-reviews-link').click(function() {
		$addLinkBtn = $(this);
		$(this).parent().parent().parent().next().toggle();
		$(this).toggle();
		$('.btn-submit').prop('disabled', true);
	});

	$(".textarea-review").on('change keyup paste', function() {
		if ($(this).val().length == 0) {
			$('.btn-submit').prop('disabled', true);
		} else {
			$('.btn-submit').prop('disabled', false);
		}
	});

	$('.recipe-popover').click(function(e) {
		e.preventDefault();		
		$.get("", {id:$(this).attr("data-id") },function(data){
			$('#recipe-heading').html(data.name);
			$('#recipe-content-p').html(data.recipe);
			$('#dishRecipeModal').modal('show');
		});
	});
	
	$('.reviews-popover').click(function(e){
		e.preventDefault();	
		var rev='';
		$.get("", {id:$(this).attr("data-id"), isGetReviews:true },function(data){
			$('#reviews-heading').html(data.name);
			$.each(data.reviews, function(i, review){
																								
				/*
				 * <div class="row"> <ul class="list-inline"> <li><strong>Gilor
				 * Wiseman</strong></li> <li>Rated: 4</li> </ul>
				 * 
				 * </div> <div class="row"> <p class="lead">Vivamus sagittis
				 * lacus vel augue laoreet rutrum faucibus dolor auctor. Duis
				 * mollis, est non commodo luctus</p> </div> <hr>
				 */
				
				
				rev += '<div class="row"> <ul class="list-inline"><li><strong>'+review.userName+'</strong></li><li>Rated :'+review.rate+
				'</li></ul></div><div class="row"><p class="lead">'+review.review+'</div><hr>';
			});

			$('#dishReviewsBody').html(rev.length> 0 ? rev : 'No Reviews Yet..');
			$('#dishReviewsModal').modal('show');
		});
	});

	$('.post-review-form').submit(function(e) {
		e.preventDefault();
		var $form = $(this);
		$.ajax({
			type : "POST",
			url : "postReview",
			data : $(this).serialize(), // serializes the form's elements.
			success : function(data) {
		        $('.alert-msg-suc').show();
		         $('.alert-msg-suc').text('Thank you for your review!'); 
		         setTimeout(function() {
		             $('.alert-msg-suc').hide();
		             $form.parent().parent().toggle();
		             $addLinkBtn.toggle();
		             $form.find("input[type=text],textarea").val("");
		             $form.find("input[type=number]").val("1");
		            }, 2000);		     
			}
		});

		return false; // avoid to execute the actual submit of the form.
	});

});