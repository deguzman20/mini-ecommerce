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

 for (var i = 1; i<= 1000;i++) {
   $(`#view-${i}`).click(function(){
      var id = this.id.replace("view-","");
      $.ajax({
        url: '/order_product',
        type:'GET',
        data:{
          id:id
        },
        dataType:'JSON',
         success:function(data){
           $("#product-tbody").html("");
           $.each(data,function(k,v){
             $.ajax({
               url:'/get_product',
               type:'GET',
               data:{
               	 product_id: v.product_id
               },
               success:function(product_data){
               	console.log(product_data)
                 var markup = `
                                  <tr>
                                    <td><image src='${product_data.image.url}' class='img img-thumbnail' width='100px' /></td>
                                    <td>${product_data.name}</td> 
                                    <td>₱ ${formatMoney(product_data.price)}</td>
                                    <td>${v.sub_total / product_data.price}</td>
                                    <td>₱ ${formatMoney(v.sub_total)}</td>  
                                  </tr> 
           
                               `;
                    $("#product-tbody").append(markup);           
               },
               error:function(err){
               	 console.log(err)
               }
             });
           });
         },
         error:function(err){
           console.log(err)
         }
      });
   });
 }
});