// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(function(){
	$.ajaxSetup({
	  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
	});
	
    $("#messageid").click(function(){
      $("#show_message").html("hello world")
      $.ajax({
        type: 'POST',
        url: 'http://high-robot-603.heroku.com/jmsg',
		dataType: 'json',
        data: { msg: "hello world"},
		success: function(json, status, xhr){
	   
	 	}
       }); 
   
     });
});