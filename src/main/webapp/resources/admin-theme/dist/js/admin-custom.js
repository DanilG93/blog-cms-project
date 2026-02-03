/**
 * 
 */

$(document).ready(function() {

	// Inicijalizacija Summernote
	if ($('#summernote').length > 0) {
		$('#summernote').summernote({
			placeholder: 'Write your post content here...',
			height: 300,
			toolbar: [
				['style', ['style']],
				['font', ['bold', 'underline', 'clear']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				['table', ['table']],
				['insert', ['link', 'picture', 'video']],
				['view', ['fullscreen', 'codeview', 'help']]
			]
		});
	}



	// SELECT2 INICIJALIZACIJA
	if ($('.select2').length > 0) {
		$('.select2').select2({
			theme: 'bootstrap4',
			placeholder: "Select options"
		});
	}

	//  CUSTOM FILE INPUT (auto imput text-area kod faila)
	if (window.bsCustomFileInput) {
		bsCustomFileInput.init();
	}

	//  AUTO-ACTIVE MENU (za navigacuju da ako je aktivno ostane otvoreno..)
	var currentUrl = window.location.href.split(/[?#]/)[0];
	$('.nav-sidebar a').each(function() {
		if (this.href === currentUrl) {
			$(this).addClass('active');
			$(this).parentsUntil(".nav-sidebar", ".nav-item").addClass('menu-open');
			$(this).parentsUntil(".nav-sidebar", ".nav-item").children(".nav-link").addClass('active');
		}
	});

	//Checking if there is at least one role (User Form logic)
	$(document).on('change', 'input[name="roles"]', function() {
		
		var checkedCount = $('input[name="roles"]:checked').length;

		
		if (checkedCount === 0) {
			
			$('input[value="ROLE_BLOGGER"]').prop('checked', true);

			
			console.log("User must have at least one role. Automatically returned BLOGGER.");
		}
	});

});

