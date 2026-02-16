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

	
	// --- LOGIKA ZA TAGOVE ---

	// 1. Funkcija za otključavanje forme (izdvojena da bi bila čista)
	function unlockTagForm() {
		$('#tag-overlay').fadeOut(); // Lepši efekat nestajanja
		$('.tag-actions').hide();
		$('#tagName').focus();

		// Breadcrumb logika
		var tagsLabel = $('#breadcrumb-tags-label');
		if (tagsLabel.length > 0) {
			tagsLabel.removeClass('active');
			$('#breadcrumb-list').append('<li class="breadcrumb-item active">Add</li>');
		}
	}

	// 2. Event listener za klik na dugme "Add New Tag"
	$('#btn-unlock-tag').on('click', function() {
		unlockTagForm();
	});

	// 3. Automatsko otvaranje ako postoje greške u validaciji
	// Proveravamo da li onaj skriveni input iz Koraka 1 postoji
	if ($('#has-validation-errors').length > 0) {
		unlockTagForm();
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

