$(function(){
    if($(".announcement:hidden").length == 0){ // check if any hidden divs still exist
        $("#announcement-load").hide();
        //alert("No more divs"); // alert if there are none left
    }
    $(".announcement").slice(0, 3).show(); // select the first 3
    $("#announcement-load").click(function(e){ // click event for load more
        e.preventDefault();
        $(".announcement:hidden").slice(0, 3).show(); // select next 3 hidden divs and show them
        if($(".announcement:hidden").length == 0){ // check if any hidden divs still exist
            $("#announcement-load").hide();
            //alert("No more divs"); // alert if there are none left
        }
    });
    
    if($(".wall-of-power:hidden").length == 0){ // check if any hidden divs still exist
           $("#wall-of-power-load").hide();
            //alert("No more divs"); // alert if there are none left
      }

    $(".wall-of-power").slice(0, 3).show(); // select the first 3
     $("#wall-of-power-load").click(function(e){ // click event for load more
        e.preventDefault();
        $(".wall-of-power:hidden").slice(0, 3).show(); // select next 3 hidden divs and show them
        if($(".wall-of-power:hidden").length == 0){ // check if any hidden divs still exist
            $("#wall-of-power-load").hide();
            //alert("No more divs"); // alert if there are none left
        }
    });
});