$(function(){
  if(localStorage.getItem('auth_token')!=""){
    $("#is-login-false").hide();
    $("#is-login-true").show();
  }
  else{
    $("#is-login-true").hide();
    $("#is-login-false").show();
  }
  
  $("#logout").click(function(){
    localStorage.setItem('auth_token',"");
    document.location.reload();
  });

  $("#login").click(function(e){
     var email = $("#email").val();
     var password = $("#pass").val();
     var dataString = "email="+email+"&password="+password;
     
     $.ajax({
       url:"/authentication/sign_in",
       type:"GET",
       data:dataString,
       dataType:"JSON",
        success:function(data){
          if(data !== null){
            localStorage.setItem('auth_token',data);
            document.location.reload();
          }
          else{
            console.log('invalid email and password');
          }
        },
        error:function(err){
          console.log(err);	
        }
     });
     e.preventDefault();
  });	
  $("#sign-up").click(function(){
      var fullname = $("#fullname").val();
      var email = $("#email-address").val();
      var password = $("#password").val();
      var retype = $("#re-pass").val();
      var dataString = "fullname="+fullname+"&email="+email+"&password="+password;
      if(password == retype){
         $.ajax({
           url: '/authentication/sign_up',
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
      }
      else{
      	 alert("Password and Retype does'nt match");
      }
  });
});