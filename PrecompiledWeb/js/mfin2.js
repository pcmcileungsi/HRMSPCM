function() {
    $('input').addClass('cls');
    $('textarea').addClass('cls');
    $('select').addClass('cls');
    
    $('input:text:first').focus();
    var $inp = $('.cls');
    $inp.bind('keydown', function(e) {
        
        var key = e.which;
        if (key == 13) {
            e.preventDefault();
            var nxtIdx = $inp.index(this) + 1;
            $(".cls:eq(" + nxtIdx + ")").focus();
        }
    });
    
    
    var $num = $('input[style*="text-align:right"]');
    $num.bind('blur', function(e) {
        $(this).val(jsToCurrency($(this).val()));
    });
    $num.bind('focus', function(e) {
        $(this).val(jsToNumber($(this).val()));
    }); 
}