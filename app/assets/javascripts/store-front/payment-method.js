$(function(){
   $("#billing-address").hide(); 
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
    
    $("input[type='radio']").change(function(){
      if($("#defaultUnchecked").is(':checked')){
        $("#billing-address").slideDown();
      }
      else{
        $("#billing-address").slideUp();
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
       if(email !== "" && fname !== "" && lname !== "" && address !== "" && city !== "" && country !== "" && postal !==""){
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
       }
       else{
         alertify.set('notifier','position', 'bottom-left');
         alertify.error("All fields are required"); 
       }
              
   });
  
  $("#continue_to_payment_method").click(function(){
    window.location.href = "/checkout_steps/payment_method";
  }); 

  $("#complete_order").click(function(){
     var fname = $("#fname").val();
     var lname = $("#lname").val();
     var address = $("#address").val();
     var apartment = $("#apartment").val();
     var city = $("#billing_city").val();
     var country = $("#country").val();
     var postal = $("#postal").val();
     var dataString = "email="+null+"&fname="+fname+"&lname="+lname+"&address="+address+"&apartment="+apartment+"&city="+city+"&country="+country+"&postal="+postal+"&standard_shipping="+false;
     
      if($("#defaultUnchecked").is(':checked')){
        $("#billing-address").slideDown();
        if(fname !== "" &&  lname !=="" && address !=="" && city !=="" && country !=="" && postal !==""){
               paymentMethodCodeAddress();
               setTimeout(function(){
                 $.ajax({
                   url:"/complete_order",
                   type:"GET",
                   data:dataString,
                   dataType:"JSON",
                    success:function(data){
                      // if(data == "shipping address saved successfuly"){
                      //   window.location.href = "/checkout_steps/shipping_method";
                      // }
                      console.log(data)
                    },
                    error:function(err){
                      console.log(err)
                    }
                 });
               }, 2000);
        }
        else{
          alertify.set('notifier','position', 'bottom-left');
          alertify.error("All fields are required");
          return false; 
        }
      }
      else{
        $("#billing-address").slideUp();
      }
  });

});
