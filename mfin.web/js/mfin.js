function isValidNumber(source, args) {
    
    args.IsValid = true;
    
    if ( args.Value.length == 0 )
    {
        args.IsValid = false;
        return;
    }
    
    var num = args.Value.replace(/\$|\,/g,'');
        
    if ( isNaN(num) )
    {
        args.IsValid = false;
        return;
    }
}


function isValidDate(source, args){

    args.IsValid = false;
    
    var datetocheck = args.Value;
    
    splitDate = datetocheck.split("/");
    
    var day = splitDate[0];
    var month = splitDate[1]-1;
    var year = splitDate[2];
    
    var newDate = new Date(year, month, day);

    var myDate=new Date()
    myDate.setDate(myDate.getDate()-7)
    
    
    arNumdays = new Array( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    arNumdays1 = new Array( 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    arMonths = new Array("January","February","March","April","May","June","July","August","September","October","November","December");
    
        
    
    if (month >= 12){
        alert ("Please enter a valid month between 1 & 12");
        args.IsValid = false;
        return;    
    }
    
    
    if( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) )arNumdays = arNumdays1;

    if( (day < 0) || (day > arNumdays[month]) )
    {
        alert("The number of days in the month " + arMonths[month] + " can be no greater than " + arNumdays[month] + " or less then 0, please revise the date");
        args.IsValid = false;
        return;
    }
    
    args.IsValid = true;
    return;
}

function jsFormatCurrency(ctrl) {
    $get(ctrl).value = jsToCurrencywocent($get(ctrl).value);
}

function jsFormatCurrencywcent(ctrl) {
    $get(ctrl).value = jsToCurrency($get(ctrl).value);
}

function jsToCurrencywocent(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";

    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    cents = num % 100;

    num = Math.floor(num / 100).toString();

    if (cents < 10)
        cents = "0" + cents;


    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));

    return (((sign) ? '' : '-') + num);
}

function jsToCurrency(num)
{
	num = num.toString().replace(/\$|\,/g,'');
	if ( isNaN(num) )
		num = "0";

	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	
	num = Math.floor(num/100).toString();

	if ( cents < 10 )
		cents = "0" + cents;
	
	
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
		num = num.substring(0,num.length-(4*i+3)) + ',' + num.substring(num.length-(4*i+3));
		
	return (((sign)?'':'-') + num + '.' + cents);
}

function jsConvertToNumber(ctrl) {
    $get(ctrl).value = jsToNumber($get(ctrl).value);
}

function jsToNumber(num)
{
	num = num.toString().replace(/\,/g,'');
	
	if ( isNaN(num) )
		num = "0";

    return num;
}

function jsCheckAll(isChecked) {
    $(".multichb > input").each(function() {
        if (!this.disabled)
            this.checked = isChecked;
    });
}


function jsRoundUp(num, acc) {
    var n = jsToNumber($get(num).value);
    var x = Math.round(n / acc) * acc;
    var y = n - x;

    if (y < 0) //sudah dibulatkan keatas
        x = x
    else if (y % acc != 0)
        x = x + acc;

    $get(num).value = jsToCurrency(x);
}

function jsRoundDown(num, acc) {
    var n = jsToNumber($get(num).value);
    var x = Math.round(n / acc) * acc;
    var y = n - x;



    if (n < acc) {
        $get(num).value = jsToCurrency(0);
    }
    else {
        if (y < 0)
            x = x - acc;
        else if (y < 1)
            x = x;
        else if (y % acc != 0)
            x = x - acc;

        $get(num).value = jsToCurrency(x);
    }
}

function jsPopUpDate(id) {
    var sID = "#" + id;
    $(sID).datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy'
    });
}

function jsPopUpTime(id) {
    var sID = "#" + id;
    $(sID).datetimepicker({
        datepicker: false,
        format: 'H:i',
        step: 5
    });
}


//function checkall(id, id2) {
//    var allCheckBoxSelector = "#" + id ;
//    var checkBoxSelector = "#" + id2 ;

//    function ToggleCheckUncheckAllOptionAsNeeded() {
//        var totalCheckboxes = $(checkBoxSelector),
//            checkedCheckboxes = totalCheckboxes.filter(":checked"),
//            noCheckboxesAreChecked = (checkedCheckboxes.length === 0),
//            allCheckboxesAreChecked = (totalCheckboxes.length === checkedCheckboxes.length);

//        $(allCheckBoxSelector).attr('checked', allCheckboxesAreChecked);
//    }

//    $(document).ready(function() {
//        $(allCheckBoxSelector).live('click', function() {
//            $(checkBoxSelector).attr('checked', $(this).is(':checked'));

//            ToggleCheckUncheckAllOptionAsNeeded();
//        });

//        $(checkBoxSelector).live('click', ToggleCheckUncheckAllOptionAsNeeded);

//        ToggleCheckUncheckAllOptionAsNeeded();
//    });
//}