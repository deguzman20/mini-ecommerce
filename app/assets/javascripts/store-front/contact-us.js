$(function(){
 $("#send").click(function(){
      var name = $("#form-name").val();
	  var email = $("#form-email").val();
	  var message = $("#form-text").val();
	  var dataString = "name="+name+"&email="+email+"&message="+message;

	  $.ajax({
        url: '/contact_us',
        type:"GET",
        data:dataString,
        dataType:"JSON",
        success:function(data){
        	console.log(data)
        },
        error:function(err){
        	console.log(err);
        }        
	  });
 });
});