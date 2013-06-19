// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
	$('#toggleButton').click( function() {
		$('#bodycontent').slideToggle('2000', function(){
		if ($('#bodycontent').is(':visible')) {
			$('#toggleButton').val('Hide') 
		} else {
			$('#toggleButton').val('Show') 
		}
		});
  });

	$("#userlist th a").live("click", function(){
		$.getScript(this.href);
		return false;
	});
	
	$("#posts_search").submit(function() {
		$.get(this.action, $(this).serialize(), null, "script");
		return false;
	});
});