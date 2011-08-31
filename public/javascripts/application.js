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


$(function(){
	$.ajaxSetup({
	  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
	});
	
    $("#trialid").click(function(){
      $.ajax({
        type: 'POST',
        url: 'http://high-robot-603.heroku.com/jmsg',
		dataType: 'json',
        data: { msg: "hello world"},
		success: function(json, status, xhr){ alert ('Success')
	   //$("#show_message").html("hello world");
	 	},
	    error: function(data, status, xhr){if(status=='parsererror" {alert('Error')}; }
       }); 
   
     });
});
