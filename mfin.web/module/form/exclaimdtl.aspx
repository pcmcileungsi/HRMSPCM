<%@ Page Title="" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="exclaimdtl.aspx.cs" Inherits="module_form_exclaimdtl" %>

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
                jsPopUpDate('ctl00_cphbd_txtTrx_Date');
                jsPopUpDate('ctl00_cphbd_txtTravel_Date');

            });
        }
        //$(document).ready(function () {
        //    jsPopUpDate('ctl00_cphbd_txtVALUEDATE');
        //});

        function jsCalculate() {

            var a = jsToNumber($get('ctl00_cphbd_txtCost_Value').value) / 1
            var b = jsToNumber($get('ctl00_cphbd_txtQty').value) / 1

            $get('ctl00_cphbd_txtTotal_Cost').value = jsToCurrency(a * b);
        }

        //function isNumberKey(evt) {
        //    var charCode = (evt.which) ? evt.which : event.keyCode
        //    if ((charCode >= 48 && charCode <= 57) || charCode == 8 || charCode == 46) return true;

        //    return true;
        //}

    </script>
    <div>
        <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="page-0" />
        <asp:HiddenField ID="TabName" runat="server" />
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Expense Claim Detail</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B100081" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>Transaction No</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtExClaim_No" runat="server" DBColumnName="ExClaim_No"
                                BindType="Both" SPParameterName="p_ExClaim_No" Width="72px" Enabled="false">
                            </cc1:XUITextBox>
                            <cc1:XUILabel ID="lbl_ID" runat="server" DataType="Integer" DBColumnName="ID"
                                BindType="Both" SPParameterName="p_ID" Text="0" Visible="false"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Transaction Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%" colspan="2">
                            <cc1:XUITextBox ID="txtTrx_Date" runat="server" DataType="DateTime" DBColumnName="Trx_Date"
                                BindType="Both" SPParameterName="p_Trx_Date" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;" Enabled="true">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvTrx_Date" runat="server" ControlToValidate="txtTrx_Date"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>SPD No</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <asp:UpdatePanel ID="updSPDInfo" runat="server">
                                <ContentTemplate>
                                    <cc1:XUITextBox ID="txtSPD_No" runat="server" DataType="String" DBColumnName="SPD_No"
                                        BindType="Both" SPParameterName="p_SPD_No" MaxLength="20" Width="78px" Enabled="false">
                                    </cc1:XUITextBox>
                                    <asp:ImageButton ID="imgBtnLookUpSPD" runat="server" ImageUrl="~/img/im4_toolbar_search.png"
                                        ImageAlign="AbsMiddle" CausesValidation="false" OnClick="BtnLookUpSPD_Click" />

                                    <cc1:XUITextBox ID="txtSPD_Date" runat="server" DataType="DateTime"
                                        BindType="Both" Width="72px" Format="dd/MM/yyyy" DBColumnName="SPD_Date" SPParameterName="p_SPD_Date"
                                        Style="text-align: center; vertical-align: middle;" Enabled="false">
                                    </cc1:XUITextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%"><span>Employee</span></td>
                        <td width="1%"><span>:</span></td>
                        <td width="79%">
                            <cc1:XUITextBox ID="txtEmployee_Code" runat="server" DataType="String" DBColumnName="Employee_Code"
                                BindType="Both" SPParameterName="p_Employee_Code" MaxLength="20" Width="58px" ReadOnly="true">
                            </cc1:XUITextBox>
                            <cc1:XUITextBox ID="txtEmployee_Name" runat="server" DataType="String" DBColumnName="Employee_Name" SPParameterName="p_Employee_Name"
                                BindType="DBToUIOnly" MaxLength="250" Width="320px" ReadOnly="true"></cc1:XUITextBox>
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
                                BindType="Both" SPParameterName="p_Destination" Width="400px" ReadOnly="true"></cc1:XUITextBox>
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
                                <asp:ListItem Value="1">Approve1</asp:ListItem>
                                <asp:ListItem Value="2">Approve2</asp:ListItem>
                                <asp:ListItem Value="3">Approve2</asp:ListItem>
                                <asp:ListItem Value="9">Reject</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="pnlshow" runat="server">
            <hr />
            <asp:UpdatePanel ID="UpExpenseClaimDetail" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <cc1:XUIButton ID="btnAddExpenseClaimDetail" runat="server" CssClass="add" Text="Add" OnClick="btnAddExpenseClaimDetail_Click" RoleCode="B100080" />
                    <asp:GridView ID="grvExpenseClaimDetail" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data." DataKeyNames="ID"
                        GridLines="None" AllowPaging="false" CssClass="mGrid" OnRowCommand="grvExpenseClaimDetail_RowCommand" OnRowCreated="grvExpenseClaimDetail_RowCreated"
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
                            <asp:BoundField DataField="Travel_Date" HeaderText="Travel Date" SortExpression="Travel_Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Cost_Code" HeaderText="Code" SortExpression="Cost_Code" />
                            <asp:BoundField DataField="Cost_Description" HeaderText="Description" SortExpression="Cost_Description" />
                            <asp:BoundField DataField="Cost_Value" HeaderText="Cost" SortExpression="Cost_Value" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
                            <asp:BoundField DataField="Total_Cost" HeaderText="Total Cost" SortExpression="Total_Cost" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" />
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
                    <asp:Panel ID="panelDetail" runat="server">
                        <asp:Button ID="btnBackDetail" runat="server" CausesValidation="false" CssClass="back"
                            Text="Close" OnClick="btnBackDetail_Click" />
                        <cc1:XUIButton ID="btnSaveDetail" runat="server" CssClass="save" Text="Save" OnClick="btnSaveDetail_Click" RoleCode="B100081" ValidationGroup="Detail" />
                        <asp:Label ID="lbljudulCost" runat="server" Visible="false"></asp:Label>
                        <table>
                            <tr>
                                <td>Travel Date</td>
                                <td>:</td>
                                <td colspan="5">
                                    <cc1:XUITextBox ID="txtTravel_Date" runat="server" DataType="DateTime" DBColumnName="Travel_Date"
                                        BindType="Both" SPParameterName="p_Travel_Date" Width="72px" Format="dd/MM/yyyy"
                                        Style="text-align: center; vertical-align: middle;" Enabled="true">
                                    </cc1:XUITextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTravel_Date"
                                        ErrorMessage="* Harus diisi" ValidationGroup="Detail" />
                                    <cc1:XUILabel ID="lblIdDetail" runat="server" Visible="false"></cc1:XUILabel>
                                </td>
                            </tr>
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
                                <td>Value</td>
                                <td>:</td>
                                <td>
                                    <cc1:XUITextBox ID="txtCost_Value" runat="server" DataType="Number"
                                        DBColumnName="Cost_Value" SPParameterName="p_Cost_Value" BindType="Both" Width="160px"
                                        Format="N2" Text="0.00" onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtCost_Value');"></cc1:XUITextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCost_Value"
                                        ErrorMessage="* Harus diisi" ValidationGroup="Detail" />
                                </td>
                                <td>x</td>
                                <td>
                                    <cc1:XUITextBox ID="txtQty" runat="server" DataType="Number"
                                        DBColumnName="Qty" SPParameterName="p_Qty" BindType="Both" Width="160px"
                                        Format="N2" Text="0.00" onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtQty');">
                                    </cc1:XUITextBox>
                                </td>
                                <td>=</td>
                                <td>
                                    <cc1:XUITextBox ID="txtTotal_Cost" runat="server" DataType="Number"
                                        DBColumnName="Total_Cost" SPParameterName="p_Total_Cost" BindType="Both" Width="160px" Enabled="false"
                                        Format="N2" Text="0.00" onblur="jsCalculate();jsFormatCurrencywcent('ctl00_cphbd_txtTotal_Cost');">
                                    </cc1:XUITextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="grvExpenseClaimDetail" />
                    <asp:PostBackTrigger ControlID="btnAddExpenseClaimDetail" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>

    <%-- Lookup SPD--%>
    <asp:Panel ID="pnlPopUpGetSPD" runat="server" Width="600px" Style="display: block;">
        <asp:Button Style="display: none" ID="btnShowPopupGetSPD" runat="server"></asp:Button>
        <cc2:ModalPopupExtender ID="mdlPopupGetSPD" runat="server" BehaviorID="mdlPopupGetSPD"
            PopupControlID="pnlPopupGetSPD" TargetControlID="btnShowPopupGetSPD"
            BackgroundCssClass="modalBackground">
        </cc2:ModalPopupExtender>
        <cc2:DragPanelExtender ID="DragPanelExtender1" runat="server" TargetControlID="pnlPopUpGetSPD"
            DragHandleID="pnlPopupGetSPDHeader" />
        <div class="container">
            <asp:Panel ID="pnlPopupGetSPDHeader" runat="server" CssClass="header">
                <asp:Label ID="Label1" runat="server" CssClass="msg" Text="SPD" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="close" OnClientClick="$find('mdlPopupGetSPD').hide(); return false;" CausesValidation="false" />
            </asp:Panel>
            <asp:UpdatePanel ID="upnDetailGetSPD" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="header" align="right">
                        <asp:Panel ID="pnlSearchSPD" runat="server" DefaultButton="btnSearchSPD">
                            <asp:TextBox ID="txtSearchSPD" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearchSPD" OnClick="btnSearchSPD_Click" runat="server"
                                Text="Search" CssClass="search" CausesValidation="false"></asp:Button>
                        </asp:Panel>
                    </div>
                    <div class="body">
                        <asp:GridView ID="gvwListSPD" runat="server" OnSelectedIndexChanged="gvwListSPD_SelectedIndexChanged"
                            DataKeyNames="ID" AutoGenerateColumns="False" EmptyDataText="There is no data."
                            OnRowCreated="gvwListSPD_RowCreated" GridLines="None" AllowPaging="true"
                            PageSize="10" OnPageIndexChanging="gvwListSPD_PageIndexChanging" CssClass="mGrid"
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
                                <asp:BoundField DataField="Employee_Code" HeaderText="NIK" SortExpression="Employee_Code" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                <asp:BoundField DataField="SPD_No" HeaderText="SPD No" SortExpression="SPD_No" />
                                <asp:BoundField DataField="SPD_Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="SPD_Date" />
                                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                                <%--<asp:CommandField ShowSelectButton="True" SelectText="Choose"></asp:CommandField>--%>
                                <asp:ButtonField Text="Choose" CommandName="Select" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="footer">
                        <asp:Button ID="btnCloseSPD" OnClientClick="$find('mdlPopupGetSPD').hide(); return false;"
                            CssClass="void" runat="server" Text="Close" CausesValidation="false"></asp:Button>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="gvwListSPD" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    <%-- End Lookup SPD--%>

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
                <asp:Label ID="Label2" runat="server" CssClass="msg" Text="Cost" />
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

