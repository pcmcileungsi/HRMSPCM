<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="appexclaimdtl.aspx.cs" Inherits="module_approval_appexclaimdtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtSPD_Date');
            jsPopUpDate('ctl00_cphbd_txtTrx_Date');
            jsPopUpDate('ctl00_cphbd_txtTravel_Date');

        });
    </script>
    <div>
        <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="page-0" />
        <asp:HiddenField ID="TabName" runat="server" />
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Approval Expense Claim Detail</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />

                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>No Transaction</span>
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
                                        ImageAlign="AbsMiddle" CausesValidation="false" Enabled="false" />

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
                                <asp:ListItem Value="1">Approve</asp:ListItem>
                                <asp:ListItem Value="2">Reject</asp:ListItem>
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
                    <asp:GridView ID="grvExpenseClaimDetail" runat="server" AutoGenerateColumns="False" EmptyDataText="There is no data." DataKeyNames="ID"
                        GridLines="None" AllowPaging="false" CssClass="mGrid"
                        PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" ShowFooter="true">
                        <Columns>
                            <asp:TemplateField HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                    <span>No</span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Travel_Date" HeaderText="Travel Date" SortExpression="Travel_Date" DataFormatString="{0:dd/MM/yyyy}" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="Cost_Code" HeaderText="Code" SortExpression="Cost_Code" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="Cost_Description" HeaderText="Description" SortExpression="Cost_Description" HeaderStyle-Width="40%" />
                            <asp:BoundField DataField="Cost_Value" HeaderText="Cost" SortExpression="Cost_Value" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
                            <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="5%" />
                            <asp:BoundField DataField="Total_Cost" HeaderText="Total Cost" SortExpression="Total_Cost" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="grvExpenseClaimDetail" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
</asp:Content>

