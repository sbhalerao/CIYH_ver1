// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
    $("#select_link").click(function(){
       $.ajax({
        type: 'POST',
        url: 'http://your_url/jmsg',
        data: { msg: "hello world" },
       });
    });
});