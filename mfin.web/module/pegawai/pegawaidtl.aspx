<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="pegawaidtl.aspx.cs" Inherits="module_pegawai_pegawaidtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        function pageLoad(sender, args) {
            $(document).ready(function () {
                var $maintab = $("#pages").tabs();
                jsPopUpDate('ctl00_cphbd_txtSPD_Date');
                jsPopUpDate('ctl00_cphbd_txtDepart_Date');
                jsPopUpDate('ctl00_cphbd_txtArrive_Date');
            });
        }

        function jsCalculate() {

            //var a = jsToNumber($get('ctl00_cphbd_txtAMOUNT').value) / 1
            var a = jsToNumber($get('ctl00_cphbd_txtCost_Value').value) / 1
            var b = jsToNumber($get('ctl00_cphbd_txtQty').value) / 1

            $get('ctl00_cphbd_txtTotal_Cost').value = jsToCurrency(a * b);
        }
    </script>

    <div>
        <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="page-0" />
        <asp:HiddenField ID="TabName" runat="server" />
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">SPD Detail</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100075" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>SPD No</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtSPD_No" runat="server" DBColumnName="SPD_No"
                                BindType="Both" SPParameterName="p_SPD_No" Width="72px" Enabled="false">
                            </cc1:XUITextBox>
                            <cc1:XUILabel ID="lbl_ID" runat="server" DataType="Integer" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0" Visible="false"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Employee</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updEmployeeInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtEmployee_Code" runat="server" DataType="String" DBColumnName="Employee_Code"
                                        BindType="Both" SPParameterName="p_Employee_Code" MaxLength="20" Width="48px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpEmployee" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpEmployee_Click" />
                                    <cc1:XUITextBox ID="txtEmployee_Descs" runat="server" DataType="String" DBColumnName="Employee_DESCS"
                                        BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>SPD Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtSPD_Date" runat="server" DataType="DateTime" DBColumnName="SPD_Date"
                                BindType="Both" SPParameterName="p_SPD_Date" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="true">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvSPD_Date" runat="server" ControlToValidate="txtSPD_Date"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Destination</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtDestination" runat="server" DataType="String" DBColumnName="Destination"
                                BindType="Both" SPParameterName="p_Destination" Width="400px"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDestination"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td width="20%">
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUIDropDownList ID="ddlStatus" runat="server" DataType="String" DBColumnName="Status"
                                BindType="Both" SPParameterName="p_Status" Style="min-width: 250px">
                                <asp:ListItem Value="0">Draft</asp:ListItem>
                                <asp:ListItem Value="1">Approve</asp:ListItem>
                                <asp:ListItem Value="2">Reject</asp:ListItem>
                                 <asp:ListItem Value="3">Approve2</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="pnlshow" runat="server">
            <div id="pages" style="margin: 5px 3px">
                <ul style="font-size: smaller">
                    <li><a href="#page-0"><span>Accomodation</span></a></li>
                    <li><a href="#page-1"><span>Task Description</span></a></li>
                    <li><a href="#page-2"><span>Cost Estimation</span></a></li>
                </ul>
                <div id="page-0" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                    <asp:UpdatePanel ID="pnlBody1" runat="server">
                        <ContentTemplate>
                            <table id="tblBody1_0" cellpadding="1px" cellspacing="0px" width="100%" border="0px">
                                <tr>
                                    <td width="20%" valign="top">
                                        <span>Transportation</span>
                                    </td>
                                    <td valign="top">
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2" valign="top">
                                        <cc1:XUIDropDownList ID="ddlTransportation" runat="server" DataType="String" DBColumnName="Transportation"
                                            BindType="Both" SPParameterName="p_Transportation" Style="min-width: 250px">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1" Text="Company Vehicle"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Personal Vehicle"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Train"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Plane"></asp:ListItem>
                                        </cc1:XUIDropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Vehicle Number</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <cc1:XUITextBox ID="txtVehicleNo" runat="server" DataType="String" DBColumnName="VehicleNo"
                                            BindType="Both" SPParameterName="p_VehicleNo" MaxLength="10" Width="150px"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Driver</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <%--      <cc1:XUIDropDownList ID="ddlDriver" runat="server" DataType="String" DBColumnName="Driver"
                                            BindType="Both" SPParameterName="p_Driver" Style="min-width: 250px">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">Driver 1</asp:ListItem>
                                            <asp:ListItem Value="2">Driver 2</asp:ListItem>
                                            <asp:ListItem Value="3">Driver 3</asp:ListItem>
                                            <asp:ListItem Value="4">Driver 4</asp:ListItem>
                                        </cc1:XUIDropDownList>--%>
                                        <cc1:XUITextBox ID="txtDriver" runat="server" DataType="String" DBColumnName="Driver"
                                            BindType="Both" SPParameterName="p_Driver" MaxLength="100" Width="200px"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Hotel</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <cc1:XUITextBox ID="txtHotel" runat="server" DataType="String" DBColumnName="Hotel"
                                            BindType="Both" SPParameterName="p_Hotel" MaxLength="100" Width="350px"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Cash Advanced</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">

                                        <cc1:XUITextBox ID="txtCash_Advance" runat="server" DataType="Number" DBColumnName="Cash_Advance"
                                            BindType="Both" SPParameterName="p_Cash_Advance" Width="150px" Format="N2" Enabled="false"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><span>Bank Name</span></td>
                                    <td width="1%"><span>:</span></td>
                                    <td width="79%">
                                        <cc1:XUITextBox ID="txtBank_Name" runat="server" DataType="String" DBColumnName="Bank_Name" SPParameterName="p_Bank_Name"
                                            BindType="Both" MaxLength="50" Width="350px"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><span>Account No</span></td>
                                    <td width="1%"><span>:</span></td>
                                    <td width="79%">
                                        <cc1:XUITextBox ID="txtAccount_No" runat="server" DataType="String" DBColumnName="Account_No"
                                            BindType="Both" SPParameterName="p_Account_No" MaxLength="30" Width="150px">
                                        </cc1:XUITextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%"><span>Account Name</span></td>
                                    <td width="1%"><span>:</span></td>
                                    <td width="79%">
                                        <cc1:XUITextBox ID="txtAccount_Name" runat="server" DataType="String" DBColumnName="Account_Name" SPParameterName="p_Account_Name"
                                            BindType="Both" MaxLength="50" Width="350px"></cc1:XUITextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <span>Description</span>
                                    </td>
                                    <td>
                                        <span>:</span>
                                    </td>
                                    <td width="80%" colspan="2">
                                        <cc1:XUITextBox ID="txtDescription" runat="server" DataType="String" DBColumnName="Description"
                                            BindType="Both" SPParameterName="p_Description" MaxLength="200" Width="350px" Height="50px" TextMode="MultiLine"></cc1:XUITextBox>
                                    </td>
                                </tr>

                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="page-1" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                    <asp:UpdatePanel ID="UpTask" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <cc1:XUIButton ID="btnAddTask" runat="server" CssClass="add" Text="Add" OnClick="btnAddTask_Click" RoleCode="B100074" />
                            <asp:GridView ID="grvTask" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data." DataKeyNames="ID"
                                GridLines="None" AllowPaging="false" CssClass="mGrid" OnRowCommand="grvTask_RowCommand" OnRowCreated="grvTask_RowCreated"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <span>No</span>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Description_Task" HeaderText="Task Description" SortExpression="Description_Task" />
                                    <asp:BoundField DataField="Depart_Date" HeaderText="Departure Date" SortExpression="Depart_Date" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="Arrive_Date" HeaderText="Arriving Date" SortExpression="Arrive_Date" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="City_Destination" HeaderText="City Destination" SortExpression="City_Destination" />
                                    <asp:BoundField DataField="Contact_Person" HeaderText="Contact Person" SortExpression="Contact_Person" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="EditRow"
                                                ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="DeleteRow " OnClientClick="return confirm('Are you sure you want to delete this event?');"
                                                ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="grvTask" />
                            <asp:PostBackTrigger ControlID="btnAddTask" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div id="page-2" class="ui-corner-bottom" style="padding: 2px 2px; background-color: #eeeeff; color: #000; height: 430px; overflow-y: auto">
                    <asp:UpdatePanel ID="UpCost" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <cc1:XUIButton ID="btnAddCost" runat="server" CssClass="add" Text="Add" OnClick="btnAddCost_Click" RoleCode="B100074" />
                            <asp:Panel ID="panelDetail" runat="server" Visible="false">
                                <hr />
                                <span class="search-header">
                                    <bold><asp:Label ID="lbljudulCost" runat="server" ></asp:Label>&nbsp;Cost</bold>
                                </span>
                                <br />
                                <asp:Button ID="btnBackDetail" runat="server" CausesValidation="false" CssClass="back"
                                    Text="Close" OnClick="btnBackDetail_Click" />
                                <cc1:XUIButton ID="btnSaveCost" runat="server" CssClass="save" Text="Save" OnClick="btnSaveCost_Click" RoleCode="B100075" ValidationGroup="Cost" />
                                <cc1:XUILabel ID="lblIDCost" runat="server" DataType="Integer" DBColumnName="ID"
                                    BindType="Both" SPParameterName="p_ID" Text="0" Visible="false"></cc1:XUILabel>
                                <table>
                                    <tr>
                                        <td width="20%"><span>Description</span></td>
                                        <td width="1%"><span>:</span></td>
                                        <td width="79%" colspan="5">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <cc1:XUITextBox ID="txtCost_Code" runat="server" DataType="String" DBColumnName="Cost_Code"
                                                        BindType="Both" SPParameterName="p_Cost_Code" MaxLength="20" Width="71px" Enabled="false">
                                                    </cc1:XUITextBox>
                                                    <asp:ImageButton ID="imgCost" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpCost_Click" />
                                                    <cc1:XUITextBox ID="txtCost_Description" runat="server" DataType="String" DBColumnName="Cost_Description"
                                                        BindType="Both" SPParameterName="p_Cost_Description" Width="310px"></cc1:XUITextBox>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Cost</td>
                                        <td>:</td>
                                        <td>
                                            <cc1:XUITextBox ID="txtCost_Value" runat="server" DataType="Number"
                                                DBColumnName="Cost_Value" SPParameterName="p_Cost_Value" BindType="Both" Width="160px" Enabled="true"
                                                Format="N2" Text="0.00" onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtCost_Value');">
                                            </cc1:XUITextBox>
                                        </td>
                                        <td style="width: 7px; text-align: center">x</td>
                                        <td>

                                            <cc1:XUITextBox ID="txtQty" runat="server" DataType="Number"
                                                DBColumnName="Qty" SPParameterName="p_Qty" BindType="Both" Width="50px" MaxLength="2"
                                                onblur="jsCalculate();" Format="N0">
                                            </cc1:XUITextBox>
                                        </td>
                                        <td style="width: 7px">=</td>
                                        <td>
                                            <cc1:XUITextBox ID="txtTotal_Cost" runat="server" DataType="Number"
                                                DBColumnName="Total_Cost" SPParameterName="p_Total_Cost" BindType="Both" Width="160px" Enabled="false"
                                                Format="N2" Text="0.00" onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtTotal_Cost');">
                                            </cc1:XUITextBox>
                                        </td>
                                    </tr>
                                </table>
                                <hr />
                            </asp:Panel>
                            <asp:GridView ID="grvCost" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data." DataKeyNames="ID"
                                GridLines="None" AllowPaging="false" CssClass="mGrid" OnRowCommand="grvCost_RowCommand" OnRowCreated="grvCost_RowCreated"
                                PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" ShowFooter="true">
                                <Columns>
                                    <asp:TemplateField>
                                        <HeaderTemplate>
                                            <span>No</span>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Cost_Code" HeaderText="Code" SortExpression="Cost_Code" HeaderStyle-Width="15%" />
                                    <asp:BoundField DataField="Cost_Description" HeaderText="Description" SortExpression="Cost_Description" HeaderStyle-Width="45%" />
                                    <asp:BoundField DataField="Cost_Value" HeaderText="Cost" SortExpression="Cost_Value" DataFormatString="{0:N2}" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" DataFormatString="{0:N0}" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="Total_Cost" HeaderText="Total" SortExpression="Total_Cost" DataFormatString="{0:N2}" HeaderStyle-Width="28%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CommandName="EditRow"
                                                ImageUrl="~/img/im4_grid_edit.png" ToolTip="Edit" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="DeleteRow " OnClientClick="return confirm('Are you sure you want to delete this event?');"
                                                ImageUrl="~/img/im4_grid_delete.png" ToolTip="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="grvCost" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </asp:Panel>

    </div>
    <%-- Lookup Employee--%>
    <asp:Panel ID="pnlPopUpGetEmployee" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetEmployee" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetEmployee" runat="server" BehaviorID="mdlPopupGetEmployee"
            PopupControlID="pnlPopupGetEmployee" TargetControlID="btnShowPopupGetEmployee"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender16" runat="server" TargetControlID="pnlPopUpGetEmployee"
            DragHandleID="pnlPopupGetEmployeeHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetEmployeeHeader" runat="server" CssClass="header">
                <asp:Label ID="Label15" runat="server" CssClass="msg" Text="Employee" />
                <asp:LinkButton ID="LinkButton15" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetEmployee').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetEmployee" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchEmployee" runat="server" DefaultButton="btnSearchEmployee">
                            <asp:TextBox ID="txtSearchEmployee" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchEmployee" OnClick="btnSearchEmployee_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListEmployee" runat="server" OnSelectedIndexChanged="gvwListEmployee_SelectedIndexChanged"
                            DataKeyNames="Employee_NIK,Employee_Name" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListEmployee_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListEmployee_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Employee_NIK" HeaderText="NIK" SortExpression="Employee_NIK" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="BranchName" HeaderText="BranchName" SortExpression="BranchName" />
                                <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade" SortExpression="GRADEName" />
                                <asp:BoundField DataField="Employee_Hp" HeaderText="Hp" SortExpression="Employee_Hp" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseEmployee" OnClientClick="$find('mdlPopupGetEmployee').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Employee--%>
    <%-- Lookup Task--%>
    <asp:Panel ID="pnlPopUpGetTask" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetTask" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetTask" runat="server" BehaviorID="mdlPopupGetTask"
            PopupControlID="pnlPopupGetTask" TargetControlID="btnShowPopupGetTask"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopUpGetTask"
            DragHandleID="pnlPopupGetTaskHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetTaskHeader" runat="server" CssClass="header">
                <asp:Label ID="lbljudulTask" runat="server" CssClass="msg" />&nbsp;<bold>Task</bold>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetTask').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetTask" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <div class="body">
                        <table>
                            <tr>
                                <td width="20%">
                                    <span>Departure Date</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td width="80%">
                                    <cc1:XUITextBox ID="txtDepart_Date" runat="server" DataType="DateTime" DBColumnName="Depart_Date"
                                        BindType="Both" SPParameterName="p_Depart_Date" Width="72px" Format="dd/MM/yyyy"
                                        Style="text-align: center; vertical-align: middle;" Enabled="true">
                                    </cc1:XUITextBox>
                                    <cc1:XUILabel ID="lblIDTask" runat="server" DataType="Integer" DBColumnName="ID"
                                        BindType="Both" SPParameterName="p_ID" Text="0" Visible="false"></cc1:XUILabel>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDepart_Date"
                                        ErrorMessage="* Harus diisi" ValidationGroup="Task" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Arrive Date</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtArrive_Date" runat="server" DataType="DateTime" DBColumnName="Arrive_Date"
                                        BindType="Both" SPParameterName="p_Arrive_Date" Width="72px" Format="dd/MM/yyyy"
                                        Style="text-align: center; vertical-align: middle;" Enabled="true">
                                    </cc1:XUITextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtArrive_Date"
                                        ErrorMessage="* Harus diisi" ValidationGroup="Task" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>City Destination</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtCity_Destination" runat="server" DataType="String" DBColumnName="City_Destination"
                                        BindType="Both" SPParameterName="p_City_Destination" MaxLength="100" Width="350px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Contact Person</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtContact_Person" runat="server" DataType="String" DBColumnName="Contact_Person"
                                        BindType="Both" SPParameterName="p_Contact_Person" MaxLength="50" Width="350px"></cc1:XUITextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span>Description</span>
                                </td>
                                <td>
                                    <span>:</span>
                                </td>
                                <td>
                                    <cc1:XUITextBox ID="txtDescription_Task" runat="server" DataType="String" DBColumnName="Description_Task"
                                        BindType="Both" SPParameterName="p_Description_Task" MaxLength="50" Width="350px"></cc1:XUITextBox>
                                    &nbsp;&nbsp;
                                       
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div class="footer">
                        <cc1:XUIButton ID="btnEditTask" runat="server" CssClass="save" Text="Save" OnClick="btnEditTask_Click" RoleCode="B100075" ValidationGroup="Task" />
                        <asp:Button ID="btnCloseTask" OnClientClick="$find('mdlPopupGetTask').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Task--%>
    <%-- Lookup Cost--%>
    <asp:Panel ID="pnlPopUpGetCost" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetCost" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetCost" runat="server" BehaviorID="mdlPopupGetCost"
            PopupControlID="pnlPopupGetCost" TargetControlID="btnShowPopupGetCost"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender2" runat="server" TargetControlID="pnlPopUpGetCost"
            DragHandleID="pnlPopupGetCostHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetCostHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="Cost" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetCost').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetCost" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchCost" runat="server" DefaultButton="btnSearchCost">
                            <asp:TextBox ID="txtSearchCost" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchCost" OnClick="btnSearchCost_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListCost" runat="server" OnSelectedIndexChanged="gvwListCost_SelectedIndexChanged"
                            DataKeyNames="CostCode,Description,Cost" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListCost_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListCost_PageIndexChanging" CssClass="mGrid"
                            PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <span>No</span>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:BoundField DataField="GRADECode" HeaderText="Code" SortExpression="GRADECode" />
                                <asp:BoundField DataField="GRADEName" HeaderText="Grade Name" SortExpression="GRADEName" />--%>
                                <asp:BoundField DataField="CostCode" HeaderText="Cost Code" SortExpression="CostCode" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
                                <asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseCost" OnClientClick="$find('mdlPopupGetCost').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup Cost--%>
</asp:Content>

