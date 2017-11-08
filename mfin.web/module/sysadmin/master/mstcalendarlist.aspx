<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="mstcalendarlist.aspx.cs" Inherits="module_sysadmin_master_mstcalendarlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
   
<div class="row">
	<div class="panel panel-default">		
          <div class="panel-footer">
        <table style="width: 100%">
             <tbody>
                    <tr>
					 <td style="width: 40%">
                         <span>Tahun</span>
                       <%--  <asp:TextBox ID="txtYear" MaxLength="4" runat="server" Text="2017"></asp:TextBox>--%>
                          <asp:DropDownList ID="txtYear" runat="server"></asp:DropDownList>
                          <button type="button" id="btnSearch">Search</button>                                         
                          <button type="button" id="btnClear">Clear</button>
                    </td>
                     <td style="text-align: right">					
                        <button type="button" id="btnEdit">Edit</button>                   
                        <button type="button" id="btnUpdate">Update</button>
                        <button type="button" id="btnCancel">Cancel</button>
                    </td>
				</tr>
                 </tbody>
			</table>
		</div>
	</div>
	<div class="panel panel-default" style="min-height:400px; width:100%; position:relative">
		<div id="calendar" style="padding-top:20px"	></div>
	</div>
</div>  
    
    <script type ="text/javascript">
        var y, d, m;
        var a = [];
        var _date;
        var pad = "00";
        var ids_1 = [];
        var ids_2 = [];

        var mode = "init";

        $(document).ready(function () {
            on_clear();
            on_load();            
        });

        function onUpload() {
            on_search();
         }

        $('#btnSearch').click(function () {            
            on_search();
        });

        $('#btnClear').click(function () {
            on_clear();
        });

        $('#btnEdit').click(function () {
            on_edit();
        });

        $('#btnCancel').click(function () {
            on_load();
            on_search();
        });

        $('#btnUpdate').click(function () {
            on_update();
            on_load();
            on_search();
        });

        function on_update() {
            $.ajax({
                type: 'POST',
                url: "mstcalendarlist.aspx/update",
                data: '{ date_flag : "' + ids_1.join('|') + '", date_unflag : "' + ids_2.join('|') + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    on_search();
                }
            });
        }

        function on_edit() {
            mode = "edit";
            $('#btnEdit').css('display', 'none');
            $('#btnCancel').css('display', '');
            $('#btnUpdate').css('display', '');
            $('#txtYear').attr('disabled', '');
            $('#btnClear').attr('disabled', '');
            $('#btnSearch').attr('disabled', '');
        }

        function click_unflagged_date(ele) {
            var element = $(ele).closest('div');
            if (mode == "edit") {
                var id = element.children('span').html()

                if (element.hasClass('unflagged_edited') == false) {
                    $(ele).closest('div').addClass('unflagged_edited');
                } else {
                    $(ele).closest('div').removeClass('unflagged_edited');
                }

                push_array(id, ids_1);
            }
        }

        function click_flagged_date(ele) {
            var element = $(ele).closest('div');
            if (mode == "edit") {
                var id = element.children('span').html()

                if (element.hasClass('flagged_edited') == false) {
                    $(ele).closest('div').addClass('flagged_edited');
                } else {
                    $(ele).closest('div').removeClass('flagged_edited');
                }

                push_array(id, ids_2);
            }
        }

        function on_clear() {
            $('#txtYear').val('');
            $('#calendar').empty();
            $('#btnEdit').attr('disabled', '');
        }

        function on_load() {
            $('#btnEdit').css('display', '').attr('disabled', '');
            $('#btnCancel').css('display', 'none');
            $('#btnUpdate').css('display', 'none');
            $('#txtYear').removeAttr('disabled', '');
            $('#btnSearch').removeAttr('disabled', '');
            $('#btnClear').removeAttr('disabled', '');
            mode = "init";
            ids_1 = [];
            ids_2 = [];
        }

        function push_array(id, ids) {
            var index = ids.indexOf(id);
            if (index > -1) {
                ids.splice(index, 1);
            } else {
                ids.push(id);
            }
        }

        function on_search() {
            $.ajax({
                type: 'POST',
                url: "mstcalendarlist.aspx/getData",
                data: '{ YEAR : "' + $("#<%=txtYear.ClientID%>")[0].value + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {

                    //debugger
                    if (r.d.total > 0) {

                        a = [];

                        r.d.data.forEach(function (dt) {
                            a.push(dt.DATE);
                        });

                        function calendar(month) {


                            // Variables to be used later. Place holders right now.
                            var padding = "";
                            var totalFeb = "";
                            var i = 1;
                            var testing = "";

                            var current = new Date("01/01/" + $("#<%=txtYear.ClientID%>")[0].value);
                        var year = current.getFullYear();
                        var tempMonth = month + 1;
                        var prevMonth = month - 1;

                        // Determing if Feb has 28 or 29 days in it.  
                        if (month == 1) {
                            if ((year % 100 !== 0) && (year % 4 === 0) || (year % 400 === 0)) {
                                totalFeb = 29;
                            } else {
                                totalFeb = 28;
                            }
                        }

                        var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                        var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday"];
                        var totalDays = ["31", "" + totalFeb + "", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"];

                        var tempDate = new Date(tempMonth + ' 1 ,' + year);
                        var tempweekday = tempDate.getDay();
                        var tempweekday2 = tempweekday;
                        var dayAmount = totalDays[month];

                        while (tempweekday > 0) {
                            padding += "<td class='premonth'></td>";
                            tempweekday--;
                        }

                        while (i <= dayAmount) {
                            y = $("#<%=txtYear.ClientID%>")[0].value;
                            m = (month + 1).toString().length < 2 ? "0" + (month + 1).toString() : (month + 1).toString();
                            d = i.toString().length < 2 ? "0" + i.toString() : i.toString();

                            _date = y + "-" + m + "-" + d;
                            var dtN = new Date(_date);

                            if (tempweekday2 > 6) {
                                tempweekday2 = 0;
                                padding += "</tr><tr>";
                            }

                            var x = a.toString();
                            if (x.includes(_date) == true) {
                                padding += "<td class='currentmonth' onMouseOver='this.style.background=\"#eee\"' onMouseOut='this.style.background=\"#fff\"'>";
                                padding += "<div id='" + _date + "'>";
                                padding += "<span style='display:none'>" + _date + "</span>";
                                padding += "<a href='javascript:;' onclick='click_unflagged_date(this)'>" + i + "</a>";
                                padding += "</div>";
                                padding += "</td>";
                            }
                            else {
                                padding += "<td class='currentmonth' style=\"background-color:red;\" onMouseOver='this.style.background=\"#eee\"' onMouseOut='this.style.background=\"red\"'>";
                                padding += "<div id='" + _date + "'>";
                                padding += "<span style='display:none'>" + _date + "</span>";
                                padding += "<a href='javascript:;' onclick='click_flagged_date(this)'>" + i + "</a>";
                                padding += "</div>";
                                padding += "</td>";
                            }

                            tempweekday2++;
                            i++;
                        }

                        var calendarTable = "<table class='calendar' style='margin-top: -18px'> <tr class='currentmonth'><th colspan='7'>" + monthNames[month] + " " + year + "</th></tr>";
                        calendarTable += "<tr class='weekdays'>  <td>S</td>  <td>M</td> <td>T</td> <td>W</td> <td>T</td> <td>F</td> <td>S</td> </tr>";
                        calendarTable += "<tr>";
                        calendarTable += padding;
                        calendarTable += "</tr></table>";
                        document.getElementById("calendar").innerHTML += calendarTable;
                    }

                    function go12() {
                        for (i = 0; i < 12; i++) {
                            calendar(i);
                        }
                    }

                    $('#calendar').empty().html(go12);

                    $('#btnEdit').removeAttr('disabled', '');
                    }
                    else {
                        var YEAR = document.getElementById('<%=txtYear.ClientID %>').value;                       
                        PageMethods.insertData(YEAR, onSucess, onError);

                        function onSucess(result) {
                            PageMethods.getData(YEAR, onSucess2, onError2);                           
                        }
                        function onError(result) {
                            alert('error');
                        }
                        function onSucess2(r) {
                            if (r.total > 0) {
                               $('[id*=btnSearch]').click();
                            }
                            //alert(r.total);
                        }
                        function onError2(r) {
                            alert(result);
                        }
                        //$.ajax({
                        //    type: "POST",
                        //    url: "mstcalendarlist.aspx/insertData",
                        //    data: '{ YEAR : "' + $("#<%=txtYear.ClientID%>")[0].value + '" }',
                        //    success: function (data) {
                        //        on_search();
                        //    }
                        //});
                    }
                }
            });
    }
</script>      

 <style type="text/css">
    .calendar a {
        color: #000;
        text-decoration: none;
    }

    .currentmonth {
        color: #000;
        text-align: center;
    }

    .flagged div
    {
        border: 1px solid #000;
    }

        .flagged div a {
            color: #2B00FF;
        }

    .currentday {
        color: #428BCA;
        text-align: center;
        font-weight: bold;
        background-color: #eee;
    }

    tr.weekdays {
        background-color: #EEE;
    }

    table.calendar {
        margin: 1em 1em 2em 1em;
    }

    table.calendar th {
        padding: 0.5px;
        width:50px;
        text-align:left;
    }
        
    table.calendar td {
        padding: 0.5px;
        width: 50px;
        text-align: center;
    }

    table.calendar {
        display: inline-block;
        *display: inline;
        zoom: 1;
        vertical-align: top;
        width: 22%;
        background-color: #fff;
    }

    .unflagged_edited{
        border:1px dashed #000;
    }

    .flagged_edited {
        border-radius: 20px;
        border: 1px solid #000;
    }
</style>

</asp:Content>
