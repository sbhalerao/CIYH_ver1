// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    $("#messageid").click(function(){
      alert ("Hello world"); 
      $.ajax({
        type: 'POST',
        url: 'http://high-robot-603.heroku.com/jmsg',
		dataType: 'json',
        data: { msg: "hello world" },
		success: function(json, status, xhr){
	    //$("#show_message").html(json.message)
	 
       });
    });
});