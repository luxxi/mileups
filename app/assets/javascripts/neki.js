$(document).ready(function() {

	var container = $("#trip")[0];
	var msnry;

	if ( container ) {
		imagesLoaded(container, function() {
			msnry = new Masonry( container, {
			 	columnWidth: Math.floor($("#trip").width() / 4),
			 	itemSelector: '.item'
			});
		});

		eventie.bind( container, 'click', function( event ) {
		  	if ( !event.target.parentElement.classList.contains("item") ) {
	    		return;
		  	}

		  	$( event.target.parentElement ).toggleClass('three');
		  	msnry.layout();
		});
	}
});
