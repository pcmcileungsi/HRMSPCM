<%@ Page Title="Untitled Page" Language="C#" MasterPageFile="~/mfin.master" AutoEventWireup="true" CodeFile="setengahharidtl.aspx.cs" Inherits="module_master_setengahharidtl" %>

<%@ Register Assembly="MPF23.XUI" Namespace="MPF23.XUI.Control" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphhd" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbd" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var $maintab = $("#pages").tabs();
            jsPopUpDate('ctl00_cphbd_txtSubmissionDate');
            jsPopUpDate('ctl00_cphbd_txtTrxDate');
        });
    </script>
    <div>
        <table id="tblHeader" cellpadding="3px" cellspacing="0px" class="detail-header-table">
            <tr>
                <td colspan="2" style="border-bottom: solid 1px #dedede">
                    <span class="search-header">Izin Pulang Cepat / Datang Terlambat</span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnBack" runat="server" CausesValidation="false" CssClass="back"
                        Text="Back" OnClick="btnBack_Click" />
                    <cc1:XUIButton ID="btnSave" runat="server" CssClass="save" Text="Save" OnClick="btnSave_Click" RoleCode="B000504" />
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="pnlBody" runat="server">
            <ContentTemplate>
                <table id="tblBody" cellpadding="4px" cellspacing="0px" width="100%" border="0px">
                    <tr>
                        <td width="20%">
                            <span>No Leave</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUILabel ID="lblEmployee_ID" runat="server" DataType="Integer" DBColumnName="Employee_ID"
                                BindType="Both" SPParameterName="p_Employee_ID" Text="0"></cc1:XUILabel>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>NIK</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_NIK" runat="server" DataType="String" DBColumnName="Employee_NIK"
                                BindType="Both" SPParameterName="p_Employee_NIK" MaxLength="10" Width="50px" Enabled="false"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqEmployee_NIK" runat="server" ControlToValidate="txtEmployee_NIK"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Employee Name</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtEmployee_Name" runat="server" DataType="String" DBColumnName="Employee_Name"
                                BindType="Both" SPParameterName="p_Employee_Name" MaxLength="100" Width="350px" Enabled="false"></cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="ReqEmployee_Name" runat="server" ControlToValidate="txtEmployee_Name"
                                ErrorMessage="* Harus Diisi" />
                        </td>
                    </tr>

                    <tr>
                        <td width="20%">
                            <span>Submission Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtSubmissionDate" runat="server" DataType="DateTime" DBColumnName="SubmissionDate"
                                BindType="Both" SPParameterName="p_SubmissionDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvSubmissionDate" runat="server" ControlToValidate="txtSubmissionDate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Transaction Date</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtTrxDate" runat="server" DataType="DateTime" DBColumnName="TrxDate"
                                BindType="Both" SPParameterName="p_TrxDate" Width="72px" Format="dd/MM/yyyy"
                                Style="text-align: center; vertical-align: middle;">
                            </cc1:XUITextBox>
                            <asp:RequiredFieldValidator ID="rfvTrxDate" runat="server" ControlToValidate="txtTrxDate"
                                ErrorMessage="* Harus diisi" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Hours</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtHour" runat="server" DataType="String" DBColumnName="Hour"
                                BindType="Both" SPParameterName="p_Hour" MaxLength="5" Width="50px"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Description</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUITextBox ID="txtDescription" runat="server" DataType="String" DBColumnName="Description"
                                BindType="Both" SPParameterName="p_Description" MaxLength="200" Width="350px" Height="50px" TextMode="MultiLine"></cc1:XUITextBox>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <span>Status</span>
                        </td>
                        <td>
                            <span>:</span>
                        </td>
                        <td width="80%">
                            <cc1:XUIDropDownList ID="ddlEmployee_Status" runat="server" DataType="String" DBColumnName="Employee_Status"
                                BindType="Both" SPParameterName="p_Employee_Status" Style="min-width: 250px">
                                <asp:ListItem Value="0">Draft</asp:ListItem>
                                <asp:ListItem Value="1">Approve</asp:ListItem>
                                <asp:ListItem Value="2">Reject</asp:ListItem>
                            </cc1:XUIDropDownList>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

