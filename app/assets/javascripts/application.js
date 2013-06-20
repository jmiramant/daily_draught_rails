// don't do this = require jquery

//= require_tree ../../../vendor/assets/javascripts/
//= require_tree .


$(document).ready(function(){
	$('#login').on('click', function(e){
		e.preventDefault();
		$(this).css("display", "none");
	});

	MapsLib.initialize();


});