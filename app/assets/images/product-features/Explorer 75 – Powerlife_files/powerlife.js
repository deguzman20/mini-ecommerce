/*watch modal video*/
var $vidURL;

$('#watch').click(function () {

    if ($vidURL == null) {

        $vidURL = $('#videoModal source').attr('data-src');
        $('#videoModal source').attr('src', $vidURL);
        $('#videoModal video')[0].load();

    } else {
        $('#videoModal video')[0].play();
    }
});

$(function () {
    $('#videoModal').modal({
        show: false
    }).on('hidden.bs.modal', function () {
        $(this).find('video')[0].pause();
    });
});
/*end watch modal video*/


/*change icon on hover effect*/
$('.switch').hover(function () {

    var $switch = $(this).attr('data-switch');

    $('[switch = "' + $switch + '"]').addClass('show-img');
    $('[switch != "' + $switch + '"]').removeClass('show-img');
    $(this).addClass('selected').siblings().removeClass('selected').parent().siblings().children().removeClass('selected');

});
/*end change icon on hover effect*/

/*slide on contact*/
$('a[href="#contact"]').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top
    }, 500, 'linear');
});

$('a[href="#topheader"]').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top - 50
    }, 500, 'linear');
});

$("[aria-controls='collapse-A']").on('click', function (e) {

    e.preventDefault();
    var y = $(window).height() + 100;

    $('html, body').animate({
        scrollTop: $(this).offset().top - 75
    }, 500, 'linear');
});
/*end slide on contact*/

/*hide-btns*/
$('#processBtn').click(function () {

    $(this).hide();
    $('#couponBtn').hide();
});
/*end hide-btns*/

/*e-comm calculation*/
/*
var $coupon = "pl";
var $prc = $('#PriceNow').html();
var $priceInt = parseFloat($prc.replace(',', ''));

var $pName, $totalPrice, $quantity, $couponprc;
var $discount = 0.0;
var $productName = "powerlife";
var $totalPrice = 10;
*/
/*
function intToCur(val) {
    while (/(\d+)(\d{3})/.test(val.toString())) {
        val = val.toString().replace(/(\d+)(\d{3})/, '$1' + ',' + '$2');
    };
    return val;
};

function updateTable() {

    $productName = $quantity + ' x ' + $pName;
    $quantity = $('.input-number').val();
    var $cpn = $('#coupon-input').val();
    $pName = $('#ProductName').html();
    $totalPrice = ($priceInt * $quantity) - $discount;
    var $src = $('#topheader img').attr('src');
    $('#checkout-product img').attr('src', $src);

    $('#checkout-price').html($prc);
    $('#tb-name input').val($pName);
    $('#tb-cpn').html(($couponprc * $discount) * -1);
    $('#tb-price input').val(intToCur($priceInt) + '.00');
    $('#tb-qty input').val($quantity);
    $('#tb-total input').val(intToCur($totalPrice) + '.00');
    $('#tb-cpn').html(($discount * $quantity) * -1);

}
*/

(function () {

    window.inputNumber = function (el) {

        var min = el.attr('min') || false;
        var max = el.attr('max') || false;

        var els = {};

        els.dec = el.prev();
        els.inc = el.next();

        el.each(function () {
            init($(this));
        });

        function init(el) {

            els.dec.on('click', decrement);
            els.inc.on('click', increment);

            function decrement() {
                var value = el[0].value;

                value--;
                if (!min || value >= min) {
                    el[0].value = value;
                }
                updateTable();
            }

            function increment() {
                var value = el[0].value;

                value++;
                if (!max || value <= max) {
                    el[0].value = value++;
                }
                updateTable();
            }



        }
    }
})();

inputNumber($('.input-number'));

$('#btn-cart').click(function () {

    updateTable();

});

$('#update-coupon').click(function () {
    var $cpn = $('#coupon-input').val();

    if ($cpn == $coupon[1]) {
        $discount = 1000;
        updateTable();
    } else {
        alert('Invalid Coupon');
    };
});

$('#btn-cancel').click(function () {

    $('#tb-cpn').html('');
    $('#coupon-input').val('');
    $discount = 0;

    updateTable();

});
/*e-comm calculation*/


/*Quantity Add and Minus*/
(function($){
  
  $('document').ready(function(){
   	    $('.add-plus').click(function(){
          	var $this = $(this);
			var $inp = $this.siblings(".product-quantity");
			var $val = $inp.val();
          	var $parentQ = $inp.closest(".parent-quant");
          	var	$desktopQ = $parentQ.siblings(".desktop-quant").find(".cart__qty-input");

			$val++
			$inp.val($val);
          	$desktopQ.val($val);
		});

		$('.sub-minus').click(function(e){
          	var $this = $(this);
			var $inpm = $this.siblings(".product-quantity");
			var $valm = $inpm.val();
          	var $parentQm = $inpm.closest(".parent-quant");
          	var	$desktopQm = $parentQm.siblings(".desktop-quant").find(".cart__qty-input");          	

			if($valm == 1){
				$inpm.val(1);
              	e.preventDefault();
			}
			else{
				$valm--              	
				$inpm.val($valm);
              	$desktopQm.val($valm);
			}
		}); 
    	
        $('.cart__edit').click(function(e){
          	e.preventDefault();
          	var $this = $(this);
          	var $shide = $this.parent();
          	var $mobq = $shide.siblings(".mobile-quant")
			$mobq.toggle();
        })
  })

})(jQuery)
