// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//$.ajaxSetup provides the default settings for $.ajax()
// beforeSend - pre-request callback used to modify jqXHR (XMLHTTPRequest). Returning false in this function cancels the request.
// data - data to be sent to server, converted to a questy string. Object is key:value pair
/*success - function to be called with the request succeeds. data - data retunred from the server (formatted according
to dataType parameter), string describing statys and the jqXHR (XMLHTTPRequest object). In the code below,
xhr is used to specify jqXHR

jqXHR object- jQuery XMLHTTPRequest is superset of XMLHTTPRequest. It contains- responseTest, responseXML, getResponseHeader() method.
The XMLHttpRequest object is used to exchange data with a server behind the scenes.

*/

$(window).load(function(){
$.ajaxSetup({
'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

//sending height, width of resizable image. ID is sent as rid
  $("#.cat img").resizable({ handles:'n,e,s,w,ne,se,nw,sw' , maxHeight: 300, aspectRatio: true,
  stop: function(event, ui) {


$.ajax({
type: 'POST',
url: 'http://high-robot-603.heroku.com/jmsg',
dataType: 'json',
data:{ width: ui.size["width"], height: ui.size["height"], rid:$(this).parent().attr('id')},
success: function(json, status, xhr)
{ // alert ('Success')
//$("#show_message").html("hello world");
},
error: function(data, status, xhr){ //alert('Failure')
}
});
}
});

//sending height, width of resizable image. ID is sent as rid
$("#.cat img").load( function(){ 
$("#.cat img").resizable({ handles:'n,e,s,w,ne,se,nw,sw' , maxHeight: 300, aspectRatio: true,
  stop: function(event, ui) {


$.ajax({
type: 'POST',
url: 'http://high-robot-603.heroku.com/jmsg',
dataType: 'json',
data:{ width: ui.size["width"], height: ui.size["height"], rid:$(this).parent().attr('id')},
success: function(json, status, xhr)
{ // alert ('Success')
//$("#show_message").html("hello world");
},
error: function(data, status, xhr){ //alert('Failure')
}
});
}
});

});

  
// Making all cats draggable
   
    $("#cat1").draggable({containment: "#droppable", snap:false, cursor: "move"});
$("#cat2").draggable({containment: "#droppable", snap:false, cursor: "move"});
    $("#cat3").draggable({containment: "#droppable", snap:false, cursor: "move"});
	    $("#cat4").draggable({containment: "#droppable", snap:false, cursor: "move"});
	$("#cat5").draggable({containment: "#droppable", snap:false, cursor: "move"});
	    $("#cat6").draggable({containment: "#droppable", snap:false, cursor: "move"});
 
// Making all hats draggable
    $("#hat1").draggable({containment: "#droppable", snap:false, cursor: "move"});
$("#hat2").draggable({containment: "#droppable", snap:false, cursor: "move"});
    $("#hat3").draggable({containment: "#droppable", snap:false, cursor: "move"});
	  $("#hat4").draggable({containment: "#droppable", snap:false, cursor: "move"});
	$("#hat5").draggable({containment: "#droppable", snap:false, cursor: "move"});
	    $("#hat6").draggable({containment: "#droppable", snap:false, cursor: "move"});

  
  
  $( "#droppable" ).droppable({
      drop: function( event, ui ) {
        $( this ).find( "p" ).hide();
        var offset1=$("#droppable").offset();
$.ajax({
type: 'POST',
url: 'http://high-robot-603.heroku.com/jmsg',
dataType: 'json',
data:{ top: ui.offset["top"], left: ui.offset["left"], pid: (ui.draggable).attr("id"), backx: offset1.left, backy: offset1.top  },
success: function(json, status, xhr)
{ // alert ('Success')
//$("#show_message").html("hello world");
},
error: function(data, status, xhr){alert('Failure')}
});
      }
    });

   var resizeTimer;
	$(window).resize (function() {
		clearTimeout(resizeTimer, 100);
		resizeTimer=setTimeout(doSomething,100);
			});
	 
	function doSomething(){
	var offset1 = $("#droppable").offset();
	$.ajax({
	type: 'POST',
	url: 'http://high-robot-603.heroku.com/jmsg',
	dataType: 'json',
	data:{ backx: offset1.left, backy: offset1.top  },
	success: function(json, status, xhr)
	{ // alert ('Success')
	//$("#show_message").html("hello world");
	},
	error: function(data, status, xhr){alert('Failure2')}
	});
	}





	       $("#various1").fancybox({
					'titlePosition'		: 'inside',
					'transitionIn'		: 'none',
					'transitionOut'		: 'none'
		   });

	       $("#various2").fancybox({
					'titlePosition'		: 'inside',
					'transitionIn'		: 'none',
					'transitionOut'		: 'none'
		   });
		  
		  $("#various3").fancybox({
					'titlePosition'		: 'inside',
					'transitionIn'		: 'none',
					'transitionOut'		: 'none'
		   });

          $("#various4").fancybox({
					'titlePosition'		: 'inside',
					'transitionIn'		: 'none',
					'transitionOut'		: 'none'
		   });
		$("#uploadcat").fancybox({
					'titlePosition'		: 'inside',
					'transitionIn'		: 'none',
					'transitionOut'		: 'none',
					'type' : 'iframe'
		   });
       
        $(".onesec-hor a:has(img)").fancybox();

		


});


$(document).ready(function (){
$(".background_choices img").click(function() {
 // alert('Handler for .click() called.');
  var backimg=$(this).parent().find("img").attr("src"); 
  
	$.ajax({
	type: 'POST',
	url: 'http://high-robot-603.heroku.com/jmsg',
	dataType: 'json',
	data:{ backimg: backimg},
	success: function(json, status, xhr)
	{ // alert ('Success')
	 $("#droppable").find("img").attr("src", backimg);
	},
	error: function(data, status, xhr){alert('Failure1')}
	});

   });


//adding rcarousel
  
    jQuery(function($) {
					$("#carousel").rcarousel({
						orientation: "vertical",
						visible: 2,
						step: 1
					});
				});


   });




