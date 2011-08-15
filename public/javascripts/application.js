// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
    $("#jmsg").click(function(){
       $.ajax({
        type: 'POST',
        url: 'http://your_url/jmsg',
        data: { msg: "hello world" },
       });
    });
});