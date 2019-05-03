$(function(){
 // Add smooth scrolling to all links
  $("a[href='#contact_us']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
    
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