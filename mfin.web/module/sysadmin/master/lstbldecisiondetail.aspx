<%@ Page Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="lstbldecisiondetail.aspx.cs" Inherits="module_sysadmin_master_lstbldecisiondetail" Title="Untitled Page" %>
<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" Runat="Server">    
    <script type="text/javascript">
        $(document).ready(function() {
            jsPopUpDate('ctl00_cphbd_txtEffDate');
        });
    </script>
     <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Data Level Approval</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B000502" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr style="display: none">
                        <td width="20%">
                            <span>ID</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblLSTBLDECISIONID" runat="server" DataType="Integer" DBColumnName="LS_TBLDECISIONID"
                                BindType="Both" SPParameterName="p_ls_tbldecisionid" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Name</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="txtUsername" runat="server" DataType="String" DBColumnName="USERNAME"
                                BindType="Both" SPParameterName="p_username"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Effrate Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEffDate" runat="server" DataType="DateTime" Format="dd/MM/yyyy" DBColumnName="EFF_DATE"
                                BindType="Both" SPParameterName="p_eff_date" Width="64px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Currency</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlCurrency" runat="server" DataType="String" DBColumnName="CURRENCY"
                                BindType="Both" SPParameterName="p_currency"></cc1:XUIDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Limit</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtAmount" runat="server" DataType="Number" Format="N2" DBColumnName="AMOUNT"
                                BindType="Both" SPParameterName="p_amount" Text="0.00"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="reqAmount" runat="server" ControlToValidate="txtAmount"
                                ErrorMessage="* Harus Diisi" />
                            <asp:RegularExpressionValidator ID="revAmount" runat="server" ControlToValidate="txtAmount"
                                ValidationExpression="[0-9.,]+" ErrorMessage="* Hanya boleh diisi dengan angka" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

