$(function(){
  
   $.ajax({
      url:"/checkout_steps/get_local_storage",
      type:"GET",
      data:{
      	auth_token: localStorage.getItem('auth_token')
      },
      success:function(data){
        console.log(data)
      },
      error:function(err){
      	console.log(err)
        }
    });

   $("#continue_to_shipping_method").click(function(){
       var email = $("#email_address").val()
       var fname = $("#fname").val();
       var lname = $("#lname").val();
       var address = $("#address").val();
       var apartment = $("#apartment").val();
       var city = $("#city").val();
       var country = $("#country").val();
       var postal = $("#postal").val();
       var dataString = "email="+email+"&fname="+fname+"&lname="+lname+"&address="+address+"&apartment="+apartment+"&city="+city+"&country="+country+"&postal="+postal+"&is_save_info_checked="+$('#save_this_info').is(":checked");
       codeAddress();  
             setTimeout(function(){
               $.ajax({
                 url:"/continue_to_shipping_method",
                 type:"GET",
                 data:dataString,
                 dataType:"JSON",
                  success:function(data){
                    if(data == "shipping address saved successfuly"){
                      window.location.href = "/checkout_steps/shipping_method";
                    }
                  },
                  error:function(err){
                    console.log(err)
                  }
               });
             }, 2000);
               
   });

});