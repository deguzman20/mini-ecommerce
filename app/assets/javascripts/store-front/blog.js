$(function(){
 $(".post-comment").click(function(e){
   var url = window.location.href;
   var last_char = url.charAt( url.length - 1 )
   var serialize_data = $("#leave_a_reply").serialize()+"&blog_id="+last_char;
   $.ajax({
     url: '/reply',
     type: 'GET',
     data: serialize_data,
     dataType: 'JSON',
      success:function(data){
        console.log(data)
         alertify.set('notifier','position', 'bottom-left');
         alertify.success('Send succesfully');
      },
      error:function(err){
      	console.log(err)
      }
   })
   e.preventDefault();
 });
});	