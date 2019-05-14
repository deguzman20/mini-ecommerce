// $(function(){
//   $("#btn_login").click(function(){
//      var username = $("#admin_username").val();
//      var password = $("#admin_password").val();
//      var dataString = "username="+username+"&password="+password;

//      $.ajax({
//        url:"/admin_login_action",
//        type:"GET",
//        data:dataString,
//        dataType: "JSON",
//         success:function(data){
//            if(data !=null){
//            	   localStorage.setItem('admin_token',data);
//                document.location.href ="/administration"; 
//            }
//            else{
//            	    alertify.set('notifier','position', 'top-left');
//                 alertify.error('Incorrect Email and Password'); 
//            }
//         },
//         error:function(err){
//         	console.log(err)
//         }
//      });
//   });
// }); 