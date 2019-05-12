$(function(){
 $("#send").click(function(){
    var name = $("#form-name").val();
	  var email = $("#form-email").val();
	  var message = $("#form-text").val();
	  var dataString = "name="+name+"&email="+email+"&message="+message;
    
    if(name !== "" && email !== "" && message !== ""){
      $.ajax({
          url: '/contact_us',
          type:"GET",
          data:dataString,
          dataType:"JSON",
          success:function(data){
              alertify.set('notifier','position', 'bottom-left');
              alertify.success('Send successfuly');
          },
          error:function(err){
            console.log(err);
          }        
      });
    }
    else if(name == "" && email !=="" && message !==""){
      alertify.set('notifier','position', 'bottom-left');
      alertify.error("Name can't be blank");
    }
    else if(name !== "" && email =="" && message !==""){
      alertify.set('notifier','position', 'bottom-left');
      alertify.error("Email can't be blank");
    }
    else if(name !== "" && email !=="" && message ==""){
      alertify.set('notifier','position', 'bottom-left');
      alertify.error("Message can't be blank");
    }
    else{
      alertify.set('notifier','position', 'bottom-left');
      alertify.error("All fields are required"); 
    }
 });
});