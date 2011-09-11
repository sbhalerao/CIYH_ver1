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

$(document).ready(function(){
	$.ajaxSetup({
	  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
	});
	
  $("#cat1 img").resizable({ handles:'n,e,s,w,ne,se,nw,sw' , maxHeight: 300, aspectRatio: true,
 							stop: function(event, ui) { 
								$.ajax({
						        type: 'POST',
						        url: 'http://high-robot-603.heroku.com/jmsg',
								dataType: 'json',
						        data:{ width: ui.size["width"],height: ui.size["height"], pid: ui.originalElement.id},
								success: function(json, status, xhr)
								{  alert ('Success')
							   //$("#show_message").html("hello world");
							 	},
							    error: function(data, status, xhr){alert('Failure')} 
						       });
							}
							});
    $("#cat1").draggable({containment: "#droppable", snap:false, cursor: "move"}); 
  
  $( "#droppable" ).droppable({
      drop: function( event, ui ) {
        $( this ).find( "p" ).hide();
		$.ajax({
	        type: 'POST',
	        url: 'http://high-robot-603.heroku.com/jmsg',
			dataType: 'json',
	        data:{ top: ui.offset["top"], left: ui.offset["left"], pid: (ui.draggable).attr("id") },
			success: function(json, status, xhr)
			{  alert ('Success')
		   //$("#show_message").html("hello world");
		 	},
		    error: function(data, status, xhr){alert('Failure')} 
	       });
      }
    });
});



	
   
   
   
     

