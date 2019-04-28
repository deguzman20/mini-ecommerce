$(function(){
    
    function formatMoney(amount, decimalCount = 2, thousands = ",") {
        try {
          decimalCount = Math.abs(decimalCount);
          decimalCount = isNaN(decimalCount) ? 2 : decimalCount;
      
          const negativeSign = amount < 0 ? "-" : "";
      
          let i = parseInt(amount = Math.abs(Number(amount) || 0).toFixed(decimalCount)).toString();
          let j = (i.length > 3) ? i.length % 3 : 0;
      
          return negativeSign + (j ? i.substr(0, j) + thousands : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands); 
        } catch (e) { 
          console.log(e)
        }
    };
   
   $("#checkout").click(function(){
    window.location.href = "checkout_steps/customer_information";
   });  

   $.ajax({
   	 url:'/get_sub_total',
   	 type:"GET",
   	 success:function(data){
   	   $("#txt-subtotal").html(formatMoney(data));
   	 },
   	 error:function(err){
   	 	console.log(err);
   	 }
   })

   for (var i = 1; i <= 100; i++) {
     $(`#amount-${i}`).html(formatMoney(parseInt($(`#price-${i}`).attr('class')) * parseInt($(`#quantity-${i}`).val()))); 
   	 $(`#quantity-minus-${i}`).click(function(){
   	 	var id = this.id.replace("quantity-minus-","");
         if($(`#quantity-${id}`).val()>1){
	          $(`#quantity-${id}`).val(Number($(`#quantity-${id}`).val())-1);   
              $.ajax({
                 url:"/decrease_product_quantity",
                 type:"GET",
                 data:{
                   cart_product_id: id
                 },
                 success:function(data){
                   $("#txt-subtotal").html(formatMoney(data));
                   $(`#amount-${id}`).html(formatMoney(parseInt($(`#price-${id}`).attr('class')) * parseInt($(`#quantity-${id}`).val()))); 
                 },
                 error:function(err){
                   console.log(err)
                 }
             });         

         }
         else{
           return false;
         }

 
   	 });
    
     $(`#quantity-plus-${i}`).click(function(){
   	 	var id = this.id.replace("quantity-plus-","");
	     $(`#quantity-${id}`).val(Number($(`#quantity-${id}`).val())+1);     
         
          $.ajax({
           url:"/increase_product_quantity",
           type:"GET",
           data:{
           	 cart_product_id: id
           },
           success:function(data){
           	 $("#txt-subtotal").html(formatMoney(data));
             $(`#amount-${id}`).html(formatMoney(parseInt($(`#price-${id}`).attr('class')) * parseInt($(`#quantity-${id}`).val()))); 
           },
           error:function(err){
           	 console.log(err)
           }
	     });         
   	 });

   	 $(`#delete-${i}`).click(function(){
       var id = this.id.replace("delete-","");
        $(`#row-${id}`).fadeOut();
        $.ajax({
          url:"/delete_cart_product",
          type:"GET",
          data: {
          	id: id
          },
          dataType:"JSON",
          success:function(data){
            $("#txt-subtotal").html(formatMoney(data));
          },
          error:function(err){
          	console.log(err)
          }
        });

   	 });

   }

   $.ajax({
      url:"/get_local_storage",
      type:"GET",
      data:{
      	auth_token: localStorage.getItem('auth_token')
      },
      success:function(data){
  
      },
      error:function(err){
      	console.log(err)
      }
    });

  var url = document.location.href;
 	var product_id  = url.substring(url.lastIndexOf('/') + 1);
	var customer_id = localStorage.getItem('auth_token');
	$(".quantity-plus").click(function(){     
	 $("#qnt").val(Number($("#qnt").val())+1);
	});

	$(".quantity-minus").click(function(){
	 if($("#qnt").val()>1)
	 $("#qnt").val(Number($("#qnt").val())-1);     
	});

	$("#add-to-cart").click(function(){
    if(localStorage.getItem('auth_token')!=""){
       var quantity = $("#qnt").val();
       var dataString = "product_id="+product_id+"&quantity="+quantity;
       $.ajax({
         url:'/add_to_cart',
         type:"GET",
         data:dataString,
         dataType:'JSON',
          success:function(data){
            if(data == "Saved Successful"){
              window.location.href ="/cart";
            }
          },
          error:function(err){
          	console.log(err);
          }
       });
    }
    else{
      alert("you need to login");
    } 
	});
});